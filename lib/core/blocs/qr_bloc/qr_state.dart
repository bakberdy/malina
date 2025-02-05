part of 'qr_bloc.dart';

sealed class QrState extends Equatable {
  const QrState();
  
  @override
  List<Object> get props => [];
}

final class QrInitial extends QrState {}
final class QrScanned extends QrState {
  final ProductModel product;

  const QrScanned({required this.product});
}
final class QrError extends QrState {
  final String error;
  const QrError(this.error);
}
final class QrLoading extends QrState {}


