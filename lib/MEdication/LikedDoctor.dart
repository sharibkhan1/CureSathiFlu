// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:tpop/Compo/doctormodel.dart';
// import 'package:tpop/MEdication/List_style.dart';
// import 'package:tpop/dataset.dart';
//
// class LikedDoctorsPage extends StatefulWidget {
//   @override
//   _LikedDoctorsPageState createState() => _LikedDoctorsPageState();
// }
//
// class _LikedDoctorsPageState extends State<LikedDoctorsPage> {
//   List<Doctor> likedDoctors = [];
//
//   @override
//   void initState() {
//     super.initState();
//     _loadLikedDoctors();
//   }
//
//   Future<void> _loadLikedDoctors() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     List<Doctor> allDoctors = dataset.map((map) => Doctor.fromMap(map as Map<String, dynamic>)).toList();
//     setState(() {
//       likedDoctors = allDoctors.where((doctor) => prefs.getBool('liked_${doctor.id}') ?? false).toList();
//     });
//   }
//
//   Future<void> _unlikeDoctor(Doctor doctor) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     setState(() {
//       doctor.liked = false;
//       likedDoctors.remove(doctor);
//     });
//     await prefs.setBool('liked_${doctor.id}', false);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Liked Doctors'),
//       ),
//       body: likedDoctors.isEmpty
//           ? Center(child: Text('No liked doctors'))
//           : ListView.builder(
//         itemCount: likedDoctors.length,
//         itemBuilder: (context, index) {
//           final doctor = likedDoctors[index];
//           return Liststyle(
//             doctor: doctor,
//             onPressed: () {
//               // Navigate to details page if necessary
//             },
//             key: Key(doctor.id.toString()),
//           );
//         },
//       ),
//     );
//   }
// }
