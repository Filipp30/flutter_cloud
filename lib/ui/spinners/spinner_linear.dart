import 'package:blinking_text/blinking_text.dart';
import 'package:cloud_app/ui/assets/colors/colors.dart';
import 'package:flutter/material.dart';

class SpinnerLinear extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LinearProgressIndicator(color:activeColor1),
        const SizedBox(height: 15),
        BlinkText(
          'Please wait...',
          style: TextStyle(color: activeColor1, fontSize: 20),
          beginColor: activeColor1,
          endColor: primaryColor,
          times: 7,
          duration: Duration(seconds: 1),
        )
      ],
    );
  }
}
