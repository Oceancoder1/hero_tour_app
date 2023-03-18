// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class NavbarTitle extends StatelessWidget {
  const NavbarTitle({
    Key? key,
    required this.label,
  }) : super(key: key);

  final String label;

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: const TextStyle(
        color: Colors.deepPurpleAccent,
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
