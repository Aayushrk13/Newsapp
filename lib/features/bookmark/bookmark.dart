import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newsapp/features/home/providers/bookmarkprovider.dart';
import 'package:newsapp/features/article/articleblock.dart';

class Bookmark extends ConsumerStatefulWidget {
  const Bookmark({super.key});
  @override
  ConsumerState<Bookmark> createState() => _BookmarkState();
}

class _BookmarkState extends ConsumerState<Bookmark> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(bookmarkprovider).getarticles();
    });
  }

  @override
  Widget build(BuildContext context) {
    final bookmarkstate = ref.watch(bookmarkprovider);

    void openarticle(index) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) {
            return Articleblock(article: bookmarkstate.savedarticles[index]);
          },
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade300,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black, size: 22),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: ListView(
        children: List.generate(
          bookmarkstate.savedarticles.length,
          (index) => GestureDetector(
            onTap:
                () => {
                  if (bookmarkstate.savedarticles[index].url != null)
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
                      bookmarkstate.savedarticles[index].imgurl ?? "",
                      errorBuilder: (context, error, stackTrace) {
                        return Image.asset("assets/logo/placeholder.png");
                      },
                      fit: BoxFit.cover,
                    ),
                  ),
                  Text(
                    bookmarkstate.savedarticles[index].title ?? '',
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    bookmarkstate.savedarticles[index].description ?? '',
                    maxLines: 8,
                    // overflow: TextOverflow.ellipsis
                  ),
                  Text(
                    bookmarkstate.savedarticles[index].publisher != null ||
                            bookmarkstate.savedarticles[index].publisher != ''
                        ? "Published by: ${bookmarkstate.savedarticles[index].publisher}"
                        : '',
                    style: TextStyle(fontSize: 12, color: Colors.grey[500]),
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      onPressed: () {
                        ref.read(bookmarkprovider).deletearticle(index);
                      },
                      icon: Icon(Icons.bookmark),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
