import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:open_fashion/gen/colors.gen.dart';

import '../../../components/custom_app_bar.dart';
import '../../../gen/assets.gen.dart';
import '../widgets/footer.dart';
import '../widgets/products.dart';
import '../widgets/you_may_also_like.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorName.primaryColor,
      appBar: CustomAppBar(defaultColor: false),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Positioned(
              top: 10,
              right: 0,
              left: 0,
              child: Assets.texts.a10.svg(),
            ),
            Positioned(
              top: 40,
              right: 0,
              left: 0,
              child: Assets.texts.october.svg(),
            ),
            Positioned(
              top: 80,
              right: 0,
              left: 0,
              child: Assets.texts.collection.svg(),
            ),
            Column(
              children: [
                Gap(110),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Assets.cover.cover1.image(),
                ),
                Gap(20),
                Products(),
                Gap(20),
                YouMayAlsoLike(),
                Gap(30),
                Footer(),


              ],
            ),
          ],
        ),
      ),
    );
  }
}
