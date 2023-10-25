import 'package:chilly/app/style/app_colors.dart';
import 'package:chilly/app/style/app_text_styles.dart';
import 'package:flutter/material.dart';

class TagBox extends StatelessWidget {
  const TagBox({
    super.key,
    required this.tag,
  });

  final String tag;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
        color: AppColors.red,
      ),
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.fromLTRB(0, 0, 10, 10),
      child: Text(
        tag,
        style: AppTextStyles.h3.copyWith(color: AppColors.white),
      ),
    );
  }
}
