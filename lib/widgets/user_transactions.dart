import 'package:flutter/material.dart';
import './new_transaction.dart';
import './transaction_list.dart';
import '../models/transaction.dart';

class Usertransactions extends StatefulWidget {
  @override
  _UsertransactionsState createState() => _UsertransactionsState();
}

class _UsertransactionsState extends State<Usertransactions> {
  final List<Transaction> _userTransaction = [
    Transaction(
      id: 't1',
      title: 'New Shoes',
      amount: 1200,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Weekly groceries',
      amount: 800,
      date: DateTime.now(),
    ),
  ];
  void _addNewTransaction(String txTitle, double txAmount) {
    final newTx = Transaction(
        id: DateTime.now().toString(),
        title: txTitle,
        amount: txAmount,
        date: DateTime.now());
        setState(() {
          _userTransaction.add(newTx);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTransaction(addTxhandler:_addNewTransaction),
        TransactionList(
          transactions: _userTransaction,
        ),
      ],
    );
  }
}
