import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tpop/Compo/doctormodel.dart';
import 'package:tpop/Compo/user_controller.dart';
import 'package:tpop/MEdication/Doctor_list.dart';
import 'package:tpop/Pages/Home/Container.dart';
import 'package:tpop/Pages/Home/MedTypeGrid.dart';
import 'package:tpop/Pages/Home/Predict.dart';
import 'package:tpop/Pages/appointmentPage/AppointmetnsPage.dart';
import 'package:tpop/Profile/Profile.dart';
import 'package:tpop/MEdication/List_style.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key, this.isNetworkImage = false}) : super(key: key);
  final bool isNetworkImage;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    final box = GetStorage();
    List<Map<String, dynamic>> dataset = []; // Assume dataset is filled with doctor data

    // Retrieve liked doctors from storage
    List<Doctor> likedDoctors = (box.read('likedDoctors') as List<dynamic>?)
        ?.map((e) => Doctor.fromMap(e))
        .toList() ?? [];

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 230,
              child: Column(
                children: [
                  AppBar(
                    automaticallyImplyLeading: false, // This removes the back button
                    title: Text(
                      'AROGYA',
                      style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                    ),
                    actions: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: IconButton(
                          onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => CartPage()),
                          ),
                          icon: Icon(Icons.person,size: 30,),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Color(0xFFA4BFA7),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          Obx(() {
                            final networkImage = controller.user.value.profilePicture;
                            final image = networkImage.isNotEmpty
                                ? networkImage
                                : 'assets/images/profile.png';
                            return Container(
                              width: 80,
                              height: 80,
                              padding: EdgeInsets.all(1),
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: Center(
                                  child: networkImage.isNotEmpty
                                      ? CachedNetworkImage(
                                    fit: BoxFit.cover,
                                    imageUrl: image,
                                    errorWidget: (context, url, error) => Icon(Icons.error),
                                  )
                                      : Image(
                                    fit: BoxFit.cover,
                                    image: isNetworkImage ? NetworkImage(image) : AssetImage(image) as ImageProvider,
                                    height: 120,
                                    width: 120,
                                  ),
                                ),
                              ),
                            );
                          }),
                          SizedBox(width: 16),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Obx(() => Text(
                                controller.user.value.fullName,
                                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
                              )),
                              Obx(() => Text(
                                controller.user.value.email,
                                style: TextStyle(fontWeight: FontWeight.w400),
                              )),
                            ],
                          ),
                          Spacer(),
                          IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => ProfilePage()),
                              );
                            },
                            icon: Icon(Icons.edit),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16)
                ],
              ),
            ),
            SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: Row(
                children: [
                  Text(
                    "Select your medication",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 25,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: GridView.count(
                crossAxisCount: 2,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                crossAxisSpacing: 30,
                mainAxisSpacing: 30,
                children: [
                  MedTypeGrid(
                    onPressed: () {
                      Get.to(() => MedicationPage(
                        medicationType: 'Ayurveda',
                        backgroundColor: Color(0xFFA4BFA7),
                      ));
                    },
                    image: 'assets/images/download-removebg-preview.png',
                    colors: '0xffE9EAEC',
                    title: 'Ayurveda',
                  ),
                  MedTypeGrid(
                    onPressed: () {
                      Get.to(() => MedicationPage(
                        medicationType: 'Gyno',
                        backgroundColor: Color(0xFFE9A5A1),
                      ));
                    },
                    image: 'assets/images/download-removebg-preview (4).png',
                    colors: '0xffE9EAEC',
                    title: 'Dental',
                  ),
                  MedTypeGrid(
                    onPressed: () {
                      Get.to(() => MedicationPage(
                        medicationType: 'Brain',
                        backgroundColor: Color(0xFFA9CCE3),
                      ));
                    },
                    image: 'assets/images/download-removebg-preview (1).png',
                    colors: '0xffE9EAEC',
                    title: 'Brain',
                  ),
                  MedTypeGrid(
                    onPressed: () {
                      Get.to(() => MedicationPage(
                        medicationType: 'Heart',
                        backgroundColor: Color(0xFFF9DCC4),
                      ));
                    },
                    image: 'assets/images/download-removebg-preview (2).png',
                    colors: '0xffE9EAEC',
                    title: 'Heart',
                  ),
                  MedTypeGrid(
                    onPressed: () {
                      Get.to(() => MedicationPage(
                        medicationType: 'Eyes',
                        backgroundColor: Color(0xFFC3E3C6),
                      ));
                    },
                    image: 'assets/images/download-removebg-preview (3).png',
                    colors: '0xffE9EAEC',
                    title: 'Eyes',
                  ),
                ],
              ),
            ),
            SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: Row(
                children: [
                  Text(
                    "Select your medication",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 25,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            CustomContainers(
              title: "Check your medication",
              subtitle: 'Fast and secure',
              onPressed: () {
                Get.to(Prediction());
              },
            ),
            SizedBox(height: 20),
            // Padding(
            //   padding: const EdgeInsets.only(left: 12.0),
            //   child: Row(
            //     children: [
            //       Text(
            //         "Liked Doctors",
            //         style: TextStyle(
            //           fontWeight: FontWeight.w600,
            //           fontSize: 27,
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            // SizedBox(height: 20),
            // ListView.builder(
            //   shrinkWrap: true,
            //   physics: NeverScrollableScrollPhysics(),
            //   itemCount: likedDoctors.length,
            //   itemBuilder: (context, index) {
            //     final doctor = likedDoctors[index];
            //     return Liststyle(
            //       doctor: doctor,
            //       onPressed: () {
            //         // Navigate to details page if necessary
            //       },
            //     );
            //   },
            // ),
            // if (likedDoctors.isEmpty)
            //   Padding(
            //     padding: const EdgeInsets.all(16.0),
            //     child: Text(
            //       'No liked doctors.',
            //       style: TextStyle(fontSize: 18),
            //     ),
            //   ),

          ],
        ),
      ),
    );
  }
}
