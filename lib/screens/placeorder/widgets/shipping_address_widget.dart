import 'package:flutter/material.dart';
import 'package:open_fashion/core/themes/text_styles.dart';
import 'package:open_fashion/gen/assets.gen.dart';
import 'package:open_fashion/gen/colors.gen.dart';
import 'package:open_fashion/models/order_model.dart';
import 'package:open_fashion/screens/placeorder/screens/add_shipping_address_screen.dart';

import '../../../components/custom_add_select_widget.dart';

class ShippingAddressWidget extends StatefulWidget {
  const ShippingAddressWidget({super.key, required this.order});

  final OrderModel order;

  @override
  State<ShippingAddressWidget> createState() => _ShippingAddressWidgetState();
}

class _ShippingAddressWidgetState extends State<ShippingAddressWidget> {
  @override
  Widget build(BuildContext context) {
    // Use the current order from OrderModel instead of the passed order
    final OrderModel order = OrderModel.order ?? widget.order;
    final List<AddressModel> addresses = order.address ?? [];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Shipping address", style: TextStyles.subTitle),
        ListView.builder(
          itemCount: addresses.length,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final address = addresses[index];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
              child: InkWell(
                onTap: () async {
                  // Navigate to add/edit address screen
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          AddShippingAddressScreen(order: order, addressId: index), // Use INDEX, not ID
                    ),
                  );
                  // Rebuild the widget when returning from the screen
                  setState(() {});
                },
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            address.fullName,
                            style: TextStyles.productInfo.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            address.fullAddress,
                            style: TextStyles.productInfo.copyWith(
                              color: ColorName.grayColor3,
                            ),
                          ),
                          Text(
                            "${address.phone}",
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
            );
          },
        ),
        GestureDetector(
          onTap: () async {
            // Navigate to add/edit address screen
            await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddShippingAddressScreen(order: order),
              ),
            );
            // Rebuild the widget when returning from the screen
            setState(() {});
          },
          child: CustomAddSelectWidget(
            text: "Add shipping address",
            svg: Assets.svgs.plus,
            enabled: false,
          ),
        ),
      ],
    );
  }
}
