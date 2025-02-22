import 'package:flutter/material.dart';

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
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color(0xffD9D9D9),
            ),
            child: Column(
              spacing: 30,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text.rich(
                  TextSpan(
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
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
                ElevatedButton(onPressed: () {}, child: Text("Continue")),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
