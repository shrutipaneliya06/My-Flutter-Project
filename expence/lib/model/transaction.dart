import 'package:flutter/foundation.dart';

class transaction {
  final String id;
  final String title;
  final int amount;
  final DateTime date;

  transaction(
      {@required this.id,
      @required this.title,
      @required this.amount,
      @required this.date});
}
