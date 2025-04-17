import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:newsapp/features/home/model/articlemodel.dart';
import 'package:newsapp/features/home/providers/newsprovider.dart';
import 'package:shared_preferences/shared_preferences.dart';

final bookmarkprovider = ChangeNotifierProvider((ref) => Bookmarkprovider());
var saved_articles = Hive.box('newsbox');

class Bookmarkprovider extends ChangeNotifier {
List<Articlemodel> savedarticles = [];
  Articlemodel article = Articlemodel(
    publisher: "TechCrunch",
    author: "John Doe",
    content: "This is the full content of the article...",
    description: "A brief description of the article.",
    imgurl: "https://example.com/image.jpg",
    title: "Exciting Tech News Today",
    url: "https://example.com/article",
    mark: true, // optional, defaults to false if omitted
  );
  Articlemodel article1 = Articlemodel(
    publisher: "TechCrunch",
    author: "John Doe",
    content: "This is the full content of the article...",
    description: "A brief description of the article.",
    imgurl: "https://example.com/image.jpg",
    title: "Exciting Tech News Today",
    url: "https://example.com/article",
    mark: true, // optional, defaults to false if omitted
  );
  void getarticles() {
    saved_articles.put(1, article);
    savedarticles.add(saved_articles.get(1));
  }

  //SERIALIZE
  handle_serialize(article) {
    //use jsonserializable package
    print(article);
  }
}
