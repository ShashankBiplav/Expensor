import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    widget.addTx(
      //added automatically after refactoring from stateless to stateful
      enteredTitle,
      enteredAmount,
    );
    Navigator.of(context)
        .pop(); //for closing the topmost screen that is open that is Modal Sheet
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              cursorColor: Theme.of(context).accentColor,
              decoration: InputDecoration(
                labelText: 'Title',
                labelStyle: TextStyle(color: Theme.of(context).accentColor),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Theme.of(context).accentColor),
                ),
              ),
              controller: titleController,
              onSubmitted: (_) => submitData(),
              // onChanged: (val) {
              //   titleInput = val;
              // },
            ),
            TextField(
              cursorColor: Theme.of(context).accentColor,
              decoration: InputDecoration(
                labelText: 'Amount',
                labelStyle: TextStyle(color: Theme.of(context).accentColor),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Theme.of(context).accentColor),
                ),
              ),
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData(),
              // onChanged: (val) => amountInput = val,
            ),
            Container(
              margin: EdgeInsets.only(top: 15),
              child: RaisedButton(
                elevation: 10,
                child: Text('Add Transaction'),
                color: Theme.of(context).accentColor,
                textColor: Colors.white,
                onPressed: submitData,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
