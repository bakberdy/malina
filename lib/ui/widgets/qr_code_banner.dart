
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/core.dart';

class QRCodeBanner extends StatelessWidget {
  const QRCodeBanner({
    super.key,
    required this.onTap,
  });

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 11),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: AppColors.primary,
        ),
        child: Row(
          children: [
            SvgPicture.asset(phoneWithQrScannerIcon),
            SizedBox(
              width: 15,
            ),
            Expanded(
              child: Text(
                'Сканируй QR-код и заказывай прямо в заведении',
                softWrap: true,
                style: TextStyle(
                  color: AppColors.whiteTextColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
