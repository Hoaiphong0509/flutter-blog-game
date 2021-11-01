import 'package:flutter/material.dart';
import 'package:gameblog/View/LatestNews/LatestAllNews.dart' as allnews;

class LatestNews extends StatefulWidget {
  const LatestNews({Key? key}) : super(key: key);

  @override
  _LatestNews createState() => _LatestNews();
}

class _LatestNews extends State<LatestNews> with SingleTickerProviderStateMixin  {
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
        title: Text("BREAKING NEWS"),
        backgroundColor: Color(0xFF272b4a),
      ),

      body: TabBarView(
        controller: controller,
        children: <Widget>[
          allnews.LatestNews(),
        ],
      ),
    );
  }
}
