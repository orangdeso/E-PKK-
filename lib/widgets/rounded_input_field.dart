import 'package:e_pkk/widgets/text_field_container.dart';
import 'package:e_pkk/utils/constants.dart';
import 'package:flutter/material.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  const RoundedInputField({
    super.key,
    required this.hintText,
    this.icon = Icons.person,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
            icon: Icon(
              icon,
              color: ktextColor,
            ),
            hintText: hintText,
            hintStyle: TextStyle(
              color: grey400,
              fontSize: 15,
            ),
            border: InputBorder.none),
      ),
    );
  }
}
