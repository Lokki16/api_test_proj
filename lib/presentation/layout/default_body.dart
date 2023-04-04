import 'package:api_test_proj/presentation/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DefaultBody extends StatelessWidget {
  final String title;
  final bool back;
  final bool settings;
  final double topPadding;
  final double bottomPadding;
  final double horizontalPadding;
  final Widget? footer;
  final double footerHeight;
  final Widget child;

  const DefaultBody({
    super.key,
    this.title = '',
    this.back = false,
    this.settings = false,
    this.topPadding = 10,
    this.bottomPadding = 0,
    this.horizontalPadding = 15,
    this.footer,
    this.footerHeight = 140,
    required this.child,
  });

  double get calcBottomPadding =>
      footer == null ? bottomPadding : bottomPadding + footerHeight;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(title: title, back: back, settings: settings),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            top: topPadding.h,
            bottom: bottomPadding.h,
            left: horizontalPadding.w,
            right: horizontalPadding.w,
          ),
          child: child,
        ),
      ),
      bottomSheet: _buildFooter(),
    );
  }

  Widget? _buildFooter() {
    if (footer != null) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 67.w),
        width: double.infinity,
        height: footerHeight.h,
        child: footer,
      );
    }

    return null;
  }
}
