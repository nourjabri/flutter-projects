
import 'package:clickresturant/Core/constants/config.dart';
import 'package:clickresturant/logic/bloc/UserProfile/user_profile_bloc.dart';
import 'package:clickresturant/presentation/screens/favorite.dart';
import 'package:clickresturant/presentation/screens/home.dart';
import 'package:clickresturant/presentation/screens/profile.dart';
import 'package:clickresturant/presentation/screens/shopping_cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
   int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
          if (index == 3) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => UserProfilePage()));

            context.read<UserProfileBloc>().add(LoadUserPRofile());
          }
          if (index == 2) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => const Shopping()));
          }
          if (index == 1) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => const Favorite()));
          }
          if (index == 0) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => const Home()));
          }
        },
        currentIndex: selectedIndex,
        selectedItemColor: thirdColor,
        selectedFontSize: 16,
        unselectedItemColor: primaryColor,
        showSelectedLabels: true,
        unselectedFontSize: 12,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ("Home")),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: ("Favorite")),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag), label: ("Cart")),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ("Profile")),
        ],
      );
  }
}
