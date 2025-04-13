import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/features/article/articleblock.dart';
import 'package:newsapp/features/home/providers/newsprovider.dart';
import 'package:newsapp/core/api_enum.dart';

class NewsBlock extends ConsumerStatefulWidget {
  const NewsBlock({super.key});
  @override
  ConsumerState<NewsBlock> createState() => _NewsBlockState();
}

class _NewsBlockState extends ConsumerState<NewsBlock> {
  final obj = Newsprovider();

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
    toggle_bookmark(){
      //TODO switch betn icons for the bookmark toggle
      //toggle based on the shared preferences to add and remove articles from here and they can also be removed from bookmark page
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
              onTap: () =>{
                if (articlestate.articles[index].url != null) {
                  openarticle(index)
                }
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
                    Container(
                      alignment: Alignment.centerRight,
                      child: IconButton(onPressed: (){}, icon:Icon(Icons.bookmark_add_outlined)),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
    }
    // return SizedBox(
    //   height: 400,
    //   width: 200,
    //   child: Container(
    //     color: Color(0xffECF4F6),
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       mainAxisAlignment: MainAxisAlignment.spaceAround,
    //       children: [
    //         SizedBox(
    //           height: 200,
    //           width: 400,
    //           child: Placeholder(child: Text("Here goes the image")),
    //         ),
    //         Text(
    //           articlestate.articles[0].title ?? '',
    //           style: TextStyle(fontSize: 30),
    //         ),
    //         Text(
    //           "This is the block for the news space for the newsdata from the api",
    //           maxLines: 5,
    //           overflow: TextOverflow.ellipsis,
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}
