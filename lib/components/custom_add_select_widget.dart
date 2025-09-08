import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../core/themes/text_styles.dart';
import '../gen/assets.gen.dart';
import '../gen/colors.gen.dart';

class CustomAddSelectWidget extends StatelessWidget {
  const CustomAddSelectWidget({
    super.key,
    required this.text,
    required this.svg,
    this.showSubText = false,
    this.showTrailingIcon = false,
    this.enabled,
    this.children,
    this.subTextValue ="Taxes",
  });

  final String text;
  final SvgGenImage svg;
  final bool? showSubText;
  final bool? showTrailingIcon;
  ///defult value false
  final bool? enabled;
  final List<Widget>? children;
  final String? subTextValue;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorName.containerColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: ExpansionTile(
        enabled: enabled ?? false,
        showTrailingIcon: showTrailingIcon ?? false,
        collapsedShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: TextStyles.subTitle.copyWith(
                fontSize: 22,
                color: ColorName.grayColor3,
              ),
            ),
            Row(
              children: [
                Visibility(
                  visible: showSubText == true,
                  child: Text(
                    subTextValue ?? "Taxes",
                    style: TextStyles.subTitle.copyWith(
                      fontSize: 16,
                      color: ColorName.grayColor3,
                    ),
                  ),
                ),
                Gap(10),
                Visibility(
                  visible: !(showTrailingIcon ?? false),
                  child: Transform.rotate(
                    angle: 1.5708, // 90 degrees in radians (π/2)
                    child: svg.svg(),
                  ),
                ),
              ],
            ),
          ],
        ),
        children: [
          // Wrap children in a container to remove dividers
          Container(
            decoration: BoxDecoration(
              color: ColorName.containerColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            child: Column(
              children: children ?? [],
            ),
          ),
        ],
      ),
    );
  }
}
