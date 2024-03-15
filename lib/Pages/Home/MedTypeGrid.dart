import 'package:flutter/material.dart';

class MedTypeGrid extends StatelessWidget {
  const MedTypeGrid({
    Key? key,
    required this.onPressed,
    required this.image,
    required this.colors,
    required this.title,
  }) : super(key: key);

  final VoidCallback onPressed;
  final String title, colors;
  final String image;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: Color(int.parse(colors.replaceAll('#', '0xFF'))),
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 5),
              color: Colors.black12,
              spreadRadius: 2,
              blurRadius: 5,
            )
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                child: Image.asset(image,height: 100,width: 100,),
              ),
            ),
            SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
