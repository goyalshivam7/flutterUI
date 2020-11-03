import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './transaction.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final List<Transaction> transaction = [
    Transaction(
      id: 'asd',
      title: 'helo',
      amount: 555.55,
      date: DateTime.now(),
    ),
    Transaction(
      id: 'a2',
      title: 'hey',
      amount: 365.05,
      date: DateTime.now(),
    ),
  ];

  final titleController = TextEditingController();
  final idController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[900],
        title: Text(
          'WorkTrolly',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
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
                    onPressed: () {},
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
    );
  }

  Widget buildTextField(String input, dynamic data) => TextField(
        decoration: InputDecoration(labelText: input),
        controller: data,
      );

  Widget buildRowData(String x, String y) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Row(
        children: [
          Container(
            width: 90,
            color: Colors.blueGrey[900],
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 9),
              child: Text(
                x,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            y,
            style: TextStyle(
              fontSize: 14,
              color: Colors.white70,
            ),
          ),
        ],
      ),
    );
  }
}
