import 'package:flutter/material.dart';

class CustomTextWidget extends StatelessWidget {
  final Color strokeColorForMainText;
  final Color solidColorForMainText;
  final Color strokeColorForBorderText;
  final Color solidColorForBorderText;
  final String mainText;
  final String borderText;

  CustomTextWidget({
    required this.strokeColorForMainText,
    required this.solidColorForMainText,
    required this.strokeColorForBorderText,
    required this.solidColorForBorderText,
    required this.mainText,
    required this.borderText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          // Main text with stroke and solid color
          Stack(
            children: [
              Text(
                mainText,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  fontFamily: 'NanumSquare_ac',
                  foreground: Paint()
                    ..style = PaintingStyle.stroke
                    ..strokeWidth = 6
                    ..color = strokeColorForMainText,
                ),
              ),
              Text(
                mainText,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  fontFamily: 'NanumSquare_ac',
                  color: solidColorForMainText,
                ),
              ),
            ],
          ),
          SizedBox(width: 4), // 간격 조정
          Stack(
            children: [
              Text(
                borderText,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  fontFamily: 'NanumSquare_ac',
                  foreground: Paint()
                    ..style = PaintingStyle.stroke
                    ..strokeWidth = 6
                    ..color = strokeColorForBorderText,
                ),
              ),
              Text(
                borderText,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  fontFamily: 'NanumSquare_ac',
                  color: solidColorForBorderText,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
