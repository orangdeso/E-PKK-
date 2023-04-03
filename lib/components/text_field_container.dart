import 'package:e_pkk/utils/constants.dart';
import 'package:flutter/material.dart';

class TextFieldContainer extends StatelessWidget {
  final Widget child;
  const TextFieldContainer({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 2),
      width: size.width * 0.9,
      decoration: BoxDecoration(
        color: grey100,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: grey300,
          width: 1.2,
        ),
      ),
      child: child,
    );
  }
}
