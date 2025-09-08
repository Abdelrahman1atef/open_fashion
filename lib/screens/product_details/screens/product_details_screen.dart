import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:open_fashion/components/custom_button.dart';
import 'package:open_fashion/core/themes/text_styles.dart';
import 'package:open_fashion/gen/colors.gen.dart';
import 'package:open_fashion/models/order_model.dart';
import 'package:open_fashion/screens/placeorder/screens/place_order_screen.dart';
import 'package:open_fashion/screens/product_details/widgets/quantity_selector.dart';

import '../../../components/custom_app_bar.dart';
import '../../../components/custom_title.dart';
import '../../../gen/assets.gen.dart';
import '../../../models/product_model.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key, required this.product});
  final ProductModel product;

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  int quantity = 1;

  double get totalPrice => widget.product.price * quantity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorName.whiteColor,
      appBar: CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            CustomTitle(title: "Checkout"),
            IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Hero(
                    tag: "product_${widget.product.id}",
                    child: widget.product.image.image(
                      height: 150,
                      width: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Gap(20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          widget.product.name,
                          style: TextStyles.productInfo,
                        ),
                        Text(
                          widget.product.description,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyles.productInfo.copyWith(
                            color: ColorName.grayColor,
                          ),
                        ),
                        QuantitySelector(
                          quantity: quantity,
                          onQuantityChanged: (newQuantity) {
                            setState(() {
                              quantity = newQuantity;
                            });
                          },
                        ),
                        Text(
                          "\$ ${widget.product.price}",
                          style: TextStyles.productInfo.copyWith(
                            color: ColorName.priceColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Gap(20),
            Divider(color: ColorName.grayColor),
            Gap(10),
            _buildPromoCode("Add promo code", Assets.svgs.promo),
            Gap(10),
            Divider(color: ColorName.grayColor),
            Gap(10),
            _buildDelivery(),
            Gap(10),
            Divider(color: ColorName.grayColor),
            Gap(10),
          ],
        ),
      ),
      bottomNavigationBar: CustomButton(
        text: "checkout",
        isTotalVisible: true,
        totalPrice: totalPrice,
        showEst: true,
        onTap: () {
          final order = OrderModel.order;
          order?.total = totalPrice;
          final product= widget.product;
          order!.products = ProductSlectedModel(
            quantity: quantity,
            id: product.id,
            image: product.image,
            name: product.name,
            price: product.price,
            description: product.description,
          );
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PlaceOrderScreen()),
          );
        },
      ),
    );
  }

  Widget _buildPromoCode(String text, SvgGenImage svg) {
    return TextField(
      decoration: InputDecoration(
        prefixIcon: svg.svg(
          colorFilter: ColorFilter.mode(
            ColorName.primaryColor,
            BlendMode.srcIn,
          ),
        ),
        prefixIconColor: ColorName.primaryColor,
        prefixIconConstraints: BoxConstraints(maxWidth: 20, maxHeight: 20),
        hintStyle: TextStyles.productInfo,
        hintText: text,
        border: InputBorder.none,
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
      ),
    );
  }

  Widget _buildDelivery() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Assets.svgs.delivery.svg(
              width: 20,
              height: 20,
              colorFilter: ColorFilter.mode(
                ColorName.primaryColor,
                BlendMode.srcIn,
              ),
            ),
            Gap(10),
            Text("Delivery", style: TextStyles.productInfo),
          ],
        ),
        Text(
          "Free",
          style: TextStyles.productInfo.copyWith(color: ColorName.priceColor),
        ),
      ],
    );
  }
}
