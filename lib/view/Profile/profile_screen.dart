import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../providers/auth.dart';

class ProfileScreen extends HookConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final auth = ref.watch(authProvider);
    final isNotifications = useState(true);
    final settingItems = [
      ListTile(
        leading: const Icon(
          Icons.notifications,
          color: Colors.grey,
        ),
        title: const Text('Notifications'),
        trailing: Switch(
          value: true,
          onChanged: (value) {
            isNotifications.value = value;
          },
        ),
      ),
      const ListTile(
        leading: Icon(
          Icons.share,
          color: Colors.grey,
        ),
        title: Text('Share'),
      ),
      const ListTile(
        leading: Icon(
          Icons.star,
          color: Colors.grey,
        ),
        title: Text('Privacy Policy'),
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 100,
        title: const Text(
          'Profile',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 23,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        shrinkWrap: true,
        children: [
          auth?.photoURL != null
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 80,
                      width: 80,
                      child: ClipOval(
                        child: Image.network(
                          auth?.photoURL ?? '',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                )
              : SizedBox(
                  height: 80,
                  child: Image.asset("assets/images/p1.png"),
                ),
          const SizedBox(height: 10),
          Column(
            children: [
              Text(auth?.displayName ?? 'User',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  )),
              const SizedBox(
                height: 1,
                width: double.infinity,
              ),
              const Text("f_bekkouche@estin.dz",
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w200,
                    fontSize: 17,
                  )),
            ],
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 16),
            decoration: BoxDecoration(
              color: const Color(0xff252834),
              borderRadius: BorderRadius.circular(23),
            ),
            child: IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  CardRank(
                    title: "Coins",
                    value: "360",
                  ),
                  VerticalDivider(
                    color: Colors.grey,
                    thickness: .1,
                  ),
                  CardRank(
                    title: "Rank",
                    value: "#12",
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 30),
            padding: const EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              color: const Color(0xff252834),
              borderRadius: BorderRadius.circular(20),
            ),
            child: ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: settingItems.length,
              separatorBuilder: (BuildContext context, int index) {
                return const Divider(
                  color: Colors.grey,
                  thickness: .1,
                );
              },
              itemBuilder: (BuildContext context, int index) {
                return settingItems[index];
              },
            ),
          )
        ],
      ),
    );
  }
}

class OptionSettings extends StatelessWidget {
  const OptionSettings({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 9),
      child: Row(
        children: const [
          Icon(
            Icons.bookmark_outline,
            color: Colors.grey,
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            "Saved",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w200,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}

class CardRank extends StatelessWidget {
  const CardRank({
    super.key,
    required this.title,
    required this.value,
  });

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              value,
              style: const TextStyle(
                color: Color(0xffFF6584),
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
