import 'package:flutter/material.dart';
import 'package:gameblog/View/LatestNews/LatestAllNews.dart' as allnews;
import 'package:gameblog/View/LatestNews/LatestNews_Gallery.dart'as gallery;

class LatestNews extends StatefulWidget {
  const LatestNews({Key? key}) : super(key: key);

  @override
  _LatestNews createState() => _LatestNews();
}

class _LatestNews extends State<LatestNews> with SingleTickerProviderStateMixin  {
  TabController? controller;

  @override
  void initState() {
    controller = new TabController(length: 2, vsync: this);
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
        title: Text("BREAKING NEWS"),
        backgroundColor: Color(0xFF272b4a),

        bottom: TabBar(
          controller: controller,
          indicatorColor: Colors.blueGrey,
          indicatorWeight: 5.0,
          tabs: <Widget>[
            new Tab(icon: Icon(Icons.view_headline), text:"Latest",),
            new Tab(icon: Icon(Icons.image), text:"Gallery", )
          ],

        ),
      ),

      body: TabBarView(
        controller: controller,
        children: <Widget>[
          allnews.LatestNews(),
          gallery.LatestNews_Gallery()

        ],
      ),

    );
  }
}
