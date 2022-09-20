import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    required this.color,
    required this.buttonTitle,
    required this.onPressed,
    required this.textColor,
  });

  final Color color;
  final String buttonTitle;
  final Color textColor;
  final VoidCallback onPressed; //VoidCallback is just shorthand for void Function() so you could also define it as final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: color,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            buttonTitle,
            style: TextStyle(
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}