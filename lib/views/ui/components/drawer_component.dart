import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/views/shared/constants/app_colors.dart';
import 'package:flutter_ecommerce_app/views/shared/utils/custom_text_style.dart';

class DrawerComponent extends StatelessWidget {
  const DrawerComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero, // Removes extra padding by default
        children: [
          DrawerHeader(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.color_primary_blue,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CircleAvatar(
                  backgroundImage:
                      const AssetImage('assets/images/profile_image.png'),
                  maxRadius: 40,
                  backgroundColor: AppColors.color_white,
                ),
                Text(
                  'Bhushan Tandel',
                  style: CustomTextstyle.style_title_bold_white,
                ),
              ],
            ),
          ),
          _buildDrawerItem(
            context,
            icon: const Icon(Icons.home),
            title: 'Home',
            onTap: () {
              Navigator.pop(context); // Close the drawer
            },
          ),
          _buildDrawerItem(
            context,
            icon: const Icon(Icons.settings),
            title: 'Settings',
            onTap: () {
              Navigator.pop(context); // Close the drawer
            },
          ),
          _buildDrawerItem(
            context,
            icon: const Icon(Icons.logout),
            title: 'Logout',
            onTap: () {
              Navigator.pop(context); // Close the drawer
            },
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(BuildContext context,
      {required Icon icon,
      required String title,
      required VoidCallback onTap}) {
    return ListTile(
      leading: icon,
      title: Text(title),
      onTap: onTap,
    );
  }
}
