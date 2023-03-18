import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hero_tour_app/screens/user_details_screen.dart';
import 'package:hero_tour_app/widgets/loading_widget.dart';
import 'package:hero_tour_app/widgets/user_item_button.dart';

import '../models/user.dart';
import '../user_bloc/user_bloc.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  User? showUser;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        const Text(
          'Top Heroes',
          style: TextStyle(fontSize: 20),
        ),
        const SizedBox(
          height: 20,
        ),
        BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            switch (state.status) {
              case UserStatus.loading:
                return const LoadingWidget();

              case UserStatus.success:
                final users = state.users.where((user) => user.isTop).toList();

                return showUser == null
                    ? Wrap(
                        runSpacing: 20,
                        spacing: 20,
                        children: [
                          ...users
                              .map((user) => UserItemButton(
                                  onPressed: () {
                                    setState(() {
                                      showUser = user;
                                    });
                                  },
                                  label: user.name))
                              .toList()
                        ],
                      )
                    : UserDetailsScreen(
                        user: showUser!,
                        callback: () {
                          setState(() {
                            showUser = null;
                          });
                        });
            }
          },
        ),
      ],
    );
  }
}
