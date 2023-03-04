import 'package:flutter/material.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Rank',
          style: TextStyle(
            color: Color(0xff7355FF),
            fontWeight: FontWeight.bold,
            fontSize: 23,
          ),
        ),
        centerTitle: true,
        leading: const CustomArrowButton(),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  children: const [
                    SizedBox(
                      height: 20,
                    ),
                    CardLeader(index: 2),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: const [
                    CardLeader(index: 1),
                    SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: const [
                    SizedBox(
                      height: 50,
                    ),
                    CardLeader(index: 3),
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
              itemCount: 21,
              itemBuilder: (_, int index) {
                if (index < 4) return const SizedBox.shrink();
                return RankWidget(index: index);
              },
            ),
          )
        ],
      ),
    );
  }
}
