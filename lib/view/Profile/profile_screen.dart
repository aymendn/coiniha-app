import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final settingItems = [
      const OptionSettings(),
      const OptionSettings(),
      const OptionSettings(),
      const OptionSettings(),
      const OptionSettings(),
      const OptionSettings(),
      const OptionSettings(),
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
          const CircleAvatar(
            backgroundImage: AssetImage("assets/images/fares.jpg"),
            radius: 50,
          ),
          Column(
            children: const [
              Text("Fares",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  )),
              SizedBox(
                height: 1,
                width: double.infinity,
              ),
              Text("f_bekkouche@estin.dz",
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
                  CardRank(),
                  VerticalDivider(
                    color: Colors.grey,
                    thickness: .1,
                  ),
                  CardRank(),
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
          Text("Saved",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w200,
                fontSize: 15,
              )),
        ],
      ),
    );
  }
}

class CardRank extends StatelessWidget {
  const CardRank({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: const [
            Text("Coins",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                )),
            SizedBox(
              height: 10,
            ),
            Text(
              "360",
              style: TextStyle(
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
