import 'package:hive/hive.dart';
import '../providers/newsprovider.dart';
part 'articlemodel.g.dart';

@HiveType(typeId: 0)
class Articlemodel extends HiveObject {
  @HiveField(0)
  String? publisher;
  @HiveField(1)
  String? author;
  @HiveField(2)
  String? title;
  @HiveField(3)
  String? description;
  @HiveField(4)
  String? url;
  @HiveField(5)
  String? imgurl;
  @HiveField(6)
  String? content;
  @HiveField(7)
  bool mark;
  Articlemodel({
    this.publisher,
    this.author,
    this.description,
    this.imgurl,
    this.title,
    this.content,
    this.url,
    this.mark = false,
  });

  factory Articlemodel.fromJson(Map<String, dynamic> data) => Articlemodel(
    publisher: data['source']['name'],
    author: data['author'],
    description: data['description'],
    imgurl: data['urlToImage'],
    title: data['title'],
    content: data['content'],
    url: data['url'],
  );
}
