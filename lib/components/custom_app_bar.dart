import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../gen/assets.gen.dart';
import '../gen/colors.gen.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, this.defaultColor = true});

  /// defaultColor = Colors.white
  final bool defaultColor;

  _buildSvgs(SvgGenImage svgName){
    return defaultColor
        ? svgName.svg(
      colorFilter: ColorFilter.mode(ColorName.primaryColor, BlendMode.srcIn),
    )
        : svgName.svg();
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: AppBar(
        backgroundColor: defaultColor ? ColorName.whiteColor : ColorName.primaryColor,
        leading: _buildSvgs(Assets.svgs.menu),
        leadingWidth: 24,
        title:_buildSvgs(Assets.logo.logoBg),
        centerTitle: true,
        actions: [
          _buildSvgs(Assets.svgs.search),
          // SizedBox(width: 16.0),
          Gap(16),
          _buildSvgs(Assets.svgs.shoppingBag),
        ],
      ),
    );
  }
}
