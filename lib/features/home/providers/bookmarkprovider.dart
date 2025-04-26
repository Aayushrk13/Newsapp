import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newsapp/features/home/model/articlemodel.dart';
import 'package:hive/hive.dart';
import 'newsprovider.dart';

final bookmarkprovider = ChangeNotifierProvider((ref) => Bookmarkprovider());
var savedbox = Hive.box('newsbox');

class Bookmarkprovider extends ChangeNotifier {
  List<Articlemodel> savedarticles = [];
  void getarticles() {
    savedarticles.clear();
    for (var key in savedbox.keys) {
      savedarticles.add(savedbox.get(key));
    }
    notifyListeners();
  }

  void deletearticle(index) {
    Newsprovider().update_mark(savedbox.getAt(index).title);
    savedbox.deleteAt(index);
    savedbox.compact();
    getarticles();
  }
}
