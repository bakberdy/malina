part of 'qr_bloc.dart';

sealed class QrEvent extends Equatable {
  const QrEvent();

  @override
  List<Object> get props => [];
}

class QrDataCheck extends QrEvent {
  final String qrData;

  const QrDataCheck(this.qrData);

  @override
  List<Object> get props => [qrData];
}

class RefreshQR extends QrEvent {}
