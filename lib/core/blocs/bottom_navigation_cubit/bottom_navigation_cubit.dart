import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'bottom_navigation_state.dart';

class BottomNavigationCubit extends Cubit<BottomNavigationState> {
  BottomNavigationCubit() : super(BottomNavigationPage(0));


  void changeTab(int index) {
    emit(BottomNavigationPage(index));
  }
}
