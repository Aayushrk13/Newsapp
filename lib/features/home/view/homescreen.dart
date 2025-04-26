import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newsapp/features/bookmark/bookmark.dart';
import 'newsblock.dart';
import 'package:newsapp/features/home/providers/newsprovider.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
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

  final TextEditingController searchcontroller = TextEditingController();
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "News",
                    style: TextStyle(fontSize: 36, fontWeight: FontWeight.w900),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context){
                            return Bookmark();
                          },
                        ),
                      );
                    },
                    icon: Icon(Icons.bookmark_outline),
                  ),
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
            SizedBox(
              height: 50,
              child: TextField(
                controller: searchcontroller,
                onSubmitted: (val) {
                  FocusScope.of(context).unfocus();
                  ref.read(articleprovider).searchnews(val);
                },
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  hintText: "Search",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)
                  ),
                ),
              ),
            ),
            Flexible(child: NewsBlock()),
          ],
        ),
      ),
    );
  }
}
