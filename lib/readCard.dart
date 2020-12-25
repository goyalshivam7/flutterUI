import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutterLearning/cardWidget.dart';

class ReadData extends StatefulWidget {
  @override
  _ReadDataState createState() => _ReadDataState();
}

class _ReadDataState extends State<ReadData> {
  CollectionReference ref = FirebaseFirestore.instance.collection('flutter');
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: ref.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          return ListView.builder(
            padding: const EdgeInsets.all(4.0),
            itemCount: snapshot.data.docs.length,
            itemBuilder: (context, index) => Container(
              color: Colors.black,
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  buildRowData('Amount:', snapshot.data.docs[index]['Amount']),
                  buildRowData('Id:', snapshot.data.docs[index]['Id']),
                  buildRowData('Title:', snapshot.data.docs[index]['Title']),
                  // buildRowData('Date:',
                  //     DateFormat('dd/MM/yyyy').format(tx.date)),
                ],
              ),
            ),
          );
        });
  }
}
