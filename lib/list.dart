import 'dart:collection';

import 'package:flutter/material.dart';

class ListWidget extends StatelessWidget {
  final Map<int, int> counters=HashMap() ;
  ListWidget( {super.key});

  @override
  Widget build(BuildContext context) {
    var list = <Widget>[];
    for (var i = 0; i <= 100; i++) {
      counters[i] =0;
      list.add(ListItemWidget(i,counters));
    }
    return ListView.builder(key: PageStorageKey<String>("listtask"),itemCount: list.length,itemBuilder: (context,index)=> list[index]);
  }
}

class ListItemWidget extends StatefulWidget {
  final Map<int, int> counters;
  final int index;
  const ListItemWidget(this.index,this.counters, {super.key});
  @override
  State<ListItemWidget> createState() => _ListItemWidgetState();
}


class _ListItemWidgetState extends State<ListItemWidget> {
  @override
  Widget build(BuildContext context) {
    int value = widget.counters[widget.index] ?? 0;

    return Container(
        padding: const EdgeInsets.all(4),
        child: Row(
          children: [
            Text(value.toString()),
            MaterialButton(
              onPressed: () {
                setState(() {
                  value++;
                  widget.counters[widget.index] = value;
                });
              },
              child: const Text("+"),
            )
          ],
        ));
  }
}
