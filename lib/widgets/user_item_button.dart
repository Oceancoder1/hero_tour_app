// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class UserItemButton extends StatelessWidget {
  const UserItemButton({
    Key? key,
    required this.onPressed,
    required this.label,
  }) : super(key: key);

  final Function() onPressed;
  final String label;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Colors.blueGrey.shade300,
        padding: const EdgeInsets.all(20),
      ),
      child: Text(label),
    );
  }
}
