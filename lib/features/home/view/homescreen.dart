import 'package:flutter/material.dart';
import 'newsblock.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  String whichmonth(num) {
    if (num == 1) return "January";
    if (num == 2) return "February";
    if (num == 3) return "March";
    if (num == 4) return "April";
    if (num == 5) return "May";
    if (num == 6) return "June";
    if (num == 7) return "July";
    if (num == 8) return "August";
    if (num == 9) return "September";
    if (num == 10) return "October";
    if (num == 11) return "November";
    if (num == 12) return "December";
    return "not possible";
  }

  String whichday(num) {
    if (num == 1) return "Sunday";
    if (num == 2) return "Monday";
    if (num == 3) return "Tuesday";
    if (num == 4) return "Wednesday";
    if (num == 5) return "Thursday";
    if (num == 6) return "Friday";
    if (num == 7) return "Saturday";
    return 'Not possible';
  }

  @override
  Widget build(BuildContext context) {
    final double statusbarheight = MediaQuery.of(context).padding.top;
    final DateTime currentdate = DateTime.now();
    final month = whichmonth(currentdate.month);
    final String day = whichday(currentdate.weekday);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 24,
          children: [
            Padding(
              padding: EdgeInsets.only(top: statusbarheight),
              child: Row(
                mainAxisAlignment:MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "News",
                    style: TextStyle(fontSize: 36, fontWeight: FontWeight.w900),
                  ),
                  IconButton(onPressed: (){}, icon: Icon(Icons.bookmark_outline))
                ],
              ),
            ),
            Container(
              width: 500,
              height: 50,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.black, width: 1),
                  top: BorderSide(color: Colors.black, width: 1),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "$day, ${currentdate.day} $month",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ), //the current date and day should be here
            Text(
              "Headlines",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
            ),
            SizedBox(height: 600, width: 500, child: NewsBlock()),
          ],
        ),
      ),
    );
  }
}
