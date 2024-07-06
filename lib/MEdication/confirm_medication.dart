import 'package:flutter/material.dart';
import 'package:tpop/Compo/doctormodel.dart';
import 'package:tpop/Navbar/nav_menu.dart';
import 'package:tpop/Pages/Home/Home.dart';
import 'package:tpop/Pages/appointmentPage/AppointmetnsPage.dart';
import 'package:tpop/provider/cartProvider.dart';

class AppointmentConfirmation extends StatelessWidget {
  final Doctor doctor;
  final DateTime date;
  final TimeOfDay time;
  final String patientFullName; // New property for patient's full name

  const AppointmentConfirmation({
    required this.doctor,
    required this.date,
    required this.time,
    required this.patientFullName, // Initialize the new property
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = CartProvider.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor:  Color(0xFFA4BFA7),
        title: Text('Appointment Confirmation'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Text(
              'Appointment with: \n${doctor.title}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),
            Text(
              'Patient Name:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            Text(
              patientFullName, // Display patient's full name
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 30),
            Text(
              'Specialty:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            Text(
              doctor.specialty,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'Date:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            Text(
              '${date.day}/${date.month}/${date.year}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'Time:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            Text(
              '${time.hour}:${time.minute.toString().padLeft(2, '0')}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'Price:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            Text(
              '\$${doctor.price}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 30),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  provider.toggleProduct(doctor);
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CartPage(),
                      settings: RouteSettings(
                        arguments: {
                          'date': date,
                          'time': time,
                        },
                      ),
                    ),
                        (Route<dynamic> route) => false,
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.only(left: 25, right: 25, top: 15, bottom: 15),
                  textStyle: const TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
                  backgroundColor: const Color(0xFF51604F),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                ),
                child: Text(
                  'Confirm Appointment',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}