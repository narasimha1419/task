import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;

class MoviesListController extends GetxController {
  //TODO: Implement MoviesListController
  RxList moviesList = [].obs;
  final count = 0.obs;
  ScrollController scrollController = new ScrollController();
  late double scrollPosition;
  int page = 1;
  _scrollListener() async {
    if (scrollController.position.maxScrollExtent > scrollController.offset &&
        scrollController.position.maxScrollExtent - scrollController.offset <=
            55) {
      page = (page + 1);
      print(page);
      getMoviesList();
    }
  }

  var key = 'b87f9bde09b8ddbf112b87980a0dc813';
  getMoviesList() async {
    var jsonMap;
    var client = http.Client();
    try {
      var response = await client.get(
        Uri.parse(
            'https://api.themoviedb.org/3/discover/movie?api_key=${key}&language=en-IN&sort_by=popularity.desc&include_adult=false&include_video=false&page=' +
                page.toString() +
                '&with_watch_monetization_types=flatrate'),
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        var jsonString = response.body;
        jsonMap = json.decode(jsonString);
        // print(jsonMap);
        moviesList.addAll(jsonMap['results']);
        // print(jsonMap['results'].length);
        // = RxList.from(jsonMap);
        // return jsonMap;
      } else {}
    } on SocketException {
      print("error");
      // ));
    } catch (Exception) {
      print(Exception);
    }
    update();
  }

  @override
  void onInit() {
    print("sdcdscsdcsd");

    getMoviesList();
    scrollController = ScrollController();
    scrollController.addListener(_scrollListener);

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
