import 'package:flutter/material.dart';
import '../../core/core.dart';

class SelectFoodStatusButton extends StatelessWidget {
  const SelectFoodStatusButton({
    super.key,
    required this.isSelected,
    required this.text,
    required this.onTap,
  });

  final bool isSelected;
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: MediaQuery.of(context).size.width / 2 - 25,
      child: FilledButton(
        onPressed: onTap,
        style: ButtonStyle(
          overlayColor: WidgetStatePropertyAll(
              AppColors.secondaryTextColor.withAlpha(30)),
          foregroundColor: WidgetStatePropertyAll(
              AppColors.secondaryTextColor.withAlpha(30)),
          shadowColor: WidgetStatePropertyAll(
              AppColors.secondaryTextColor.withAlpha(30)),
          alignment: Alignment.center,
          backgroundColor: WidgetStatePropertyAll(
              isSelected ? AppColors.primary : Colors.transparent),
          padding: WidgetStatePropertyAll(
            EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          ),
          surfaceTintColor: WidgetStatePropertyAll(Colors.transparent),
          side: WidgetStatePropertyAll(
            BorderSide(
              color: isSelected
                  ? Colors.transparent
                  : AppColors.secondaryTextColor.withAlpha(80),
              width: 1,
            ),
          ),
        ),
        child: Text(text,
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: isSelected
                    ? AppColors.whiteTextColor
                    : AppColors.textColor)),
      ),
    );
  }
}
