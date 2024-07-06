import 'package:flutter/material.dart';
import 'package:tpop/Compo/customButton.dart';
import 'package:tpop/Compo/doctormodel.dart';
import 'package:tpop/MEdication/confirm_medication.dart';// Import the confirmation page

class DocDetail extends StatefulWidget {
  final Doctor doctor;

  const DocDetail({
    required this.doctor,
    Key? key,
  }) : super(key: key);

  @override
  _DocDetailState createState() => _DocDetailState();
}

class _DocDetailState extends State<DocDetail> {
  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  Future<void> _selectDateTime(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null) {
      final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );

      if (pickedTime != null) {
        setState(() {
          selectedDate = pickedDate;
          selectedTime = pickedTime;
        });
      }
    }
  }

  String get formattedDate {
    if (selectedDate == null) {
      return 'Date';
    } else {
      return "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}";
    }
  }

  String get formattedTime {
    if (selectedTime == null) {
      return 'Time';
    } else {
      return "${selectedTime!.hour}:${selectedTime!.minute.toString().padLeft(2, '0')}";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // For image
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: MediaQuery.of(context).size.height * 0.45,
            child: Hero(
              tag: widget.doctor.image,
              child: Container(
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                child: Image.asset(
                  widget.doctor.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.4,
            left: 0,
            right: 0,
            height: MediaQuery.of(context).size.height * 0.69,
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xFFA4BFA7),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(top: 27, left: 15, right: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // for name
                      Text(
                        widget.doctor.title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 40,

                        ),
                      ),
                      // For doctor category
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "Contact No:",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Color(0xFF51604F)
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      // about docutor
                      Text(
                        widget.doctor.subtitle,
                        style: const TextStyle(
                          height: 2,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      // for schedules
                      const Text(
                        "Schedule Date:",
                        style: TextStyle(
                          color: Color(0xFF51604F),
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 70,
                        decoration: BoxDecoration(
                          color: Color(0xFF51604F),
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 15,
                            ),
                            Expanded(
                              flex: 3,
                              child: Container(
                                height: 60,
                                decoration: BoxDecoration(
                                    color: Color(0xFFA4BFA7),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Center(
                                  child: Text(
                                    formattedDate,
                                    style: const TextStyle(
                                      fontSize: 20,
                                      height: 0.9,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 15),
                            Expanded(
                              flex: 2,
                              child: Container(
                                height: 60,
                                decoration: BoxDecoration(
                                  color: Color(0xFFA4BFA7),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Center(
                                  child: Text(
                                    formattedTime,
                                    style: const TextStyle(
                                      fontSize: 20,
                                      height: 0.9,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 15),
                            IconButton(
                              icon: const Icon(Icons.calendar_today, color: Colors.white),
                              onPressed: () => _selectDateTime(context),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 2),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Consultation:",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                    color: Color(0xFF51604F)
                                ),
                              ),
                              Text(
                                widget.doctor.diftitle,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      ButtonsCustom(
                        onPressed: () {
                          if (selectedDate != null && selectedTime != null) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AppointmentConfirmation(
                                  doctor: widget.doctor,
                                  date: selectedDate!,
                                  time: selectedTime!,
                                  patientFullName: "John Doe",
                                ),
                              ),
                            );
                          } else {
                            // Show an error or a toast
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Please select date and time'),
                              ),
                            );
                          }
                        },
                        text: 'Book Now',
                      ),

                    ],
                  ),
                ),
              ),
            ),
          ),
          // for back button
          Positioned(
            top: MediaQuery.of(context).padding.top,
            left: 15,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.keyboard_arrow_left,
                color: Colors.black,
                size: 35,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
