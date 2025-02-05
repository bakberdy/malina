
import 'package:flutter/material.dart';

import '../../core/core.dart';

class InformationBanner extends StatelessWidget {
  const InformationBanner({
    super.key,
    required this.title,
    required this.description,
    required this.bgImage,
    required this.bgColor,
    required this.onTap,
  });

  final String title;
  final String description;
  final String bgImage;
  final Color bgColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.only(top: 20, left: 17),
        height: 170,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: bgColor,
            image: DecorationImage(
                image: AssetImage(
                  bgImage,
                ),
                fit: BoxFit.cover)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style: TextStyle(
                  color: AppColors.textColor,
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                )),
            SizedBox(height: 5),
            Text(description,
                style: TextStyle(
                  color: AppColors.textColor,
                  fontSize: 15,
                  height: 1.1,
                  fontWeight: FontWeight.w300,
                ))
          ],
        ),
      ),
    );
  }
}
