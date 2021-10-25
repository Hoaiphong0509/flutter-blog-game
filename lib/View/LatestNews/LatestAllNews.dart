import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';
import 'package:flutter_slidable/flutter_slidable.dart';

class LatestNews extends StatefulWidget {



  @override
  _LatestNewsState createState() => _LatestNewsState();
}

class _LatestNewsState extends State<LatestNews> {

  Future getallPost() async{



    late List<DocumentSnapshot<Map<String, dynamic>>> snapshot;
  /*  var firestore = FirebaseFirestore.instance;*/
    CollectionReference<Map<String, dynamic>> collectionReference =
    FirebaseFirestore.instance.collection('BreakingAllNews');
    /*QuerySnapshot snapshot=await firestore.collection("BreakingAllNews").get();
    return snapshot.docs;*/


  }




  Future<Null> onRefresh() async{
    await Future.delayed(Duration(seconds: 5));
    setState(() {
      getallPost();
    });
  }





  @override
  Widget build(BuildContext context) {
    return new Scaffold(

      body: FutureBuilder(
        initialData: [],
        future: getallPost(),
        builder: (context,AsyncSnapshot<dynamic> snapshot){

          if(snapshot.connectionState==ConnectionState.waiting){
            return Center(
              child: Text(
                "Data loading...",
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.white
                ),
              ),
            );
          }else{
            return RefreshIndicator(
                onRefresh: onRefresh,
              child: ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    return Slidable(
                      actionPane: SlidableDrawerActionPane(),
                       actions: <Widget>[
                          IconSlideAction(
                          caption: 'Archive',
                          color: Colors.blue,
                          icon: Icons.archive,
                          ),
                       ],

                      child: Container(
                          height: 170.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Color(0xFF272b4a)
                      ),

                      margin: EdgeInsets.all(6.0),
                        child: Row(
                          children:<Widget>[
                            /*Expanded(
                              flex: 1,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15.0),
                                child: Image.network(
                                  "${snapshot.data()?['image']}",
                                    height: 170.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),*/

                            SizedBox(width: 5.0,),

                            Expanded(
                              flex: 2,
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    child: Column(
                                      children: <Widget>[
                                        Text(
                                          snapshot.data[index].data["title"],
                                            style: TextStyle(
                                              fontSize: 19.0,
                                              color: Colors.white
                                            ),
                                        ),
                                        SizedBox(height: 5.0,),
                                        Text(
                                          snapshot.data[index].data["content"],
                                        style: TextStyle(
                                        fontSize: 15.0,
                                            color: Colors.white
                                        ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 5.0,),

                                  Container(
                                    child: Row(
                                      children: <Widget>[
                                        Container(
                                            child: Row(
                                              children: <Widget>[
                                                Icon(Icons.remove_red_eye,
                                                  color: Colors.deepOrange,),
                                                SizedBox(width: 5.0,),

                                                Text(snapshot.data[index].data["views"]+"Views")
                                              ],
                                            ),
                                        ),

                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(20.0),
                                            color: Colors.blueGrey
                                          ),
                                          child: Align(
                                            alignment: Alignment.center,
                                            child: Text("Read More",
                                              style: TextStyle(
                                                fontSize: 20.0,
                                                color: Colors.white
                                              ),
                                            ),
                                          ),

                                        )

                                      ],
                                    ),
                                  )
                                ],
                              ),
                            )


                          ],
                        ),
                      ),
                    );
                }

              ),
            );
          }
        }
      ),

    );
  }
}

