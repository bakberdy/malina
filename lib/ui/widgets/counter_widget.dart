
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/core.dart';

class CounterWidget extends StatelessWidget {
  const CounterWidget({
    super.key,
    required this.onIncrement,
    required this.onDecrement,
    required this.onDelete,
    required this.value,
  });

  final VoidCallback onIncrement;
  final VoidCallback onDecrement;
  final VoidCallback onDelete;
  final int value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
            onTap: onDecrement,
            child: SizedBox(
                width: 30 * MediaQuery.of(context).size.width / 330,
                child: SvgPicture.asset(minusIcon))),
        SizedBox(
          width: 4,
        ),
        Text('$value',
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: AppColors.textColor)),
        SizedBox(
          width: 4,
        ),
        GestureDetector(
            onTap: onIncrement,
            child: SizedBox(
                width: 30 * MediaQuery.of(context).size.width / 330,
                child: SvgPicture.asset(plusIcon))),
        Flexible(
            child: Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  style: ButtonStyle(
                      padding: WidgetStatePropertyAll(EdgeInsets.all(0))),
                  icon: SvgPicture.asset(deleteIcon),
                  onPressed: onDelete,
                )))
      ],
    );
  }
}
