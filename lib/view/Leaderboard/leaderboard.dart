import 'package:flutter/material.dart';
import 'package:microhack/core/app_data.dart';
import 'package:microhack/models/user_data.dart';
import 'package:microhack/view/Leaderboard/Widgets/card_leader.dart';
import 'package:microhack/view/Leaderboard/Widgets/custom_arrow.dart';
import 'package:microhack/view/Leaderboard/Widgets/rank_widget.dart';
import 'package:microhack/view/Leaderboard/Widgets/title_leaderboard_widget.dart';

class LeaderBoardScreen extends StatefulWidget {
  const LeaderBoardScreen({super.key});

  @override
  State<LeaderBoardScreen> createState() => _LeaderBoardScreenState();
}

class _LeaderBoardScreenState extends State<LeaderBoardScreen> {
  // order this list by score
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    AppData.users.sort((a, b) => b.score.compareTo(a.score));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Rank',
          style: TextStyle(
            color: Color(0xff7355FF),
            fontWeight: FontWeight.bold,
            fontSize: 33,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    CardLeader(index: 2, user: AppData.users[1]),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    CardLeader(index: 1, user: AppData.users[0]),
                    const SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    CardLeader(index: 3, user: AppData.users[2]),
                  ],
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 2, vertical: 20),
            child: TitleLeaderBoardWidget(),
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: AppData.users.length,
              itemBuilder: (_, int index) {
                if (index < 4) return const SizedBox.shrink();
                return RankWidget(
                  index: index,
                  user: AppData.users[index],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
