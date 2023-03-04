import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:microhack/core/app_color.dart';
import 'package:microhack/view/Leaderboard/leaderboard.dart';
import 'package:microhack/view/Profile/profile_screen.dart';
import 'package:microhack/view/Shop/shop.dart';
import 'package:microhack/view/home/home_screen.dart';

class Nav extends HookConsumerWidget {
  const Nav({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = useState(0);

    final List<Widget> pages = [
      const HomeScreen(),
      const ShopScreen(),
      const SizedBox.shrink(),
      const LeaderBoardScreen(),
      const ProfileScreen(),
    ];
    return Scaffold(
      body: pages[currentIndex.value],
      bottomNavigationBar: SizedBox(
        height: 75,
        child: BottomNavigationBar(
          currentIndex: currentIndex.value,
          onTap: (index) {
            if (index == 2) return;
            currentIndex.value = index;
          },
          selectedItemColor: AppColor.primary,
          unselectedItemColor: const Color(0xff7D848D),
          backgroundColor: const Color(0xff20232D),
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined),
              label: 'Shop',
            ),
            BottomNavigationBarItem(
              icon: SizedBox.shrink(),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.leaderboard_outlined),
              label: 'Rank',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: 'Profile',
            ),
          ],
        ),
      ),
      floatingActionButton: Transform(
        transform: Matrix4.translationValues(0, 35, 0),
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: AppColor.primary.withOpacity(0.6),
                spreadRadius: 3,
                blurRadius: 15,
                offset: const Offset(0, 0),
              ),
            ],
          ),
          child: FloatingActionButton(
            onPressed: () {},
            shape: const CircleBorder(),
            backgroundColor: AppColor.primary,
            child: const Icon(Icons.add),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
