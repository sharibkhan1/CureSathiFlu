import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tpop/Appointment/Details.dart';
import 'package:tpop/MEdication/List_style.dart';
import 'package:tpop/dataset.dart';

class MedicationPage extends StatelessWidget {
  final String medicationType;
  final Color backgroundColor;

  const MedicationPage({
    required this.medicationType,
    required this.backgroundColor,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Filter the dataset based on the selected medication type
    final List<Map<String, dynamic>> filteredDoctors = dataset.where((doctor) => doctor['specialty'] == medicationType).toList();

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40,),
              Row(
                children: [
                  IconButton(onPressed: ()=>Get.back(), icon:Icon(Icons.arrow_back_ios)),
                  Text('Select your doctor',
                    style: TextStyle(
                      fontSize: 29,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(left: 18.0),
                 child:Row(
                   children: [
                     Text(
                       'MedicationType:  ',
                       style: TextStyle(
                         fontSize: 20,
                         fontWeight: FontWeight.w600,
                       ),
                     ),
                     Text(
                      medicationType,
                      style: TextStyle(
                        fontSize: 20,
                        color: Color(0xFF51604F),
                        fontWeight: FontWeight.w600,
                      ),
                     ),
                   ],
                 ),
              ),
              SizedBox(height: 0,),
              // Display the filtered list of doctors
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: filteredDoctors.length,
                itemBuilder: (context, index) {
                  final doctor = filteredDoctors[index];
                  return Liststyle(
                    image: doctor['image'],
                    title: doctor['title'],
                    subtitle: doctor['subtitle'],
                    diftitle: doctor['diftitle'],
                    price: doctor['price'].toString(),
                    onPressed: () {Get.to(() => DocDetail(
                      image: doctor['image'], // Pass the image of the selected doctor
                      title: doctor['title'], // Pass the title of the selected doctor
                      subtitle: doctor['subtitle'], // Pass the subtitle of the selected doctor
                      specialty: doctor['specialty'], // Pass the specialty of the selected doctor
                      price: doctor['price'].toString(), // Pass the price of the selected doctor
                      diftitle: doctor['diftitle'],
                      address: doctor['address'],
                    ),);},
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
