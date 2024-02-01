import 'package:bizkit/application/presentation/screens/home/view/home_first_screen/first_half_sction/home_first_app_bar.dart';
import 'package:bizkit/application/presentation/screens/home/view/home_first_screen/first_half_sction/home_first_my_cnnection_listview_outer.dart';
import 'package:bizkit/application/presentation/screens/home/view/home_first_screen/first_half_sction/my_cards_and_add_card.dart';
import 'package:bizkit/application/presentation/screens/home/view/home_first_screen/widgets/home_screen_second_part.dart';
import 'package:bizkit/application/presentation/screens/home/view/home_second_screen/home_second_screen.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:flutter/material.dart';

// enum and notifier below are used to shift the screens in home page without shifting home bottom bar
enum HomeScreensList {
  first,
  second,
  third,
}

ValueNotifier<HomeScreensList> showCardsNotifier =
    ValueNotifier(HomeScreensList.first);

class HomeScreenFirstAnimationScreen extends StatefulWidget {
  const HomeScreenFirstAnimationScreen({super.key});

  @override
  State<HomeScreenFirstAnimationScreen> createState() =>
      _HomeScreenFirstAnimationScreenState();
}

class _HomeScreenFirstAnimationScreenState
    extends State<HomeScreenFirstAnimationScreen>
    with TickerProviderStateMixin {
  // for fade trancition and slide trancition of home screen first part
  late AnimationController _homeFirstAnimationController;
  // for list animation in home screen first part sliding part
  late AnimationController _homeSecondAnimationController;
  late AnimationController _homeSecondAnimationController2;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation2;
  late Animation<Offset> _slideAnimation2Move;

  @override
  void initState() {
    super.initState();

    _homeFirstAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _homeSecondAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _homeSecondAnimationController2 = AnimationController(
      vsync: this,
      duration: const Duration(microseconds: 1),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0),
      end: const Offset(0, -1.1), // Move upwards by the height of the screen
    ).animate(
      CurvedAnimation(
        parent: _homeFirstAnimationController,
        curve: Curves.linear,
      ),
    );

    _slideAnimation2 = Tween<Offset>(
      begin: const Offset(0, 0),
      end: const Offset(0, -0.22),
    ).animate(
      CurvedAnimation(
        parent: _homeSecondAnimationController,
        curve: Curves.linear,
      ),
    );

    _slideAnimation2Move = Tween<Offset>(
      begin: const Offset(0, 0),
      end: const Offset(0, 1.5),
    ).animate(
      CurvedAnimation(
        parent: _homeSecondAnimationController2,
        curve: Curves.fastLinearToSlowEaseIn,
      ),
    );

    _fadeAnimation =
        Tween<double>(begin: 1, end: 0).animate(_homeFirstAnimationController);
  }

  @override
  void dispose() {
    _homeFirstAnimationController.dispose();
    _homeSecondAnimationController.dispose();
    _homeSecondAnimationController2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: showCardsNotifier,
          builder: (context, value, child) {
            if (value == HomeScreensList.first ||
                value == HomeScreensList.second ||
                value == HomeScreensList.third) {
              return Stack(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Visibility(
                      visible: _homeFirstAnimationController.isCompleted,
                      child: SecondAnimation(
                        animationController: [
                          _homeFirstAnimationController,
                          _homeSecondAnimationController,
                          _homeSecondAnimationController2
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AnimatedBuilder(
                          animation: _homeFirstAnimationController,
                          builder: (context, child) {
                            return FadeTransition(
                              opacity: _fadeAnimation,
                              child: SlideTransition(
                                position: _slideAnimation,
                                child: SizedBox(
                                  height: kwidth * 1.123,
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const HomeFirstAppBar(),
                                        adjustHieght(khieght * .02),
                                        const HomeFirstMyCardsAndAddCardSection(),
                                        adjustHieght(khieght * .03),
                                        const HomeFirstMyConnectionListviewOuter(),
                                      ],
                                    ),
                                  ),
                                ),
                                //Here The starting Page of main Screen
                              ),
                            );
                          },
                        ),
                        Expanded(
                          child: AnimatedBuilder(
                            animation: Listenable.merge([
                              _homeSecondAnimationController,
                              _homeSecondAnimationController2
                            ]),
                            builder: (context, child) {
                              return SlideTransition(
                                position: _slideAnimation2Move,
                                child: SlideTransition(
                                  position: _slideAnimation2,
                                  child: HomeScreenSecondPart(
                                    animationController: [
                                      _homeFirstAnimationController,
                                      _homeSecondAnimationController,
                                      _homeSecondAnimationController2
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}