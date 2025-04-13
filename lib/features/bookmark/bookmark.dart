import 'package:flutter/material.dart';

class Bookmark extends StatefulWidget {
  const Bookmark({super.key});
  handle_toggle_bookmark(){
    //TODO handle the toggleing of bookmark from the newsblock from now
    //use shared preferences to store the whole data locally
    //show the articles on the basis of locally stored and remove them when toggled from here 
  }
  @override
  State<Bookmark> createState() => _BookmarkState();
}

class _BookmarkState extends State<Bookmark> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
