import 'package:flutter/material.dart';

import '../../../ui/colors/app_colors.dart';

class MessageFormField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final FormFieldValidator validator;
  const MessageFormField(
      {Key? key,
      required this.controller,
      required this.label,
      required this.validator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.4,
      child: TextFormField(
        controller: controller,
        validator: validator,
        expands: false,
        maxLength: 1000,
        maxLines: 20,
        keyboardType: TextInputType.multiline,
        decoration: InputDecoration(
          alignLabelWithHint: true,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 25.0, horizontal: 10.0),
          label: Text(
            label,
            style: const TextStyle(color: AppColors.secColor),
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.secColor, width: 3),
            borderRadius: BorderRadius.circular(10),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: AppColors.secColor, width: 3),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: AppColors.secColor, width: 3),
          ),
        ),
        style: const TextStyle(color: AppColors.secColor),
      ),
    );
  }
}
