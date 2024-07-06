import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tpop/Appointment/Details.dart';
import 'package:tpop/Compo/doctormodel.dart';
import 'package:tpop/MEdication/List_style.dart';
import 'package:tpop/dataset.dart';

class MedicationPage extends StatefulWidget {
  final String medicationType;
  final Color backgroundColor;

  const MedicationPage({
    required this.medicationType,
    required this.backgroundColor,
    Key? key,
  }) : super(key: key);

  @override
  _MedicationPageState createState() => _MedicationPageState();
}

class _MedicationPageState extends State<MedicationPage> {
  int selectedPriceFilter = -1;

  @override
  Widget build(BuildContext context) {
    // Filter the dataset based on the selected medication type and price filter
    List<Doctor> filteredDoctors = dataset
        .where((doctor) => doctor.specialty == widget.medicationType)
        .toList();

    if (selectedPriceFilter != -1) {
      filteredDoctors = filteredDoctors
          .where((doctor) => doctor.price <= selectedPriceFilter)
          .toList();
    }

    return Scaffold(
      backgroundColor: widget.backgroundColor,
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
                      widget.medicationType,
                      style: TextStyle(
                        fontSize: 20,
                        color: Color(0xFF51604F),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: SegmentedButton(
                  segments: const [
                    ButtonSegment(value: -1, label: Text('All ')),
                    ButtonSegment(value: 50, label: Text('50₹ ')),
                    ButtonSegment(value: 70, label: Text('70₹ ')),
                    ButtonSegment(value: 100, label: Text('100₹')),
                  ],
                  selected: {selectedPriceFilter},
                  onSelectionChanged: (newSelection) {
                    setState(() {
                      selectedPriceFilter = newSelection.first;
                    });
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
                      if (states.contains(MaterialState.selected)) {
                        return Colors.white;
                      } else {
                        return Color(0xFFA4BFA7);
                      }
                    }),
                    foregroundColor: MaterialStateProperty.resolveWith<Color>((states) {
                      if (states.contains(MaterialState.selected)) {
                        return Colors.black;
                      } else {
                        return Colors.white;
                      }
                    }),
                    fixedSize: MaterialStateProperty.all<Size>(Size.fromHeight(40)),
                    shape: MaterialStateProperty.all<OutlinedBorder>(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    )),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              // Display the filtered list of doctors
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: filteredDoctors.length,
                itemBuilder: (context, index) {
                  final doctor = filteredDoctors[index];

                  return Liststyle(
                    doctor: doctor,
                    onPressed: () {
                      Get.to(() => DocDetail(
                        doctor: doctor,
                      ));
                    },
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
