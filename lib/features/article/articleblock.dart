import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:newsapp/features/home/model/articlemodel.dart';

class Articleblock extends StatefulWidget {
  final Articlemodel article;
  const Articleblock({super.key, required this.article});

  @override
  State<Articleblock> createState() => _ArticleblockState();
}

class _ArticleblockState extends State<Articleblock> {
  late final WebViewController _controller;
  @override
  void initState() {
    super.initState();
    _controller =
        WebViewController()
          ..setJavaScriptMode(JavaScriptMode.unrestricted)
          ..loadRequest(Uri.parse(widget.article.url!));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Icon(Icons.arrow_back, color: Colors.grey, size: 22),
        ),
      ),
      body: WebViewWidget(controller: _controller),
    );
  }
}
