import 'package:flutter/material.dart';

class Liststyle extends StatelessWidget {
  const Liststyle({
    required this.image,
    required this.title,
    required this.subtitle,
    required this.diftitle,
    required this.onPressed,
    required this.price,
    Key? key,
  }) : super(key: key);

  final String title, subtitle, diftitle, price;
  final String image;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.only(left: 12.0, top: 10,bottom: 15),
        child: Stack(
          children: [
            Container(
              height: 150,
              width: 350,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color(0x5EE9EAEC),
              ),
              padding: const EdgeInsets.all(8.0), // Add padding here
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(13.0), // Adjust the value as needed
                    child: Image.asset(
                      image,
                      width: 120,
                      height: 130,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(height: 5),
                        Row(
                          children: [
                            Text(
                              'Name: ',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              title,
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        Container(height: 5),
                        Row(
                          children: [
                            Text(
                              'Phone no: ',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              subtitle,
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        Container(height: 5),
                        Row(
                          children: [
                            Text(
                              'Type: ',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              diftitle,
                              maxLines: 2,
                              style: TextStyle(
                                color: Colors.green,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 8,
              right: 30,
              child: Text(
                '₹ $price',
                style: TextStyle(
                  color: Color(0xFF51604F),
                  fontWeight: FontWeight.w600,
                  fontSize: 27,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
