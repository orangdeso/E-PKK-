import 'package:e_pkk/widgets/text_field_container.dart';
import 'package:e_pkk/utils/constants.dart';
import 'package:flutter/material.dart';

class RoundedPasswordField extends StatelessWidget {
  final String hintText;
  final ValueChanged<String> onChanged;
  const RoundedPasswordField({
    super.key,
    required this.onChanged,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        onChanged: onChanged,
        obscureText: true,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            color: grey400,
            fontSize: 15,
          ),
          icon: Icon(
            Icons.lock,
            color: ktextColor,
          ),
          suffixIcon: Icon(
            Icons.visibility_off,
            color: ktextColor,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
