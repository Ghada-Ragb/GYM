import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gym/views/pose_detection_view.dart';
import 'package:lottie/lottie.dart';

class ViewMian extends StatelessWidget {
  const ViewMian({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
        onPrimary: Colors.black87,
        primary: Colors.grey[300],
        minimumSize: Size(size.width * 0.85, 36),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
        ));
    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: size.height * 0.15,
            ),
            Container(
              alignment: Alignment.center,
              width: size.width * 0.7,
              height: size.width * 0.7,
              child: Lottie.asset("assets/push-up-animation.json",
                  fit: BoxFit.cover),
            ),
            const SizedBox(
              height: 40,
            ),
            const Text(
              "🏋️Push Up Counter🏋️‍♂️",
              style: TextStyle(
                  color: Color.fromARGB(255, 131, 108, 161),
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  letterSpacing: -0.2),
            ),
            const SizedBox(
              height: 40,
            ),
            const Spacer(),
            ElevatedButton(
              style: raisedButtonStyle,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PoseDetectorView()));
              },
              child: const Text(
                "Start Now!",
                style: TextStyle(
                    color: Color.fromARGB(255, 131, 108, 161),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    letterSpacing: -0.2),
              ),
            ),
            SizedBox(
              height: size.height * 0.1,
            ),
          ],
        ),
      ),
    );
  }
}
