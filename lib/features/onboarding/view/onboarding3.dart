import 'package:flutter/material.dart';
import 'package:newsapp/features/home/view/homescreen.dart';

class Onboarding3 extends StatelessWidget {
  const Onboarding3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          //row is used here to align the image to the left of the scereen
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [Image.asset("assets/auth_image/onboarding3.png")],
          ),
          Container(
            height: 360,
            width: 350,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color(0xffECF4F6),
            ),
            child: Column(
              spacing: 30,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text.rich(
                  TextSpan(
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
                    children: [
                      TextSpan(text: "Thoughtful and\n"),
                      TextSpan(text: "Focused"),
                    ],
                  ),
                ),
                Text(
                  "Stay informed with a news app that is both thoughtful and focused—delivering carefully curated, in-depth stories that matter, without the noise. Get the latest updates with clarity, accuracy, and relevance.",
                  textAlign: TextAlign.center,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) {
                          return HomeScreen();
                        },
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(fixedSize: Size(300, 50)),
                  child: Text("Continue"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
