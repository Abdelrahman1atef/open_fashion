
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:open_fashion/core/themes/text_styles.dart';
import 'package:open_fashion/gen/assets.gen.dart';
import 'package:open_fashion/gen/colors.gen.dart';

class PaymentSuccessDialog extends StatefulWidget {
  const PaymentSuccessDialog({super.key});

  @override
  State<PaymentSuccessDialog> createState() => _PaymentSuccessDialogState();
}

class _PaymentSuccessDialogState extends State<PaymentSuccessDialog> {
  int selectedRating = -1; // -1 means no rating selected

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      shape: BeveledRectangleBorder(borderRadius: BorderRadiusGeometry.all(Radius.zero)),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(0),
          ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Header with close button
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(width: 24), // Spacer for centering
                  Text(
                    "PAYMENT SUCCESS",
                    style: TextStyles.title.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: Icon(
                      Icons.close,
                      size: 24,
                      color: ColorName.blackColor,
                    ),
                  ),
                ],
              ),
            ),
            
            // Success icon with sparkles
            Assets.pop.done.svg(
                  width: 80,
                  height: 80,
                  color: ColorName.priceColor,
                ),
            Gap(20),
            
            // Success message
            Text(
              "Your payment was success",
              style: TextStyles.subTitle.copyWith(
                fontSize: 16,
                color: ColorName.grayColor3,
              ),
            ),
            
            Gap(8),
            
            // Payment ID
            Text(
              "Payment ID 15263541",
              style: TextStyles.subTitle.copyWith(
                fontSize: 14,
                color: ColorName.grayColor,
              ),
            ),
            
            Gap(30),
            
            // Divider with line asset
            Assets.svgs.line.image(
              width: MediaQuery.of(context).size.width * 0.7,
              height: 1,
            ),
            
            Gap(30),
            
            // Rating section
            Text(
              "Rate your purchase",
              style: TextStyles.subTitle.copyWith(
                fontSize: 16,
                color: ColorName.blackColor,
              ),
            ),
            
            Gap(20),
            
            // Rating emojis
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildRatingEmoji(0, Assets.pop.emogi1),
                Gap(20),
                _buildRatingEmoji(1, Assets.pop.emogi2),
                Gap(20),
                _buildRatingEmoji(2, Assets.pop.emogi3),
              ],
            ),
            
            Gap(30),
            
            // Action buttons
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        // Handle submit rating
                        Navigator.of(context).pop();
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Thank you for your rating!'),
                            backgroundColor: Colors.green,
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorName.blackColor,
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0),
                        ),
                      ),
                      child: Text(
                        "SUBMIT",
                        style: TextStyles.subTitle.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                  Gap(8),
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        // Navigate to home screen
                        Navigator.of(context).pushNamedAndRemoveUntil(
                          '/',
                          (route) => false,
                        );
                      },
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: ColorName.blackColor, width: 1),
                        padding: EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0),
                        ),
                      ),
                      child: Text(
                        "BACK TO HOME",
                        style: TextStyles.subTitle.copyWith(
                          color: ColorName.blackColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            
            Gap(30),
          ],
        ),
      ),
    );
  }

  Widget _buildRatingEmoji(int index, SvgGenImage emojiAsset) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedRating = index;
        });
      },
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: selectedRating == index 
              ? ColorName.priceColor.withOpacity(0.1)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
          border: selectedRating == index 
              ? Border.all(color: ColorName.priceColor, width: 2)
              : null,
        ),
        child: emojiAsset.svg(
          width: 40,
          height: 40,
          color: ColorName.priceColor,
        ),
      ),
    );
  }
}
