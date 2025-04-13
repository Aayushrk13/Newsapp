class Articlemodel {
  String? publisher;
  String? author;
  String? title;
  String? description;
  String? url;
  String? imgurl;
  String? content;

  Articlemodel({
    this.publisher,
    this.author,
    this.content,
    this.description,
    this.imgurl,
    this.title,
    this.url,
  });

  factory Articlemodel.fromJson(Map<String, dynamic> data) => Articlemodel(
    publisher: data['source']['name'],
    author: data['author'],
    content: data['content'],
    description: data['description'],
    imgurl: data['urlToImage'],
    title: data['title'],
    url: data['url'],
  );
}
