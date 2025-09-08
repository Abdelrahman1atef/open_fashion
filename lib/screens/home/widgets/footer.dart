import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ionicons/ionicons.dart';
import 'package:open_fashion/core/themes/text_styles.dart';

import '../../../gen/assets.gen.dart';
import '../../../gen/colors.gen.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Ionicons.logo_twitter,color: ColorName.whiteColor,),
            Gap(45),
            Icon(Ionicons.logo_instagram,color: ColorName.whiteColor,),
            Gap(45),
            Icon(Ionicons.logo_youtube,color: ColorName.whiteColor,),
          ],
        ),
        Gap(24),
        Assets.svgs.line.image(width: 200),
        Gap(24),
        Column(
          children: [
            Text("support@openui.design",style: TextStyles.footerStyle,),
            Gap(5),
            Text("+60 825 876",style: TextStyles.footerStyle,),
            Gap(5),
            Text("08:00 - 22:00 - Everyday",style: TextStyles.footerStyle,),
          ],
        ),
        Gap(24),
        Assets.svgs.line.image(width: 200),
        Gap(32),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("About",style: TextStyles.footerStyle,),
            Gap(45),
            Text("Contact",style: TextStyles.footerStyle,),
            Gap(45),
            Text("Blog",style: TextStyles.footerStyle,),
          ],
        ),
        Gap(32),
        Container(
          height: 50,
          alignment: AlignmentDirectional.center,
          color: ColorName.whiteColor,
          child: Text("Copyright© OpenUI All Rights Reserved.",style: TextStyles.footerStyle.copyWith(color: ColorName.blackColor),),
        )
        // Assets.texts.copyright.svg(),
      ],
    );
  }
}
