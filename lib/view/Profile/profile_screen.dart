import 'package:flutter/material.dart';
import 'package:microhack/view/Leaderboard/Widgets/custom_arrow.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Row(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            const SizedBox(width: 10),
            const CustomArrowButton(),
          ],
        ),
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
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => const EditProfileScreen(),
              //   ),
              // );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
        child: ListView(
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 16),
              child: Container(
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
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 30),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xff252834),
                  borderRadius: BorderRadius.circular(23),
                ),
                child: Column(
                  children: const [
                    OptionSettings(),
                    Divider(
                      color: Colors.grey,
                      thickness: 1,
                    ),
                    OptionSettings(),
                    Divider(
                      color: Colors.grey,
                      thickness: 1,
                    ),
                    OptionSettings(),
                    Divider(
                      color: Colors.grey,
                      thickness: 1,
                    ),
                    OptionSettings(),
                    Divider(
                      color: Color.fromARGB(255, 255, 237, 237),
                      thickness: 1,
                    ),
                    OptionSettings(),
                    Divider(
                      color: Color.fromARGB(255, 255, 237, 237),
                      thickness: 1,
                    ),
                    OptionSettings(),
                    Divider(
                      color: Color.fromARGB(255, 255, 237, 237),
                      thickness: 1,
                    ),
                    OptionSettings(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   currentIndex: _selectedindex,
      //   selectedItemColor: const Color(0xffFF6584),
      //   unselectedItemColor: Colors.grey,
      //   backgroundColor: const Color(0xff252834),
      //   onTap: (int index) {
      //     setState(() {
      //       _selectedindex = index;
      //     });
      //   },
      //   items: const [
      //     BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.language), label: "Exchange"),
      //     BottomNavigationBarItem(icon: Icon(Icons.leaderboard), label: "Rank"),
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.account_circle_rounded), label: "Profile"),
      //   ],
      // ),
      // ignore: prefer_const_literals_to_create_immutables
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
    return Container(
      padding: const EdgeInsets.all(20),
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
    );
  }
}
