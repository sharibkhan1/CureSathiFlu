import 'package:flutter/material.dart';

class ButtonsCustom extends StatelessWidget {
  const ButtonsCustom({
    Key? key,
    required this.onPressed,
    required this.text,
  }) : super(key: key);

  final VoidCallback onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Padding(
          padding:  EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.only(left: 25, right: 25, top: 15, bottom: 15),
              textStyle: const TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
              backgroundColor: const Color(0xFF51604F),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children:  [
                Text(
                  text,
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(width: 5),
                Icon(
                  Icons.keyboard_arrow_right,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
