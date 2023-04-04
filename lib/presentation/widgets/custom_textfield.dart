import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final void Function(String)? onChanged;
  final bool obscureText;
  final double width;
  final double height;
  final IconData? suffixIcon;
  final VoidCallback? suffixOnPressed;

  const CustomTextField({
    super.key,
    this.label = '',
    this.onChanged,
    this.obscureText = false,
    this.width = double.infinity,
    this.height = 78,
    this.suffixIcon,
    this.suffixOnPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width.w,
      height: height.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label),
          SizedBox(height: 5.h),
          TextField(
            obscureText: obscureText,
            decoration: InputDecoration(
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                    icon: Icon(suffixIcon), onPressed: suffixOnPressed)),
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}
