// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:hero_tour_app/models/user.dart';

class HeroListTile extends StatelessWidget {
  const HeroListTile({
    Key? key,
    required this.callback,
    required this.user,
  }) : super(key: key);

  final Function() callback;
  final User user;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        callback.call();
      },
      child: Align(
        alignment: Alignment.centerLeft,
        child: Card(
          child: ColoredBox(
            color: Colors.grey.shade100,
            child: SizedBox(
              width: 0.7 * size.width,
              child: Row(
                children: [
                  ColoredBox(
                    color: Colors.blueGrey.shade300,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        user.id.toString(),
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(user.name),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
