import 'package:citychurch/components/drawer_tile.dart';
import 'package:citychurch/features/announcement/presentation/announcement_page.dart';
import 'package:citychurch/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:citychurch/features/events/presentation/event_page.dart';
import 'package:citychurch/features/offerings/offerings_page.dart';
import 'package:citychurch/features/sermon/sermon_page.dart';
import 'package:citychurch/features/settings/presentation/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  //logout
  void logout(BuildContext context) {
    final authCubit = context.read<AuthCubit>();
    authCubit.logout();
  }

  //confirm logout
  void confirmLogout(BuildContext context) {
    //pop drawer first
    Navigator.pop(context);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Logout"),
        actions: [
          //cancel button
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),

          //yes button
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              logout(context);
            },

            child: const Text("yes"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                //header
                DrawerHeader(
                  
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(60),
                        child: Image.asset(
                          "lib/assets/icon.jpeg",
                          width: 90,
                          height: 90,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),

                //home tile
                MyDrawerTile(
                  text: "Home",
                  icon: Icons.home,
                  onTap: () => Navigator.pop(context),
                ),

                //setting tile
                MyDrawerTile(
                  text: "Settings",
                  icon: Icons.settings,
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SettingsPage()),
                    );
                  },
                ),

                //setting tile
                MyDrawerTile(
                  text: "Events",
                  icon: Icons.event,
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyeventsPage()),
                    );
                  },
                ),

                //offering tile
                MyDrawerTile(
                  text: "offerings & Tiths",
                  icon: Icons.wallet_giftcard,
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => OfferingsPage()),
                    );
                  },
                ),

                //sermons tile
                MyDrawerTile(
                  text: "Sermons",
                  icon: Icons.wordpress_rounded,
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>SermonsPage()),
                    );
                  },
                ),

                //announcements
                MyDrawerTile(
                  text: "Announcements",
                  icon: Icons.announcement,
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyannouncementPage(),
                      ),
                    );
                  },
                ),
              ],


            ),
            //logout tile
            MyDrawerTile(
              text: "Logout",
              icon: Icons.logout,
              onTap: () => confirmLogout(context),
            ),
          ],
        ),
      ),
    );
  }
}
