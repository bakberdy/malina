part of 'bottom_navigation_cubit.dart';

@immutable
sealed class BottomNavigationState {
  final int pageIndex;

  const BottomNavigationState(this.pageIndex);
}

final class BottomNavigationPage extends BottomNavigationState {

  const BottomNavigationPage(super.pageIndex);
}
