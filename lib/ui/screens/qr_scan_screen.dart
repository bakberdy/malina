import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

@RoutePage()
class QrScanScreen extends StatelessWidget {
  const QrScanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: Text('Qr screen'),),
    );
  }
}