import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:newsapp/features/home/model/articlemodel.dart';
import 'package:newsapp/core/api_enum.dart';
import 'package:hive/hive.dart';

final articleprovider = ChangeNotifierProvider((ref) => Newsprovider());

class Newsprovider extends ChangeNotifier {
  List<Articlemodel> articles = [];
  ApiState apistate = ApiState.initial;
  var saved_articles = Hive.box('newsbox');
  Future<void> searchnews(keyword) async {
    final url = Uri.parse(
      'https://newsapi.org/v2/everything?sortBy=popularity&language=en&q=$keyword&searchIn=title&apiKey=93c89c22cf454b829e0124268089e6c9',
    );
    apistate = ApiState.loading;
    notifyListeners();
    try {
      final res = await http.get(url);
      if (res.statusCode == 200) {
        final body = res.body;
        final json = jsonDecode(body);
        articles =
            (json['articles'] as List)
                .map((ele) => Articlemodel.fromJson(ele))
                .toList();
        apistate = ApiState.success;
      } else {
        throw Exception("Failed to get news");
      }
    } catch (e) {
      apistate = ApiState.error;
      print('$e');
    } finally {
      notifyListeners();
    }
  }

  Future<void> getnews() async {
    final url = Uri.parse(
      'https://newsapi.org/v2/top-headlines?language=en&apiKey=93c89c22cf454b829e0124268089e6c9',
    );
    apistate = ApiState.loading;
    notifyListeners();
    try {
      final res = await http.get(url);
      if (res.statusCode == 200) {
        final body = res.body;
        final json = jsonDecode(body);
        articles =
            (json['articles'] as List)
                .map((ele) => Articlemodel.fromJson(ele))
                .toList();
        apistate = ApiState.success;
      } else {
        throw Exception("Failed to get News");
      }
    } catch (e) {
      apistate = ApiState.error;
      print('$e'); //remove after complete.
    } finally {
      notifyListeners();
      //use consumer for later and do notify listeners which makes the variables to use the data in json to be updated.
    }
  }
}
