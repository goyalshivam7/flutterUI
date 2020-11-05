 import 'package:flutter/material.dart';

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