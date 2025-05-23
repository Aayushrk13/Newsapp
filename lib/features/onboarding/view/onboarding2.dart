import 'package:flutter/material.dart';
import 'package:newsapp/features/onboarding/view/onboarding3.dart';

class Onboarding2 extends StatelessWidget {
  const Onboarding2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          //row is used here to align the image to the left of the scereen
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [Image.asset("assets/auth_image/onboarding2.png")],
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
                      TextSpan(text: "Editor's\n"),
                      TextSpan(text: "Hand-Picked"),
                    ],
                  ),
                ),
                Text(
                  "Stay informed with expertly curated news from trusted sources. Our editors select the most relevant and insightful stories daily, ensuring you get the best coverage across politics, tech, business, entertainment, and more.",
                  textAlign: TextAlign.center,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) {
                          return Onboarding3();
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
