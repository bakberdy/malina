import 'package:flutter/material.dart';
import 'package:malina/core/themes/app_colors.dart';

class CategoryBar extends StatelessWidget {
  const CategoryBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Скоро в Malina',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppColors.textColor,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        SizedBox(
          height: 90,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              _categoryBarItem('Вакансии', AppColors.jobsCard),
              _categoryBarItem('Маркет', AppColors.marketCard),
              _categoryBarItem('Цветы', AppColors.flowersCard),
              _categoryBarItem('Спорт', AppColors.sportCard),
            ],
          ),
        )
      ],
    );
  }

  Container _categoryBarItem(String title, Color bgColor) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      alignment: Alignment.bottomCenter,
      padding: EdgeInsets.all(10),
      height: 85,
      width: 85,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(title,
          style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: AppColors.textColor)),
    );
  }
}
