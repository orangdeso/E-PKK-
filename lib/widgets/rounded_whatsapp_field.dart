import 'package:e_pkk/widgets/text_field_container.dart';
import 'package:e_pkk/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RoundedWhatsAppField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  const RoundedWhatsAppField({
    super.key,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        //controller: no_whatsapp,
        onChanged: onChanged,
        keyboardType: TextInputType.number,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.digitsOnly
        ],
        decoration: InputDecoration(
          hintText: "0821xxx",
          hintStyle: TextStyle(
            color: grey400,
            fontSize: 15,
          ),
          icon: Icon(
            Icons.tablet_android,
            color: ktextColor,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
