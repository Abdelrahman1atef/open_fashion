import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:open_fashion/components/custom_app_bar.dart';
import 'package:open_fashion/components/custom_button.dart';
import 'package:open_fashion/components/custom_title.dart';
import 'package:open_fashion/core/themes/text_styles.dart';
import 'package:open_fashion/gen/assets.gen.dart';
import 'package:open_fashion/gen/colors.gen.dart';
import 'package:open_fashion/models/order_model.dart';
import 'package:open_fashion/screens/check_out/widgets/payment_success_dialog.dart';

class CheckOutScreen extends StatefulWidget {
  const CheckOutScreen({super.key});

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  final OrderModel? order = OrderModel.order;
  List<AddressModel>? get address => order?.address;
  ProductSlectedModel? get product => order?.products;
  int get quantity => product!.quantity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorName.whiteColor,
      appBar: CustomAppBar(),
      bottomNavigationBar: CustomButton(
        text: "Checkout",
        isTotalVisible: true,
        totalPrice: OrderModel.order?.total ?? 0.0,
        onTap: _showSuccefulDialog(),
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              CustomTitle(title: "Checkout"),
              Gap(25),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),

                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            address!.first.fullName,
                            style: TextStyles.productInfo.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            address!.first.fullAddress,
                            style: TextStyles.productInfo.copyWith(
                              color: ColorName.grayColor3,
                            ),
                          ),
                          Text(
                            "${address!.first.phone}",
                            style: TextStyles.productInfo.copyWith(
                              color: ColorName.grayColor3,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Assets.svgs.arrow.svg(),
                  ],
                ),
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Assets.svgs.mastercard.svg(),
                        Gap(13),
                        Text("Master Card ending  ${order?.payment?.lastTwoNumber}"),
                      ],
                    ),
                    Assets.svgs.arrow.svg(),
                  
                  ],
                ),
              ),
              Divider(),
               IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Hero(
                    tag: "product_${product?.id}",
                    child: product!.image.image(
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
                          product!.name,
                          style: TextStyles.productInfo,
                        ),
                        Text(
                          product!.description,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyles.productInfo.copyWith(
                            color: ColorName.grayColor,
                          ),
                        ),
                        Text("× $quantity"),
                        
                        Text(
                          "\$ ${product!.price}",
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
            
            ],
          ),
        ),
      ),
    );
  }
  _showSuccefulDialog() {
    return () {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext dialogContext) {
          return PaymentSuccessDialog();
        },
      );
    };
  }
}
