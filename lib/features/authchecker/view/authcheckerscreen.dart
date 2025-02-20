import 'package:flutter/material.dart';

class Authcheckerscreen extends StatelessWidget {
  const Authcheckerscreen({super.key});
  @override
  Widget build(BuildContext context) {
    final double statusbarheight = MediaQuery.of(context).padding.top;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            spacing: 10,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(top: statusbarheight + 15, left: 15),
                child: Text("News", style: TextStyle(fontSize: 32)),
              ),
              Text("For the truth"),
            ],
          ),
          Center(child: Image.asset("assets/auth_image/authscreenpicture.png")),
          Center(
            child: Container(
              margin: EdgeInsets.only(bottom: 50),
              child: ElevatedButton(onPressed: () {}, child: Text("Begin")),
            ),
          ),
        ],
      ),
    );
  }
}
