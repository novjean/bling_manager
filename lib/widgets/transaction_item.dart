import 'dart:math';

import 'package:bling_manager/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class TransactionItem extends StatefulWidget {
  const TransactionItem({
    Key key,
    @required this.transaction,
    @required this.deleteTx,
  }) : super(key: key);
  // key to forward to parent widget using super above
  //initializer list

  final Transaction transaction;
  final Function deleteTx;

  @override
  _TransactionItemState createState() => _TransactionItemState();
}

class _TransactionItemState extends State<TransactionItem> {
  Color _bgColor;

  @override
  void initState() {
    //initstate is called before build
    const availableColors = [Colors.red, Colors.black, Colors.blue, Colors.purple];
    // max is excluded
    _bgColor = availableColors[Random().nextInt(4)];
    super.initState();
  }

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
          backgroundColor: _bgColor,
          child: Padding(
            // const here since the value of EdgeInsets is known at compilation
            padding: const EdgeInsets.all(6),
            child: FittedBox(
                child: Text('\$${widget.transaction.amount}')),
          ),
        ),
        title: Text(
          widget.transaction.title,
          style: Theme.of(context).textTheme.title,
        ),
        subtitle: Text(
          DateFormat.yMMMd().format(widget.transaction.date),
        ),
        trailing: MediaQuery.of(context).size.width > 460
            ? FlatButton.icon(
          onPressed: () => widget.deleteTx(widget.transaction.id),
          icon: const Icon(Icons.delete),
          textColor: Theme.of(context).errorColor,
          // this object will never ever change, so need to refresh this by using the const
          label: const Text('Delete'),
        )
            : IconButton(
          icon: const Icon(Icons.delete),
          color: Theme.of(context).errorColor,
          onPressed: () => widget.deleteTx(widget.transaction.id),
        ),
      ),
    );
  }
}
