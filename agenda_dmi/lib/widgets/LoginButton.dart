import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final String? width;
  final String? height;
  final List<Widget>? children;
  final Color? backgroundColor;
  final Color? textColor;
  final VoidCallback? onPressed;

  const LoginButton({
    Key? key,
    this.width,
    this.height,
    this.children,
    this.backgroundColor,
    this.textColor,
    this.onPressed
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        child: SizedBox(
          width: double.parse(this.width ?? "200"),
          height: double.parse(this.height ?? "50"),
          child: TextButton(
            child: Row(
              children: this.children ?? [],
              
            ),
            style: TextButton.styleFrom(
              backgroundColor: this.backgroundColor,
              textStyle: TextStyle(
                color: this.textColor
              )
            ),
            onPressed: this.onPressed,
          ),
        ),
        margin: new EdgeInsets.symmetric(vertical: 10),
      ),
    );
  }
}

