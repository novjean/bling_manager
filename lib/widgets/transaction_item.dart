import 'package:bling_manager/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class TransactionItem extends StatelessWidget {
  const TransactionItem({
    Key key,
    @required this.transaction,
    @required this.deleteTx,
  }) : super(key: key);

  final Transaction transaction;
  final Function deleteTx;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 5,
      ),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: Padding(
            // const here since the value of EdgeInsets is known at compilation
            padding: const EdgeInsets.all(6),
            child: FittedBox(
                child: Text('\$${transaction.amount}')),
          ),
        ),
        title: Text(
          transaction.title,
          style: Theme.of(context).textTheme.title,
        ),
        subtitle: Text(
          DateFormat.yMMMd().format(transaction.date),
        ),
        trailing: MediaQuery.of(context).size.width > 460
            ? FlatButton.icon(
          onPressed: () => deleteTx(transaction.id),
          icon: const Icon(Icons.delete),
          textColor: Theme.of(context).errorColor,
          // this object will never ever change, so need to refresh this by using the const
          label: const Text('Delete'),
        )
            : IconButton(
          icon: const Icon(Icons.delete),
          color: Theme.of(context).errorColor,
          onPressed: () => deleteTx(transaction.id),
        ),
      ),
    );
  }
}
