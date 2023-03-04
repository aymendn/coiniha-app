import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:microhack/core/app_color.dart';
import 'package:microhack/providers/auth.dart';

import '../../core/app_methods.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final auth = ref.read(authProvider.notifier);
    // final user = ref.watch(authProvider);
    // Future<void> signOut() async {
    //   await auth.signOut(
    //     onError: (error) {
    //       AppMethod.showPopUp(
    //         context: context,
    //         title: 'Sign Out Error',
    //         content: error,
    //       );
    //     },
    //   );
    // }

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Coiniha',
              style: TextStyle(
                color: Color(0xff7355FF),
                fontWeight: FontWeight.bold,
                fontSize: 39,
              )),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(children: [
            Center(
              child: Container(
                padding: const EdgeInsets.all(25),
                child: RichText(
                  text: const TextSpan(
                    text: 'your daily checkin has been ',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 23,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'approved',
                          style: TextStyle(
                            color: Color(0xff6D4EFF),
                            fontWeight: FontWeight.bold,
                            fontSize: 23,
                          )),
                    ],
                  ),
                ),
                decoration: BoxDecoration(
                    color: const Color(0xff272A34),
                    borderRadius: BorderRadius.circular(20)),
              ),
            ),
            Container(
                margin: const EdgeInsets.symmetric(vertical: 16),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: const Color(0xff272A34),
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage("assets/images/UI/1.png"),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Welcome Back',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text(
                          'Fares',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ],
                )),
            Row(
              children: [
                HomeCard(
                  title: "22",
                  sousTitle: "User’s Rank",
                ),
                Spacer(
                  flex: 1,
                ),
                HomeCard(
                  title: "345",
                  sousTitle: "Earned Coins",
                ),
              ],
            ),
            Row(
              children: [
                HomeCard(
                  title: "22",
                  sousTitle: "User’s Rank",
                ),
                Spacer(
                  flex: 1,
                ),
                HomeCard(
                  title: "345",
                  sousTitle: "Earned Coins",
                ),
              ],
            ),
            FilledButton(
                style: FilledButton.styleFrom(
                    backgroundColor: AppColor.primary,
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16))),
                onPressed: () {},
                child: Text(
                  "Copy Invite Link",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ))
          ]),
        ));
  }
}

class HomeCard extends StatelessWidget {
  const HomeCard({
    super.key,
    required this.title,
    required this.sousTitle,
  });
  final String title;
  final String sousTitle;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 5,
      child: Container(
        margin:  const EdgeInsets.only(
          bottom: 16,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
        decoration: BoxDecoration(
            color: const Color(0xff272A34),
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              sousTitle,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
