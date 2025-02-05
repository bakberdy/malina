import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:malina/core/models/product_model.dart';

part 'qr_event.dart';
part 'qr_state.dart';

class QrBloc extends Bloc<QrEvent, QrState> {
  QrBloc() : super(QrInitial()) {
    on<QrDataCheck>((event, emit) {
      try{
        final product = ProductModel.fromJson(jsonDecode(event.qrData) as Map<String, dynamic>);
        emit(QrScanned(product: product));
      }catch(e){
        emit(QrError('Возникли ошибки, или QR неверный ${e}'));
      }
    });
    on<RefreshQR>((event, emit) {
      emit(QrInitial());
    });

  }
}
