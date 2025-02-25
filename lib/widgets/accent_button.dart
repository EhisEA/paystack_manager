import 'package:flutter/material.dart';
import 'package:paystack_manager/utils/ui_color.dart';

class AccentButton extends StatefulWidget {
  AccentButton({Key? key, required this.title, this.onPressed})
      : super(key: key);

  final String title;
  final Function()? onPressed;

  @override
  _AccentButtonState createState() => _AccentButtonState();
}

class _AccentButtonState extends State<AccentButton> {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: UIColors.accentColor,
      onPressed: widget.onPressed,
      padding: EdgeInsets.all(15),
      child: Text(
        widget.title,
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
