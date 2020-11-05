import 'package:flutter/material.dart';
import 'package:flutterLearning/cardWidget.dart';
import 'package:intl/intl.dart';
import './transaction.dart';

class CardsList extends StatefulWidget {
  @override
  _CardsListState createState() => _CardsListState();
}

class _CardsListState extends State<CardsList> {
  final List<Transaction> transaction = [];

  void _addTransaction(String idTx, String titleTx, double amountTx) {
    final newTx = Transaction(
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
              child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Card(
              color: Colors.lightBlueAccent,
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Task',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              elevation: 7,
            ),
            Card(
              elevation: 9,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 5.0,
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
                        print(titleController.text);
                        _addTransaction(titleController.text , idController.text, double.parse(amountController.text));
                      },
                      color: Colors.blueAccent,
                    ),
                  ],
                ),
              ),
            ),
            Column(
              children: transaction.map((tx) {
                return Card(
                  color: Colors.black,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        buildRowData('Amount:', '\$ ${tx.amount}'),
                        buildRowData('Id:', tx.id.toString()),
                        buildRowData('Title:', tx.title.toString()),
                        buildRowData(
                            'Date:', DateFormat('dd/MM/yyyy').format(tx.date)),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
