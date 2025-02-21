import 'package:flutter/material.dart';

import '../../../../../core/utils/app_text_styles.dart';
import 'custom_check_box.dart';

class IsOrganicCheckBox extends StatefulWidget {
  const IsOrganicCheckBox({super.key, required this.onChanged});

  final ValueChanged<bool> onChanged;

  @override
  State<IsOrganicCheckBox> createState() => _IsFeaturedCheckBoxState();
}

class _IsFeaturedCheckBoxState extends State<IsOrganicCheckBox> {
  bool isOrganic = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: 'Is Product Organic',
                style: TextStyles.semiBold13.copyWith(color: Color(0xFF949D9E)),
              ),
            ],
          ),
          textAlign: TextAlign.right,
        ),
        Expanded(child: SizedBox(width: 16)),
        CustomCheckBox(
          isChecked: isOrganic,
          onChecked: (bool value) {
            isOrganic = value;
            widget.onChanged(value);
            setState(() {});
          },
        ),
      ],
    );
  }
}
