import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List movies = [];
  @override
  void initState() {
    super.initState();
    getMovies();
  }
  getMovies() async {
    Uri _uri=Uri.parse("https://api.themoviedb.org/3/discover/movie?");
    http.Response response = await http.get(_uri);
    if(response.statusCode == 200){
      Map<String, dynamic> myMap = json.decode(response.body);
      movies = myMap["results"];
      setState(() {

      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            Container(
              height: 700,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      "https://images.pexels.com/photos/5691359/pexels-photo-5691459.jpg"),
                ),
              ),
            ),
          ],
        ),
    );
  }
}
