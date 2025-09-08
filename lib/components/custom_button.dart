import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:open_fashion/core/themes/text_styles.dart';
import 'package:open_fashion/gen/assets.gen.dart';
import 'package:open_fashion/gen/colors.gen.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    this.totalPrice,
    this.isTotalVisible,
    this.isIconVisible,
    this.onTap, this.showEst,
  });
  final String text;
  final bool? isTotalVisible;
  final double? totalPrice;
  final bool? isIconVisible;
  final void Function()? onTap;
  final bool? showEst;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Visibility(
          visible: isTotalVisible ?? false,
          child: Container(
            color: ColorName.whiteColor,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Visibility(
                        visible: showEst ??false,
                        child: Text("Est. ", style: TextStyles.productInfo)),
                      Text("Total", style: TextStyles.productInfo),
                    ],
                  ),
                  Text(
                    "\$ ${totalPrice ?? 0.toStringAsFixed(0)}",
                    style: TextStyles.productInfo.copyWith(
                      color: ColorName.priceColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: onTap,
          child: Container(
            alignment: AlignmentDirectional.center,
            padding: const EdgeInsets.symmetric(vertical: 20),
            color: ColorName.primaryColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Visibility(
                  visible: isIconVisible ?? true,
                  child: Row(
                    children: [
                      Assets.svgs.shoppingBag.svg(
                        colorFilter: ColorFilter.mode(
                          ColorName.whiteColor,
                          BlendMode.srcIn,
                       ),
                      ),
                      Gap(10), 
                    ],
                  ),
                ),
                Text(
                  text.toUpperCase(),
                  style: TextStyles.productInfo.copyWith(
                    color: ColorName.whiteColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
