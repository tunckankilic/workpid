import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workpid/app/globals/theme_constants.dart';

class PageItem extends StatelessWidget {
  final String image;
  final String text;

  const PageItem({Key? key, required this.image, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: ThemeConstants.themeColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: <Widget>[
              Image.asset(
                image,
                fit: BoxFit.fill,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
