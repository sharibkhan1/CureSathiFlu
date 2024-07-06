import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tpop/Compo/doctormodel.dart';
import 'package:tpop/provider/favprovider.dart';

class Liststyle extends StatelessWidget {
  final Doctor doctor;
  final VoidCallback onPressed;


  const Liststyle({
    required this.doctor,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  Widget _buildRatingStars(double rating) {
    List<Widget> stars = [];
    for (int i = 1; i <= 5; i++) {
      if (i <= rating) {
        stars.add(Icon(Icons.star, color: Colors.amber, size: 16));
      } else if (i - rating == 0.5) {
        stars.add(Icon(Icons.star_half, color: Colors.amber, size: 16));
      } else {
        stars.add(Icon(Icons.star_border, color: Colors.amber, size: 16));
      }
    }
    return Row(children: stars);
  }

  @override
  Widget build(BuildContext context) {
    final provider = FavoriteProvider.of(context);
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.only(left: 12.0, top: 10, bottom: 15),
        child: Stack(
          children: [
            Container(
              height: 150,
              width: 350,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color(0x5EE9EAEC),
              ),
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(13.0),
                    child: Image.asset(
                      doctor.image,
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
                              doctor.title,
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
                              doctor.subtitle,
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
                              doctor.diftitle,
                              maxLines: 2,
                              style: TextStyle(
                                color: Colors.green,
                              ),
                            ),
                          ],
                        ),
                        Container(height: 5),
                        _buildRatingStars(doctor.rating),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 0,
              right: 15,
              child: IconButton(
                icon:Icon(
                  provider.isExist(doctor)?
                  Icons.favorite:Icons.favorite_border_outlined
                  ,color: Color(0xFF51604F),),
                onPressed: ()=>provider.toggleFavorite(doctor),
              ),
            ),
            Positioned(
              bottom: 8,
              right: 30,
              child: Text(
                " \₹${doctor.price}",
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
