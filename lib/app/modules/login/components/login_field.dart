import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:skeleton/app/components/default_text.dart';
import 'package:skeleton/config/color_constants.dart';
import 'package:skeleton/config/constant.dart';

class LoginField extends StatelessWidget {
  const LoginField({
    super.key,
    required this.label,
    required this.hint,
    required this.fieldName,
    this.isPassword = false,
    this.isEmail = false,
  });
  final String label;
  final String hint;
  final String fieldName;
  final bool isEmail;
  final bool isPassword;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DefText(
          // 'E-mail',
          label,
          color: kBgWhite,
        ).normal,
        const SizedBox(height: 5),
        FormBuilderTextField(
          // name: 'email',
          name: fieldName,
          obscureText: isPassword,
          decoration: InputDecoration(
            // hintText: 'Enter Work E-mail',
            hintText: hint,
            hintStyle: kDefaultTextStyle.copyWith(
              fontSize: kNormalFontSize,
              color: kDefaultTextStyle.color!.withOpacity(0.6),
            ),

            border: const OutlineInputBorder(
              borderRadius: kDefaultBorderRadius10,
              borderSide: BorderSide(
                color: kPrimaryColor,
              ),
            ),
            isDense: true,
            focusColor: kPrimaryColor,
            hoverColor: kPrimaryColor,
            fillColor: kPrimaryColor,
          ),
          validator: FormBuilderValidators.compose(
            [
              if (isEmail) FormBuilderValidators.email(),
              FormBuilderValidators.required(),
            ],
          ),
        ),
      ],
    );
  }
}
