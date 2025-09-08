import 'package:flutter/material.dart';

import '../../../components/custom_add_select_widget.dart';
import '../../../components/custom_radio_list_tile.dart';
import '../../../core/themes/text_styles.dart';
import '../../../gen/assets.gen.dart';

class ShippingMethodWidget extends StatefulWidget {
   const ShippingMethodWidget({super.key});

  @override
  State<ShippingMethodWidget> createState() => _ShippingMethodWidgetState();
}

class _ShippingMethodWidgetState extends State<ShippingMethodWidget> {
  String? selectedShippingMethod = "";
  String? subTextValue ;

  Map<String, dynamic> shippingMethod = {
    'standard': '5%',
    'express': '7%',
    'overnight': '12%',
  };
  
  Map<String, String> shippingMethodTitles = {
    'standard': 'Standard Shipping',
    'express': 'Express Shipping',
    'overnight': 'Overnight Shipping',
  };
   @override
  void initState() {
    selectedShippingMethod = "Pickup at store";
    super.initState();
  }
  
  String _getDisplayText() {
    if (selectedShippingMethod == null || selectedShippingMethod == "Pickup at store") {
      return "Pickup at store";
    }
    return shippingMethodTitles[selectedShippingMethod] ?? selectedShippingMethod!;
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Shipping Method", style: TextStyles.subTitle),
        CustomAddSelectWidget(
          text: _getDisplayText(),
          svg: Assets.svgs.arrow,
          showSubText: true,
          enabled: true,
          showTrailingIcon: true,
          subTextValue: subTextValue,
          children: [
            CustomRadioListTile<String>(
              title: 'Standard Shipping',
              subtitle: '5-7 business days',
              value: 'standard',
              groupValue: selectedShippingMethod,
              onChanged: (value) {
                setState(() {
                  // Use the map to get the value (e.g., percentage) for the selected shipping method
                  subTextValue = shippingMethod[value];
                  selectedShippingMethod = value;
                });
              },
            ),
            
            CustomRadioListTile<String>(
              title: 'Express Shipping',
              subtitle: '2-3 business days',
              value: 'express',
              groupValue: selectedShippingMethod,
              onChanged: (value) {
                setState(() {
                  subTextValue = shippingMethod[value];
                  selectedShippingMethod = value;
                });
              },
            ),
            
            CustomRadioListTile<String>(
              title: 'Overnight Shipping',
              subtitle: 'Next business day',
              value: 'overnight',
              groupValue: selectedShippingMethod,
              onChanged: (value) {
                setState(() {
                  subTextValue = shippingMethod[value];
                  selectedShippingMethod = value;
                });
              },
            ),
          ],
        ),
      ],
    );
  }
}
