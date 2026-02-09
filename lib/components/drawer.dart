import 'package:citychurch/components/drawer_tile.dart';
import 'package:citychurch/features/announcement/presentation/announcement_page.dart';
import 'package:citychurch/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:citychurch/features/events/presentation/event_page.dart';
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
                DrawerHeader(child: Icon(Icons.favorite)),
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
                


                 MyDrawerTile(
                  text: "Announcements",
                  icon: Icons.announcement,
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyannouncementPage()),
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
