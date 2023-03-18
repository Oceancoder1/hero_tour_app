// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hero_tour_app/models/user.dart';

import '../user_bloc/user_bloc.dart';

class UserDetailsScreen extends StatefulWidget {
  const UserDetailsScreen({
    Key? key,
    required this.user,
    required this.callback,
  }) : super(key: key);

  final User user;
  final Function() callback;

  @override
  State<UserDetailsScreen> createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends State<UserDetailsScreen> {
  late User _user;

  @override
  void initState() {
    super.initState();
    _user = widget.user;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        const SizedBox(
          height: 15,
        ),
        Text(
          '${_user.name} Details',
          style: const TextStyle(
            fontSize: 20,
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Text('Id ${_user.id}'),
        const SizedBox(
          height: 15,
        ),
        Row(
          children: [
            const Text(
              'Hero Name',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: TextFormField(
                initialValue: _user.name,
                decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(),
                ),
                onChanged: (value) => setState(() {
                  _user = _user.copyWith(
                    name: value,
                  );
                }),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: ElevatedButton(
            onPressed: () {
              context.read<UserBloc>().add(
                    ChangeUsernameRequested(
                      user: _user,
                      newUsername: _user.name,
                    ),
                  );
              widget.callback.call();
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(20),
              backgroundColor: Colors.grey.shade100,
              foregroundColor: Colors.black,
            ),
            child: const Text('Back'),
          ),
        ),
      ],
    );
  }
}
