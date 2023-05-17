import 'package:flutter/material.dart';

class BgPassword extends StatelessWidget {
  final Widget child;
  const BgPassword({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: double.infinity,
      //Menagatur size
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: 0,
            right: 0,
            child: Image.asset("assets/images/register1.png"),
          ),
          child,
        ],
      ),
    );
  }
}