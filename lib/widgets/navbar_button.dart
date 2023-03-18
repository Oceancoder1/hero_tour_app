// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class NavbarButton extends StatelessWidget {
  const NavbarButton({
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
        foregroundColor: Colors.black,
        backgroundColor: Colors.grey.shade100,
        padding: const EdgeInsets.all(20),
      ),
      child: Text(label),
    );
  }
}
