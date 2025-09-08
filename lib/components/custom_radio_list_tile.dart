import 'package:flutter/material.dart';
import '../core/themes/text_styles.dart';
import '../gen/colors.gen.dart';

class CustomRadioListTile<T> extends StatelessWidget {
  const CustomRadioListTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.value,
    required this.groupValue,
    required this.onChanged,
  });

  final String title;
  final String subtitle;
  final T value;
  final T? groupValue;
  final ValueChanged<T?> onChanged;

  @override
  Widget build(BuildContext context) {
    return RadioGroup<T>(
      groupValue: groupValue,
      onChanged: onChanged,
      child: RadioListTile<T>(
        title: Text(
          title,
          style: TextStyles.subTitle.copyWith(fontSize: 16),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyles.subTitle.copyWith(
            fontSize: 14,
            color: ColorName.grayColor3,
          ),
        ),
        value: value,
      ),
    );
  }
}
