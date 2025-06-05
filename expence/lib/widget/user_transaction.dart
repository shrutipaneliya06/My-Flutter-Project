import 'package:flutter/material.dart';
import 'package:expence/widget/new_transaction.dart';
import 'package:expence/widget/transaction_list.dart';
import '../model/transaction.dart';

class UserTransaction extends StatefulWidget {
  const UserTransaction({Key key}) : super(key: key);

  @override
  State<UserTransaction> createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(_addNewTransaction),
        
      ],
    );
  }
}
