import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/features/article/articleblock.dart';
import 'package:newsapp/features/home/providers/bookmarkprovider.dart';
import 'package:newsapp/features/home/model/articlemodel.dart';
import 'package:newsapp/features/home/providers/newsprovider.dart';
import 'package:newsapp/core/api_enum.dart';

class NewsBlock extends ConsumerStatefulWidget {
  const NewsBlock({super.key});
  @override
  ConsumerState<NewsBlock> createState() => _NewsBlockState();
}

class _NewsBlockState extends ConsumerState<NewsBlock> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(articleprovider).getnews();
    });
  }

  @override
  Widget build(BuildContext context) {
    final articlestate = ref.watch(articleprovider);
    toggle_bookmark(index) {
      //TODO switch betn icons for the bookmark toggle
      //toggle based on the shared preferences to add and remove articles from here and they can also be removed from bookmark page
      Articlemodel savedarticle = articlestate.articles[index];
      savedarticle.mark = !savedarticle.mark;
      // ref.read(bookmarkprovider).handle_serialize(articlestate.articles[index]);
      if (savedarticle.mark) {
        ref.watch(articleprovider).saved_articles.put(1, savedarticle);
      } else {
        ref.read(articleprovider).saved_articles.delete(1);
      }
    }

    void openarticle(index) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) {
            return Articleblock(article: articlestate.articles[index]);
          },
        ),
      );
    }

    switch (articlestate.apistate) {
      case ApiState.initial:
      case ApiState.loading:
        return Center(child: CircularProgressIndicator(color: Colors.black));
      case ApiState.error:
        return Center(
          child: Column(
            children: [
              Text("Some error has occured"),
              ElevatedButton(
                onPressed: () {
                  ref.read(articleprovider).getnews();
                },
                child: Text("Try Again"),
              ),
            ],
          ),
        );
      case ApiState.success:
        return ListView(
          children: List.generate(
            articlestate.articles.length,
            (index) => GestureDetector(
              onTap:
                  () => {
                    if (articlestate.articles[index].url != null)
                      {openarticle(index)},
                  },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 5,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: Column(
                  spacing: 20,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 180,
                      width: double.infinity,
                      child: Image.network(
                        articlestate.articles[index].imgurl ?? "",
                        errorBuilder: (context, error, stackTrace) {
                          return Image.asset("assets/logo/placeholder.png");
                        },
                        fit: BoxFit.cover,
                      ),
                    ),
                    Text(
                      articlestate.articles[index].title ?? '',
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      articlestate.articles[index].description ?? '',
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      articlestate.articles[index].publisher != null ||
                              articlestate.articles[index].publisher != ''
                          ? "Published by: ${articlestate.articles[index].publisher}"
                          : '',
                      style: TextStyle(fontSize: 12, color: Colors.grey[500]),
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                        onPressed: () {
                          toggle_bookmark(index);
                        },
                        icon:
                            articlestate.articles[index].mark
                                ? Icon(Icons.bookmark)
                                : Icon(Icons.bookmark_add_outlined),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
    }
  }
}
