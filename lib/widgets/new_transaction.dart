import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function addTxhandler;
  final titleEditController = TextEditingController();
  final amountEditController = TextEditingController();
  NewTransaction({this.addTxhandler});
  @override
  Widget build(BuildContext context) {
    return Card(
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
                  addTxhandler(titleEditController.text, double.parse(amountEditController.text));
                  print(titleEditController.text);
                  print(amountEditController.text);
                }),
          ],
        ),
      ),
    );
  }
}
