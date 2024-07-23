import 'package:flutter/material.dart';

class CardBottomSection extends StatelessWidget {
  final String option1;
  final String option2;

  const CardBottomSection({
    super.key,
    required this.option1,
    required this.option2,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildOptionContainer(option1, Color.fromARGB(255, 255, 155, 155)),
        const SizedBox(width: 10),
        _buildOptionContainer(option2, Color.fromARGB(255, 93, 177, 255)),
      ],
    );
  }

  Widget _buildOptionContainer(String text, Color color) {
    return Container(
      width: 135,
      height: 88,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(5),
      ),
      alignment: Alignment.center,
      child: Container(
        width: 120,
        height: 60,
        padding: const EdgeInsets.all(5),
        alignment: Alignment.center,
        child: Text(
          text,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w700,
          ),
          softWrap: true,
        ),
      ),
    );
  }
}
