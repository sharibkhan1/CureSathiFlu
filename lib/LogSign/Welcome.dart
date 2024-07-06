import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tpop/LogSign/Login/Login.dart';
import 'package:tpop/LogSign/SignUp/Signup.dart';
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    var mediaQuery = MediaQuery.of(context);
    var height = mediaQuery.size.height;

    return Scaffold(
      backgroundColor: Color(0xffDCF6E6),
      body: Container(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image(image: const AssetImage("assets/images/MEDI-ALERTAI_AT_WORK__1_-removebg-preview.png"), height: height * 0.6),
            Column(
              children: [
                Text("Build Awesome Apps"),
                Text("Let's put your creativity on the development highway.",
                    textAlign: TextAlign.center),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.only(left: 25, right: 25, top: 15, bottom: 15),
                      textStyle: const TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
                      backgroundColor: Colors.transparent,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                    ),
                    onPressed: () {
                      Get.to(LoginScreen());
                    },
                    child: Text("Login".toUpperCase(),style: TextStyle(color: Color(0xFF51604F),),),
                  ),
                ),
                const SizedBox(width: 10.0),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.only(left: 25, right: 25, top: 15, bottom: 15),
                      textStyle: const TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
                      backgroundColor: const Color(0xFF51604F),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                    ),
                    onPressed: () {
                      Get.to(SignUpScreen());
                    },
                    child: Text("Signup".toUpperCase(),style: TextStyle(color: Colors.white),),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}