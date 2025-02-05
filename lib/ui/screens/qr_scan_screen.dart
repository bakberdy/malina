import 'dart:developer';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:malina/core/blocs/cart_bloc/cart_bloc_bloc.dart';
import 'package:malina/core/blocs/qr_bloc/qr_bloc.dart';
import 'package:malina/core/core.dart';
import 'package:malina/core/route/app_router.gr.dart';
import 'package:qr_code_scanner_plus/qr_code_scanner_plus.dart';

@RoutePage()
class QrScanScreen extends StatefulWidget {
  const QrScanScreen({super.key});

  @override
  State<QrScanScreen> createState() => _QrScanScreenState();
}

class _QrScanScreenState extends State<QrScanScreen> {
  String? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller?.pauseCamera();
    }
    controller?.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<QrBloc, QrState>(
        listener: (context, state) {
          if (state is QrScanned) {
            context.read<CartBloc>().add(AddToCartEvent(product: state.product));
            context.router.replace(
                state.product.isFood ? FoodCartRoute() : ProductCartRoute());
          } else if (state is QrError) {
            BotToast.showText(text: state.error, contentColor: Colors.red);
            _refreshQr();
          }
        },
        child: Stack(
          children: [
            QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
              overlay: QrScannerOverlayShape(
                overlayColor: Colors.black.withAlpha(240),
                borderColor: Colors.white,
                borderRadius: 0,
                borderLength: 30,
                borderWidth: 3,
                cutOutBottomOffset: 10,
                cutOutSize: 300,
              ),
              onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
            ),
            Positioned(
              right: 0,
              left: 0,
              top: MediaQuery.of(context).size.height * 0.25,
              child: Center(
                child: Text(
                  'Поместите QR-код в рамку',
                  style: TextStyle(color: AppColors.whiteTextColor),
                ),
              ),
            ),
            Positioned(
              top: 55,
              right: 20,
              child: IconButton(
                onPressed: () {
                  context.router.maybePop();
                },
                icon: SvgPicture.asset(xIcon),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _refreshQr() async {
    context.read<QrBloc>().add(RefreshQR());
    await controller?.resumeCamera();
  }

  void _checkQr(String? data) {
    if (data != null) {
      context.read<QrBloc>().add(QrDataCheck(data));
      _refreshQr();
    } else {
      BotToast.showText(
        text: 'Вы пока не отсканировали QR-код',
        contentColor: Colors.red,
      );
    }
  }

  void _onQRViewCreated(QRViewController controller) {
    if (!mounted) return;
    setState(() {
      this.controller = controller;
    });

    controller.scannedDataStream.listen((scanData) async {
      if ((scanData.code?.isNotEmpty ?? false) && mounted) {
        result = scanData.code;
        await controller.pauseCamera();
        _checkQr(scanData.code);
      }
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Нет разрешения на камеру')),
      );
    }
  }
}
