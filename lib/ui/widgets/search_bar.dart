import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:malina/core/core.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: Color(0xff5f6773).withAlpha(30),
            offset: Offset(0, 2),
            blurRadius: 20,
            spreadRadius: 0)
      ]),
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none),
          fillColor: Colors.white,
          filled: true,
          contentPadding: EdgeInsets.all(12),
          prefixIcon: SvgPicture.asset(searchIcon),
          hintText: 'Искать в малина',
          hintStyle: TextStyle(
            color: AppColors.secondaryTextColor,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
