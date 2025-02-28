import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/core/unitls/app_text_styles.dart';
import 'package:fruits_hub_dashboard/core/widgets/custom_check_box.dart';

class IsFeaturedCheckBox extends StatefulWidget {
  const IsFeaturedCheckBox({
    super.key,
    required this.onChanged,
  });
  final ValueChanged<bool> onChanged;

  @override
  State<IsFeaturedCheckBox> createState() => _IsFeaturedCheckBoxState();
}

class _IsFeaturedCheckBoxState extends State<IsFeaturedCheckBox> {
  bool isTermsAccepted = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text.rich(
            TextSpan(children: [
              TextSpan(
                text: 'is Featured Item ?',
                style: TextStyles.semiBold13.copyWith(
                  color: const Color(0xFF949D9E),
                ),
              ),
            ]),
          ),
          const SizedBox(
            width: 16,
          ),
          CustomCheckBox(
            onChecked: (value) {
              isTermsAccepted = value;
              widget.onChanged(value);
              setState(() {});
            },
            isChecked: isTermsAccepted,
          ),
        ],
      ),
    );
  }
}
