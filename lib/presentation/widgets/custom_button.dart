import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final double width;
  final double height;
  final Color? color;

  const CustomButton({
    super.key,
    this.text = '',
    this.onPressed,
    this.width = double.infinity,
    this.height = 40,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width.w,
      height: height.h,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(backgroundColor: MaterialStateProperty.all(color)),
        child: Text(text),
      ),
    );
  }
}
