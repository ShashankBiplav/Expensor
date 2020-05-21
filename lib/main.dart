import 'package:flutter/material.dart';
import './widgets/user_transactions.dart';

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
      body:  Column(
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
           Usertransactions(),
          ],
        ),
    );
  }
}
