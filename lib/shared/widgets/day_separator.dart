import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DaySeparator extends StatelessWidget {
  final DateTime date;

  const DaySeparator({super.key, required this.date});

  @override
  Widget build(BuildContext context) {
    var formattedDate = DateFormat.yMMMMd("pt-BR").format(date);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
      alignment: Alignment.center,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(9999),
          color: Theme.of(context).colorScheme.onInverseSurface,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: Text(
            formattedDate,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
          ),
        ),
      ),
    );
  }
}
