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
            Image(image: const AssetImage("assets/images/gojo.jpg"), height: height * 0.6),
            Column(
              children: [
                Text("Build Awesome Apps", style: Theme.of(context).textTheme.headline3),
                Text("Let's put your creativity on the development highway.",
                    style: Theme.of(context).textTheme.bodyText1,
                    textAlign: TextAlign.center),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      Get.to(LoginScreen());
                    },
                    child: Text("Login".toUpperCase()),
                  ),
                ),
                const SizedBox(width: 10.0),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Get.to(SignUpScreen());
                    },
                    child: Text("Signup".toUpperCase()),
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