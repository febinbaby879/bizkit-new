import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:bizkit/application/presentation/screens/home/view/home_first_screen/home_first_screen.dart';
import 'package:bizkit/application/presentation/screens/home/view/home_second_screen/listview_items/second_animation_all_reminders_list.dart';
import 'package:flutter/material.dart';

class HomeScreenSecondPart extends StatefulWidget {
  const HomeScreenSecondPart({super.key, required this.animationController});

  final List<AnimationController> animationController;

  @override
  State<HomeScreenSecondPart> createState() => _HomeScreenSecondPartState();
}

class _HomeScreenSecondPartState extends State<HomeScreenSecondPart> {
  final scrollController = ScrollController();

  @override
  void initState() {
    scrollController.addListener(() {
      _scrollCallBack();
    });
    super.initState();
  }

  @override
  dispose() {
    scrollController.dispose();
    super.dispose();
  }

  _scrollCallBack() {
    if (scrollController.offset > 0) {
      widget.animationController[0].forward().whenComplete(() {
        showCardsNotifier.value = HomeScreensList.second;
        showCardsNotifier.notifyListeners();
      });
      widget.animationController[1].forward().whenComplete(
            () => widget.animationController[2].forward(),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Reminders', style: textHeadStyle1),
          adjustHieght(kwidth * .035),
          Expanded(
            child: SecondAnimationPageListViewAllReminders(
              scrollController: scrollController,
            ),
          ),
        ],
      ),
    );
  }
}
