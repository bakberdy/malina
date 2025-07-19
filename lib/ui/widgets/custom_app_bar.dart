import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../core/core.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.onClearTap,
  });
  final VoidCallback onClearTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: AppBar(
        leadingWidth: 25,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: GestureDetector(
          onTap: () async {
            final isPopped = await context.router.maybePop();

            if (!isPopped && context.mounted) {
              context.router.navigate(HomeRoute());
            }
          },
          child: SizedBox(
            height: 25,
            width: 25,
            child: Padding(
              padding: const EdgeInsets.only(left: 12, top: 5),
              child: SizedBox(
                child: Icon(
                  Icons.arrow_back_ios_new_sharp,
                  size: 18,
                ),
              ),
            ),
          ),
        ),
        actions: [
          TextButton(
              onPressed: onClearTap,
              child: Text('Очистить',
                  style: TextStyle(
                      color: AppColors.textColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w400))),
        ],
        backgroundColor: Colors.transparent,
        title: Text(
          'Корзина',
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80);
}
