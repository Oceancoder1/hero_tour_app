import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hero_tour_app/models/user.dart';
import 'package:hero_tour_app/screens/user_details_screen.dart';
import 'package:hero_tour_app/widgets/hero_list_tile.dart';
import 'package:hero_tour_app/widgets/loading_widget.dart';

import '../user_bloc/user_bloc.dart';

class HeroesScreen extends StatefulWidget {
  const HeroesScreen({super.key});

  @override
  State<HeroesScreen> createState() => _HeroesScreenState();
}

class _HeroesScreenState extends State<HeroesScreen> {
  User? showUser;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 20,
        ),
        const Text(
          'My Heroes',
          style: TextStyle(
            fontSize: 20,
          ),
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
                final users = state.users;

                return showUser == null
                    ? ListView(
                        shrinkWrap: true,
                        children: [
                          ...users
                              .map(
                                (user) => HeroListTile(
                                  callback: () {
                                    setState(() {
                                      showUser = user;
                                    });
                                  },
                                  user: user,
                                ),
                              )
                              .toList(),
                        ],
                      )
                    : UserDetailsScreen(
                        user: showUser!,
                        callback: () {
                          showUser = null;
                        });
            }
          },
        ),
      ],
    );
  }
}
