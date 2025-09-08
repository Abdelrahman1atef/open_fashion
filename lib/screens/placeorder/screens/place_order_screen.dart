import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:open_fashion/components/custom_app_bar.dart';
import 'package:open_fashion/components/custom_button.dart';
import 'package:open_fashion/components/custom_title.dart';
import 'package:open_fashion/gen/colors.gen.dart';
import 'package:open_fashion/models/order_model.dart';
import 'package:open_fashion/screens/placeorder/screens/credit_card_screen.dart';
import 'package:open_fashion/screens/placeorder/widgets/payment_method_widget.dart';
import 'package:open_fashion/screens/placeorder/widgets/shipping_address_widget.dart';
import 'package:open_fashion/screens/placeorder/widgets/shipping_method_widget.dart';

class PlaceOrderScreen extends StatefulWidget {
  const PlaceOrderScreen({super.key});

  @override
  State<PlaceOrderScreen> createState() => _PlaceOrderScreenState();
}

class _PlaceOrderScreenState extends State<PlaceOrderScreen> {
  final OrderModel order = OrderModel.order!;
  String? selectedPaymentMethod;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorName.whiteColor,
      appBar: CustomAppBar(),
      bottomNavigationBar: CustomButton(
        text: "Place order",
        isTotalVisible: true,
        totalPrice: order.total,
        onTap: () {
          if (_isPaymentMethodSelected()) {
            // Proceed with order
            if (selectedPaymentMethod == "credit_card") {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CreditCardScreen(order: order),
                ),
              );
            }
          } else {
            // Show error dialog if payment method is not selected
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text('Payment Method Required'),
                content: Text(
                  'Please select a payment method before placing your order.',
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text('OK'),
                  ),
                ],
              ),
            );
          }
        },
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: ListView(
          children: [
            CustomTitle(title: "Checkout"),
            ShippingAddressWidget(order: order),
            Gap(36),
            ShippingMethodWidget(),
            Gap(36),
            PaymentMethodWidget(
              onPaymentMethodChanged: (paymentMethod) {
                setState(() {
                  selectedPaymentMethod = paymentMethod;
                });
              },
            ),
            Gap(36),
          ],
        ),
      ),
    );
  }

  bool _isPaymentMethodSelected() {
    return selectedPaymentMethod != null &&
        selectedPaymentMethod!.isNotEmpty &&
        selectedPaymentMethod != "select payment method";
  }
}
