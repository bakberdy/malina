
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:malina/core/core.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    super.key,
    required this.onItemTapped,
    required this.currentIndex,
  });
  final ValueChanged<int> onItemTapped;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      padding: EdgeInsets.all(0),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              offset: Offset(15, 0),
              blurRadius: 30,
              spreadRadius: 0,
            ),
          ],
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(12),
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildNavItem(lentaIcon, index: 0),
          _buildNavItem(favoriteIcon, index: 1),
          _qrItem(),
          _buildNavItem(profileIcon, index: 3),
          _cartItem(),
        ],
      ),
    );
  }

  Widget _qrItem() {
    return GestureDetector(
      onTap: ()=>onItemTapped(2),
      child: Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.primary,
          ),
          child: Center(
            child: SvgPicture.asset(
              qrIcon,
              colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
            ),
          )),
    );
  }

  PopupMenuButton<int> _cartItem() {
    return PopupMenuButton<int>(
      menuPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
      position: PopupMenuPosition.under,
      surfaceTintColor: Colors.white,
      color: Colors.white,
      elevation: 2,
      constraints: BoxConstraints.tightFor(width: 80),
      padding: EdgeInsets.zero, // Removes default padding
      tooltip: '',
      onSelected: onItemTapped,
      icon: _buildNavItem(
        isActive: currentIndex==5,
        cartIcon,
        disabled: true,
        index: 4,
      ),
      shape: RoundedRectangleBorder(
        // Applies rounded corners to the whole menu
        borderRadius: BorderRadius.circular(50),
      ),
      itemBuilder: (context) {
        return [
          PopupMenuItem(
            value: 4,
            child: SizedBox(
              width: 60, // Sets the width of the menu item
              child: _buildNavItem(foodItemIcon,
                  index: 4, disabled: false, isTransparent: true),
            ),
          ),
          PopupMenuItem(
            value: 5,
            child: SizedBox(
              width: 60,
              child: _buildNavItem(prodictIcon,
                  index: 5, disabled: false, isTransparent: true),
            ),
          ),
          PopupMenuItem(
            enabled: false,
            child: SizedBox(
              width: 60,
              child: _buildNavItem(cartIcon,
                  index: 4, disabled: true, isActive: true),
            ),
          ),
        ];
      },
    );
  }

  _buildNavItem(String path,
      {required int index,
      bool disabled = false,
      bool isActive = false,
      bool isTransparent = false}) {
    return GestureDetector(
      onTap: !disabled ? () => onItemTapped(index) : null,
      child: SizedBox(
          height: 60,
          width: 60,
          child: Center(
            child: SvgPicture.asset(
              path,
              colorFilter: isTransparent
                  ? null
                  : ColorFilter.mode(
                      currentIndex == index || isActive
                          ? AppColors.primary
                          : AppColors.inactiveIcon,
                      BlendMode.srcIn),
            ),
          )),
    );
  }
}