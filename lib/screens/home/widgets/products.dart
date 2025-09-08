import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../core/themes/text_styles.dart';
import '../../../gen/colors.gen.dart';
import '../../../models/product_model.dart';
import '../../product_details/screens/product_details_screen.dart';

class Products extends StatelessWidget {
  const Products({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: GridView.builder(
            padding: EdgeInsets.all(0),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
              childAspectRatio: 0.6,
            ),
            itemCount: ProductModel.products.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              final product = ProductModel.products[index];
              return GestureDetector(
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => CheckoutScreen(product: product,),)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Hero(
                      tag: "product_${product.id}",
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: product.image.image(
                          height: 200,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Gap(10),
                    Text(product.name, style: TextStyles.productInfo.copyWith(color: ColorName.whiteColor)),
                    Gap(4),
                    Text(
                      product.description,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyles.productInfo.copyWith(
                          color: ColorName.grayColor
                      ),
                    ),
                    Gap(4),
                    Text(
                      "\$ ${product.price}",
                      style: TextStyles.productInfo.copyWith(
                          color: ColorName.priceColor),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
