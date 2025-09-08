import 'package:flutter/material.dart';
import 'package:open_fashion/core/themes/text_styles.dart';
import 'package:open_fashion/gen/assets.gen.dart';

import '../../../gen/colors.gen.dart';

class QuantitySelector extends StatelessWidget {
  const QuantitySelector({
    super.key,
    required this.quantity,
    required this.onQuantityChanged,
  });
  
  final int quantity;
  final Function(int) onQuantityChanged;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorName.whiteColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: _buildQuantitySelector(),
    );
  }

  Widget _buildQuantitySelector() {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            if (quantity > 1) {
              onQuantityChanged(quantity - 1);
            }
          }, 
          icon: Assets.svgs.min.svg(
            colorFilter: ColorFilter.mode(ColorName.primaryColor, BlendMode.srcIn)
          )
        ),
        Text(quantity.toString(), style: TextStyles.productInfo),
        IconButton(
          onPressed: () {
            onQuantityChanged(quantity + 1);
          }, 
          icon: Assets.svgs.plus.svg(
            colorFilter: ColorFilter.mode(ColorName.primaryColor, BlendMode.srcIn)
          )
        ),
      ],
    );
  }
} 