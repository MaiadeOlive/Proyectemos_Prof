import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButtonIconRight extends StatelessWidget {
  final bool isLoading;
  final onPressed;
  final Color backgroundButtonColor;
  final icon;
  final String buttonText;

  const CustomButtonIconRight({
    super.key,
    required this.isLoading,
    required this.onPressed,
    required this.backgroundButtonColor,
    required this.icon,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(backgroundButtonColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: isLoading
              ? [
                  const Padding(
                    padding: EdgeInsets.all(8),
                    child: SizedBox(
                      width: 22,
                      height: 22,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    ),
                  )
                ]
              : [
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      buttonText,
                      style: TextStyle(
                        fontSize: ScreenUtil().setSp(14),
                      ),
                    ),
                  ),
                  icon,
                ],
        ),
      ),
    );
  }
}
