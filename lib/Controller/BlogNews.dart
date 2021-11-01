import 'package:flutter/material.dart';
import 'package:gameblog/View/BlogNews/BlogAllNews.dart' as allnews;
import 'package:gameblog/View/BlogNews/BlogNews_Gallery.dart'as gallery;

class BlogNews extends StatefulWidget {
  const BlogNews({Key? key}) : super(key: key);

  @override
  _BlogNewsState createState() => _BlogNewsState();
}

class _BlogNewsState extends State<BlogNews> with SingleTickerProviderStateMixin{
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
        title: Text("BLOG NEWS"),
        backgroundColor: Color(0xFF272b4a),
      ),

      body: TabBarView(
        controller: controller,
        children: <Widget>[
          allnews.BlogNews(),
        ],
      ),
    );
  }
}
