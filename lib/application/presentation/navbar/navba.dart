import 'package:bizkit/application/commen/const.dart';
import 'package:bizkit/application/presentation/card_share/view/screen/card_screen_main.dart';
import 'package:bizkit/application/presentation/home/view/home_main_screen/home_screen_main.dart';
import 'package:bizkit/application/presentation/profile_screen/view/screen/profile_screen.dart';
import 'package:bizkit/application/presentation/selfie_card/widgets/selfie_screen.dart';
import 'package:bottom_bar_matu/bottom_bar/bottom_bar_bubble.dart';
import 'package:bottom_bar_matu/bottom_bar_item.dart';
import 'package:flutter/material.dart';

class BizkitBottomNavigationBar extends StatefulWidget {
  const BizkitBottomNavigationBar({super.key});

  @override
  State<BizkitBottomNavigationBar> createState() =>
      _BizkitBottomNavigationBarState();
}

class _BizkitBottomNavigationBarState extends State<BizkitBottomNavigationBar> {
  int _selectedIndex = 0;
  final List<Widget> _widgetOptions = [
    const SplitScreen(),
    const CardShareMainScreen(),
    const SelfieScreen(),
    const ProfileScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: Material(
        elevation: 5,shadowColor: kblack,
        child: BottomBarBubble(
          color: neonShade,
          height: 55,
          backgroundColor: backgroundColour,
          selectedIndex: _selectedIndex,
          items: [
            BottomBarItem(
              iconBuilder: (color) => Image.asset(
                'asset/images/NavPngs/—Pngtree—vector house icon_4013710.png',
                fit: BoxFit.cover,
                color: _selectedIndex == 0 ? neonShade : color,
                height: _selectedIndex == 0 ? 38 : 30,
                width: _selectedIndex == 0 ? 38 : 30,
              ),
            ),
            BottomBarItem(
              iconBuilder: (color) => Image.asset(
                'asset/images/NavPngs/my connection selected.png',
                fit: BoxFit.cover,
                color: _selectedIndex == 1 ? neonShade : color,
                height: _selectedIndex == 1 ? 32 : 26,
                width: _selectedIndex == 1 ? 32 : 26,
              ),
            ),
            BottomBarItem(
              iconBuilder: (color) => Image.asset(
                'asset/images/NavPngs/selfie selected.png',
                fit: BoxFit.cover,
                color: _selectedIndex == 2 ? neonShade : color,
                height: _selectedIndex == 2 ? 27 : 22,
                width: _selectedIndex == 2 ? 27 : 22,
              ),
            ),
            BottomBarItem(
              iconBuilder: (color) => Image.asset(
                'asset/images/NavPngs/account un selected.png',
                fit: BoxFit.cover,
                color: _selectedIndex == 3 ? neonShade : color,
                height: _selectedIndex == 3 ? 30 : 26,
                width: _selectedIndex == 3 ? 30 : 26,
              ),
            ),
          ],
          onSelect: (index) {
            _onItemTapped(index);
          },
        ),
      ),
    );
  }
}

