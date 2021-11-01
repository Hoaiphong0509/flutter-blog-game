import 'package:flutter/material.dart';
import 'package:gameblog/View/EsportNews/EsportAllNews.dart' as allnews;
import 'package:gameblog/View/EsportNews/EsportNews_Gallery.dart'as gallery;

class EsportNews extends StatefulWidget {
  const EsportNews({Key? key}) : super(key: key);

  @override
  _EsportNewsState createState() => _EsportNewsState();
}

class _EsportNewsState extends State<EsportNews> with SingleTickerProviderStateMixin  {
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
        title: Text("ESPORT NEWS"),
        backgroundColor: Color(0xFF272b4a),
      ),

      body: TabBarView(
        controller: controller,
        children: <Widget>[
          allnews.EsportNews(),
        ],
      ),
    );
  }
}
