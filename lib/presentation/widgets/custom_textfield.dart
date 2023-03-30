import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final void Function(String)? onChanged;
  final double width;
  final double height;

  const CustomTextField({
    super.key,
    this.label = '',
    this.onChanged,
    this.width = double.infinity,
    this.height = 78,
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
            onChanged: onChanged,
            decoration: const InputDecoration(border: OutlineInputBorder()),
          ),
        ],
      ),
    );
  }
}
