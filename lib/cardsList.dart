// import 'package:flutter/material.dart';
// import 'package:flutterLearning/cardWidget.dart';
// import 'package:intl/intl.dart';
// import './transaction.dart';

// class CardsList extends StatefulWidget {
//   @override
//   _CardsListState createState() => _CardsListState();
// }

// class _CardsListState extends State<CardsList> {
//   final List<Transaction> transaction = [];

//   final titleController = TextEditingController();
//   final idController = TextEditingController();
//   final amountController = TextEditingController();

//   void _addTransaction(String idTx, String titleTx, double amountTx) {
//     final newTx = Transaction(
//       id: idTx,
//       title: titleTx,
//       amount: amountTx,
//       date: DateTime.now(),
//     );

//     setState(() {
//       transaction.add(newTx);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           Card(
//             color: Colors.lightBlueAccent,
//             child: Container(
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Text(
//                   'Task',
//                   style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
//                 ),
//               ),
//             ),
//             elevation: 7,
//           ),
//           Card(
//             elevation: 9,
//             child: Padding(
//               padding: const EdgeInsets.symmetric(
//                 vertical: 5.0,
//                 horizontal: 16,
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.end,
//                 children: [
//                   Container(
//                     width: double.infinity,
//                     child: Text(
//                       'Add Task',
//                       style:
//                           TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                   buildTextField('Title', titleController),
//                   buildTextField('Id', idController),
//                   buildTextField('Amount', amountController),
//                   FlatButton(
//                     child: Text('Submit'),
//                     onPressed: () {
//                       print(titleController.text);
//                       _addTransaction(titleController.text, idController.text,
//                           double.parse(amountController.text));
//                     },
//                     color: Colors.blueAccent,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           ListView.builder(
//             itemBuilder: (context, index) {
//               return Card(
//                 color: Colors.black,
//                 child: Padding(
//                   padding: const EdgeInsets.all(12.0),
//                   child: Column(
//                     children: [
//                       buildRowData(
//                           'Amount:', '\$ ${transaction[index].amount}'),
//                       buildRowData('Id:', transaction[index].id.toString()),
//                       buildRowData(
//                           'Title:', transaction[index].title.toString()),
//                       buildRowData(
//                           'Date:',
//                           DateFormat('dd/MM/yyyy')
//                               .format(transaction[index].date)),
//                     ],
//                   ),
//                 ),
//               );
//             },
//             itemCount: transaction.length,
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutterLearning/cardWidget.dart';
import './transaction.dart';

class CardsList extends StatefulWidget {
  @override
  _CardsListState createState() => _CardsListState();
}

class _CardsListState extends State<CardsList> {
  final List<Transact> transaction = [];

  void _addTransaction(String idTx, String titleTx, double amountTx) {
    final newTx = Transact(
      id: idTx,
      title: titleTx,
      amount: amountTx,
      date: DateTime.now(),
    );

    setState(() {
      transaction.add(newTx);
    });
  }

  final titleController = TextEditingController();
  final idController = TextEditingController();
  final amountController = TextEditingController();

  CollectionReference ref = FirebaseFirestore.instance.collection('flutter');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Card(
            elevation: 9,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 7.0,
                horizontal: 16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    width: double.infinity,
                    child: Text(
                      'Add Task',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  buildTextField('Title', titleController),
                  buildTextField('Id', idController),
                  buildTextField('Amount', amountController),
                  FlatButton(
                    child: Text('Submit'),
                    onPressed: () {
                      ref.add({
                        'Title': titleController.text,
                        'Id': idController.text,
                        'Amount': '7777'
                      });
                      // _addTransaction(titleController.text, idController.text,
                      //     double.parse(amountController.text));
                    },
                    color: Colors.blueAccent,
                  ),
                ],
              ),
            ),
          ),
    );
  }
}
