import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../../core/themes/text_styles.dart';
import '../../../gen/assets.gen.dart';
import '../../../gen/colors.gen.dart';
import '../../../models/cover_model.dart';

class YouMayAlsoLike extends StatelessWidget {
  const YouMayAlsoLike({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("You may also like".toUpperCase(),
          style: TextStyles.title.copyWith(color: ColorName.whiteColor),),
        Assets.svgs.line.image(width: 200),
        Gap(30),

        SizedBox(
          height: 505,
          child: ListView.builder(
            padding: EdgeInsets.all(0),
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: CoverModel.covers.length,
            itemBuilder: (context, index) {
              final cover = CoverModel.covers[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      cover.image.image(width: 300,height:450,fit: BoxFit.cover),
                      Gap(10),
                      Text(cover.name, style: TextStyles.coverInfo),
                    ]),
              );
            },),
        ),
      ],
    );
  }
}
