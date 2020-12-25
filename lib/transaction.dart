import 'package:flutter/foundation.dart';

class Transact {
  final String id;
  final String title;
  final double amount;
  final DateTime date;

  Transact({
    @required this.id,
    @required this.title,
    @required this.amount,
    @required this.date,
  });
}
