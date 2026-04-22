import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clickresturant/Core/constants/config.dart';

import 'package:clickresturant/logic/bloc/UserProfile/user_profile_bloc.dart';

// final user = UserModel(
//     lastName: lastName,
//     uid: uid,
//     phone: phone,
//     email: email,
//     firstName: firstName);
Widget HomeDrawer() {
  return SizedBox(
    child: ListView(
      children: <Widget>[
        BlocBuilder<UserProfileBloc, UserProfileState>(
          builder: (context, state) {
            if (state is UserProfileLoading) {
              return const CircularProgressIndicator();
            }
            if (state is UserProfileFailed) {
              return Center(
                child: Text("Errore is ${state.message}"),
              );
            }
            if (state is UserProfileLoaded) {
              return UserAccountsDrawerHeader(
                accountName: const Text(
                  "name is ",
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
                accountEmail: const Text(
                  "user1@user.com",
                  style: TextStyle(color: Colors.grey),
                ),
                currentAccountPicture: GestureDetector(
                  child: const CircleAvatar(
                    backgroundColor: secondryColor,
                    child: Icon(
                      Icons.person,
                      color: fourColor,
                      size: 28,
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                ),
              );
            }
            return Container();
          },
        ),
      ],
    ),
  );
}
