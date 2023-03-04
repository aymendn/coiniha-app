import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:microhack/core/app_color.dart';
import 'package:microhack/view/home/widgets/home_card.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'COINIHA',
          style: TextStyle(
            color: Color(0xff7355FF),
            fontWeight: FontWeight.bold,
            fontSize: 40,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          Container(
            padding: const EdgeInsets.all(25),
            decoration: BoxDecoration(
                color: const Color(0xff272A34),
                borderRadius: BorderRadius.circular(20)),
            child: RichText(
              text: const TextSpan(
                text: 'your daily checkin has been ',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 23,
                  fontFamily: 'baloo2',
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
                    children: const [
                      Text(
                        'Welcome Back',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
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
            children: const [
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
            children: const [
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
          const CopyWidget(),
        ],
      ),
    );
  }
}

class CopyWidget extends StatefulWidget {
  const CopyWidget({
    super.key,
  });

  @override
  State<CopyWidget> createState() => _CopyWidgetState();
}

class _CopyWidgetState extends State<CopyWidget> {
  String txt = "Copy Invite Link";
  final snackBar = const SnackBar(
    content: Text('Invite Link Copied'),
    backgroundColor: AppColor.white,
  );
  @override
  Widget build(BuildContext context) {
    return FilledButton(
        style: FilledButton.styleFrom(
            backgroundColor: AppColor.primary,
            minimumSize: const Size(double.infinity, 50),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16))),
        onPressed: () async {
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
          setState(() {
            txt = "Copied";
          });
          await Future.delayed(const Duration(seconds: 2));
          setState(() {
            txt = "Copy Invite Link";
          });
        },
        child: Text(
          txt,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ));
  }
}
