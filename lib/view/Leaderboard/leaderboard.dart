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
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rank',
            style: TextStyle(
              color: Color(0xff7355FF),
              fontWeight: FontWeight.bold,
              fontSize: 23,
            )),
        centerTitle: true,
        leading: const CustomArrowButton(),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(
            size.width * 0.03, size.height * 0.01, size.width * 0.03, 0),
        child: Column(
          children: [
            Row(
              children: [
                Column(
                  children: const [
                    SizedBox(
                      height: 20,
                    ),
                    CardLeader(index: 2),
                  ],
                ),
                Column(
                  children: const [
                    CardLeader(index: 1),
                    SizedBox(
                      height: 20,
                    )
                  ],
                ),
                Column(
                  children: const [
                    SizedBox(
                      height: 50,
                    ),
                    CardLeader(index: 3),
                  ],
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
                    if (index < 4) {
                      return Container();
                    }
                    return RankWidget(index: index);
                  }),
            )
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
