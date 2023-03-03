import 'package:flutter/material.dart';
import 'package:microhack/view/Leaderboard/Widgets/card_leader.dart';
import 'package:microhack/view/Leaderboard/Widgets/title_leaderboard_widget.dart';

class LeaderBoardScreen extends StatelessWidget {
  const LeaderBoardScreen({super.key});

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
                  Container(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        CardLeader(index: 2),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      CardLeader(index: 1),
                      SizedBox(
                        height: 20,
                      )
                    ],
                  ),
                  Column(
                    children: [
                      const SizedBox(
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
        ));
  }
}

class CustomArrowButton extends StatelessWidget {
  const CustomArrowButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xff20232D),
        borderRadius: BorderRadius.circular(50),
      ),
      child: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}

class RankWidget extends StatelessWidget {
  RankWidget({required this.index, super.key});
  int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(19),
          color: const Color(0xffA99F9F).withOpacity(0.25),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            children: [
              Text("#$index",
                  style: const TextStyle(
                    color: Color(0xffFF6584),
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  )),
              const SizedBox(width: 10),
              const CircleAvatar(
                radius: 20,
                backgroundColor: Colors.white,
              ),
              const SizedBox(width: 10),
              const Text("Fares Bekkouche",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                    height: 2,
                  )),
              const Spacer(),
              const Text("1032 Coins",
                  style: TextStyle(
                    color: Color(0xffFF6584),
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  )),
              const SizedBox(width: 2),
            ],
          ),
        ),
      ),
    );
  }
}
