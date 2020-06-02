import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BuildMe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new StreamBuilder(
      stream: Firestore.instance
          .collection('Articles')
          .where('Genre', isEqualTo: 'Sports')
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) return new Text('Loading...');
        return new PageView(
          children: snapshot.data.documents.map((document) {
            return new Scaffold(
              body: Column(
                children: <Widget>[
                  Text(document['title'], style: TextStyle( fontSize: 60)),
                  Text (document['Genre'], style: TextStyle( fontSize: 50),),
                  Text (document['bulletone'], style: TextStyle( fontSize: 30),),
                  Text (document['bullettwo'], style: TextStyle( fontSize: 30),)

                ],
              ),
//              Text(document['title'], style: TextStyle( fontSize: 90),),
//              height: 800,

            );
          }).toList(),
        );
      },
    );
  }
}

//Widget buildMe() {
//  return Container(
//    child: Center(
//      child: StreamBuilder<QuerySnapshot>(
//          stream: Firestore.instance
//              .collection('articles')
//              .where('Genre', isEqualTo: 'Sports')
//              .orderBy('Date posted')
//              .snapshots(),
//          builder:
//              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//            if (!snapshot.hasData) {
//              return const Text('Loading...');
//            }
//
//            return ListView.builder(
//              itemCount: snapshot.data.documents.length,
//              itemBuilder: (BuildContext context, int index) =>
//                  buildMe(context, snapshot.data.documents[index]),
//            );
//          }),
//    ),
//  );
//}

//
//
//child: StreamBuilder<QuerySnapshot>(
//stream: Firestore.instance
//    .collection('articles')
//.where('Genre', isEqualTo: 'Sports')
//.orderBy('Date posted')
//.snapshots(),
