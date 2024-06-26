import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InfoRow extends StatelessWidget {
  final String label;
  final String value;

  InfoRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
          style:Theme.of(context).textTheme.bodyText2),
          SizedBox(width: 5),
          Expanded(
            child: Text(
              value,
              textAlign: TextAlign.right, style:Theme.of(context).textTheme.bodyText2
            ),
          ),
        ],
      ),
    );
  }
}