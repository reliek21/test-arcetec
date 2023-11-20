import 'package:flutter/material.dart';
import 'package:test_arcetec/common/colors/colors_common.dart';
import 'package:test_arcetec/common/typography/typography_common.dart';

enum TextFieldType { text, textArea }

class CustomTextFormFieldWidget extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final TextFieldType fieldType;
	final TextInputType? keyboard;

  const CustomTextFormFieldWidget({
    super.key,
    required this.hintText,
    required this.controller,
    this.validator,
    this.fieldType = TextFieldType.text,
		this.keyboard = TextInputType.text
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: (fieldType != TextFieldType.textArea) ? 70.0 : 120.0,
      decoration: BoxDecoration(
        border: Border.all(
          color: ArcetecColors.primaryColor.withOpacity(0.20),
        ),
        borderRadius: BorderRadius.circular(8.0),
        color: ArcetecColors.primaryColor.withOpacity(0.10),
      ),
      child: Center(
        child: TextFormField(
					keyboardType: keyboard,
          minLines: (fieldType != TextFieldType.textArea) ? null : 5,
          maxLines: (fieldType != TextFieldType.textArea) ? null : 5,
          validator: validator,
          controller: controller,
          style: ArcetecTypography.title(color: ArcetecColors.primaryColor),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: ArcetecTypography.title(
              color: ArcetecColors.primaryColor.withOpacity(0.5),
            ),
            border: InputBorder.none,
            contentPadding: const EdgeInsets.all(16.0),
            isDense: (fieldType != TextFieldType.textArea) ? false : true,
            alignLabelWithHint: (fieldType != TextFieldType.textArea) ? false : true
          ),
        ),
      ),
    );
  }
}
