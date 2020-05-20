import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expensor',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
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
  // String titleInput;
  // String amountInput;
  final titleEditController = TextEditingController();
  final amountEditController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expensor'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
            width: double.infinity,
            height: 200,
            child: Card(
              color: Colors.pink,
              shadowColor: Colors.pinkAccent,
              child: Text('Chart'),
              elevation: 10,
            ),
          ),
          Card(
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(labelText: 'Title'),
                    // onChanged: (value) {
                    //   // the datatype of 'value' is string which is automatically inferred by dart
                    //   titleInput = value;
                    // },
                    controller: titleEditController,
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: 'Amount'),
                    // onChanged: (value) => amountInput = value,
                    controller: amountEditController,
                  ),
                  RaisedButton(
                      elevation: 12,
                      color: Colors.deepPurple,
                      child: Text('Add transaction'),
                      textColor: Colors.white,
                      onPressed: () {
                        print(titleEditController.text);
                        print(amountEditController.text);
                      }),
                ],
              ),
            ),
          ),
          Column(
            children: transactions.map((tx) {
              return Card(
                margin: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                elevation: 10,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsetsDirectional.only(start: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            tx.title,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            DateFormat.yMMMd().format(tx.date),
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 15,
                      ),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.purple,
                          width: 2,
                        ),
                      ),
                      child: Text(
                        '₹ ${tx.amount}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.purple,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
