import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:open_fashion/core/themes/text_styles.dart';
import 'package:open_fashion/gen/assets.gen.dart';
import 'package:open_fashion/gen/colors.gen.dart';

class CustomTitle extends StatelessWidget {
  const CustomTitle({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Gap(20),
            Text(title.toUpperCase(), style: TextStyles.title),
            Gap(10),
            Assets.svgs.line.image(width: 180, color: ColorName.blackColor),
            Gap(20),
      ],
    );
  }
}