import 'package:flutter/material.dart';

import '../../../components/custom_add_select_widget.dart';
import '../../../components/custom_radio_list_tile.dart';
import '../../../core/themes/text_styles.dart';
import '../../../gen/assets.gen.dart';

class PaymentMethodWidget extends StatefulWidget {
  const PaymentMethodWidget({
    super.key,
    this.onPaymentMethodChanged,
  });
  
  final Function(String?)? onPaymentMethodChanged;
  
  @override
  State<PaymentMethodWidget> createState() => _PaymentMethodWidgetState();
}

class _PaymentMethodWidgetState extends State<PaymentMethodWidget> {
  String? selectedPaymentMethod = "";
  Map<String, String> paymentMethodTitles = {'credit_card': 'Credit Card'};

  String _getDisplayText() {
    if (selectedPaymentMethod == null ||
        selectedPaymentMethod == "Select payment method") {
      return "Select payment method";
    }
    return paymentMethodTitles[selectedPaymentMethod] ?? selectedPaymentMethod!;
  }

  // Method to check if user has selected a payment method
  bool isPaymentMethodSelected() {
    return selectedPaymentMethod != null &&
        selectedPaymentMethod!.isNotEmpty &&
        selectedPaymentMethod != "select payment method";
  }

  // Method to get the selected payment method title
  String getSelectedPaymentMethodTitle() {
    if (isPaymentMethodSelected()) {
      return paymentMethodTitles[selectedPaymentMethod!] ??
          selectedPaymentMethod!;
    }
    return "No payment method selected";
  }

  @override
  void initState() {
    selectedPaymentMethod = "select payment method";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Payment Method", style: TextStyles.subTitle),

        CustomAddSelectWidget(
          text: _getDisplayText(),
          svg: Assets.svgs.arrow,
          enabled: true,
          showTrailingIcon: true,
          children: [
            CustomRadioListTile<String>(
              title: 'Credit Card',
              subtitle: 'Visa, Mastercard, American Express',
              value: 'credit_card',
              groupValue: selectedPaymentMethod,
              onChanged: (value) {
                setState(() {
                  selectedPaymentMethod = value;
                });
                // Notify parent widget about the change
                widget.onPaymentMethodChanged?.call(value);
              },
            ),

            // CustomRadioListTile<String>(
            //   title: 'PayPal',
            //   subtitle: 'Pay with your PayPal account',
            //   value: 'paypal',
            //   groupValue: selectedPaymentMethod,
            //   onChanged: (value) {
            //     setState(() {
            //       selectedPaymentMethod = value;
            //     });
            //   },
            // ),
          ],
        ),
      ],
    );
  }
}
