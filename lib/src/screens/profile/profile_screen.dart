import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.all(32),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.blue,
                  width: 2,
                ),
              ),
              child: const CircleAvatar(
                radius: 80,
                backgroundImage: AssetImage('assets/images/plane-bg.jpg'),
              ),
            ),
          ),
          const SizedBox(
              height:
                  16), // Add some space between the profile picture and text
          const Text(
            'Joe Doe',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            'Computer Engineer',
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey,
            ),
          ),
          const Text(
            's190444001@stu.thk.edu.tr',
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 20),
          const Divider(
            thickness: 2,
            indent: 20,
            endIndent: 20,
          ),

          ListTile(
            leading: const Icon(Icons.notifications_none_rounded),
            title: const Text(
              'Notifications',
              style: TextStyle(fontSize: 22),
            ),
            trailing: const Icon(Icons.chevron_right_rounded),
            onTap: () {},
          ),
          const Divider(
            thickness: 1,
            height: 0,
          ),
          ListTile(
            leading: const Icon(Icons.account_circle_outlined),
            title: const Text(
              'Edit Profile',
              style: TextStyle(fontSize: 22),
            ),
            trailing: const Icon(Icons.chevron_right_rounded),
            onTap: () {},
          ),
          const Divider(
            thickness: 1,
            height: 0,
          ),
          ListTile(
            leading: const Icon(Icons.lock_outline_rounded),
            title: const Text(
              'Password',
              style: TextStyle(fontSize: 22),
            ),
            trailing: const Icon(Icons.chevron_right_rounded),
            onTap: () {},
          ),
          const Divider(
            thickness: 1,
            height: 0,
          ),
          ListTile(
            leading: const Icon(Icons.credit_card_rounded),
            title: const Text(
              'Student Card',
              style: TextStyle(fontSize: 22),
            ),
            trailing: const Icon(Icons.chevron_right_rounded),
            onTap: () {},
          ),
          const Divider(
            thickness: 1,
            height: 0,
          ),
          ListTile(
            leading: const Icon(Icons.calendar_month_outlined),
            title: const Text(
              'Schedule',
              style: TextStyle(fontSize: 22),
            ),
            trailing: const Icon(Icons.chevron_right_rounded),
            onTap: () {},
          ),
          const Divider(
            thickness: 1,
            height: 0,
          ),
          ListTile(
            leading: const Icon(Icons.logout_rounded),
            title: const Text(
              'Logout',
              style: TextStyle(fontSize: 22),
            ),
            trailing: const Icon(Icons.chevron_right_rounded),
            onTap: () {},
          ),
          const Divider(
            thickness: 1,
            height: 0,
          ),
        ]),
      ),
    );
  }
}
