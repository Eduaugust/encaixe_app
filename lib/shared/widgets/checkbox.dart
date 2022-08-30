import 'package:flutter/material.dart';

import '../themes/app_text_style.dart';

class CustomCheckbox extends StatelessWidget {
  String title;
  void Function(bool? value) onChanged;
  bool value;

  CustomCheckbox({
    Key? key,
    required this.title,
    required this.onChanged,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Text(title, style: AppTextStyle.inputCheckbox),
          Checkbox(
            value: value,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}
