import 'package:encaixe_app/shared/themes/app_text_style.dart';
import 'package:flutter/material.dart';

class InputRegister extends StatelessWidget {
  final String label;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final void Function(String value) onChanged;
  const InputRegister(
      {Key? key,
      required this.label,
      required this.onChanged,
      this.validator,
      this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: TextFormField(
            controller: controller,
            validator: validator,
            onChanged: onChanged,
            style: AppTextStyle.input,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.zero,
              labelText: label,
              labelStyle: AppTextStyle.input,
            )),
      ),
    );
  }
}
