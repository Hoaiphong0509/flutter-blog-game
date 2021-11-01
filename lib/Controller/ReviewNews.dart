import 'package:flutter/material.dart';
import 'package:gameblog/View/ReviewNews/ReviewAllNews.dart' as allnews;
import 'package:gameblog/View/ReviewNews/ReviewNews_Gallery.dart' as gallery;

class ReviewNews extends StatefulWidget {
  const ReviewNews({Key? key}) : super(key: key);

  @override
  _ReviewNewsState createState() => _ReviewNewsState();
}

class _ReviewNewsState extends State<ReviewNews>
    with SingleTickerProviderStateMixin {
  TabController? controller;

  @override
  void initState() {
    controller = new TabController(length: 1, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(

      appBar: AppBar(
        title: Text("Review Games"),
        backgroundColor: Color(0xFF272b4a),
      ),

      body: TabBarView(
        controller: controller,
        children: <Widget>[
          allnews.ReviewNew(),
        ],
      ),
    );
  }
}
