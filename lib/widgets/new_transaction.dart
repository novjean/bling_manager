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

    if (enteredTitle.isEmpty || enteredAmount <= 0) return;

    widget.addTx(enteredTitle, enteredAmount);

    // close the modal sheet after data submitted
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
              onSubmitted: (_) => submitData(),
              // fname with () required when called from here

              // onChanged: (value) {
              //   titleInput = value;
              // },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (_) => submitData(),
              //_ is have an argument but I don't want to use it
              // onChanged: (value) => amountInput = value,
            ),
            Container(
              height: 70,
              child: Row(
                children: [
                  Text('No Date Chosen'),
                  FlatButton(
                    textColor: Theme.of(context).primaryColor,
                    child: Text(
                      'Choose Date',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            RaisedButton(
              child: Text('Add Transaction'),
              color: Colors.purple,
              textColor: Theme.of(context).textTheme.button.color,
              onPressed: submitData,
            ),
          ],
        ),
      ),
    );
  }
}
