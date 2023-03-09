import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function newTxHandler;

  NewTransaction(this.newTxHandler);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
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

    widget.newTxHandler(enteredTitle, enteredAmount);

    Navigator.of(context)
        .pop(); // Close the top most screen (modal sheet) after submit data
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
              keyboardType: TextInputType.numberWithOptions(
                  decimal: true), // To allow for decimal places on iOS
              onSubmitted: (_) => submitData(),
            ),
            Container(
              height: 70,
              child: Row(
                children: <Widget>[
                  Text('No Date Chosen!'),
                  TextButton(
                    onPressed: () {},
                    child: Text('Choose Date', style: TextStyle(fontWeight: FontWeight.bold)),
                    style: TextButton.styleFrom(
                        foregroundColor: Theme.of(context).primaryColor),
                  )
                ],
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: submitData,
                child: Text('Add Transaction'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
