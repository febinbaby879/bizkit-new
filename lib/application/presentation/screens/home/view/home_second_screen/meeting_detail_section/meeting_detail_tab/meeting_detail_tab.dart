import 'package:bizkit/application/presentation/screens/authentication/view/widgets/auth_button.dart';
import 'package:bizkit/application/presentation/screens/home/view/home_second_screen/meeting_detail_section/meeting_detail_tab/history_log_tab_builder.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class MeetingDetailTabBarItems extends StatelessWidget {
  const MeetingDetailTabBarItems({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(width: double.infinity),
            // TabBar(
            //   dividerHeight: 0,
            //   isScrollable: true,
            //   tabAlignment: TabAlignment.center,
            //   labelPadding: const EdgeInsets.symmetric(horizontal: 30),
            //   indicator: BoxDecoration(
            //     borderRadius: BorderRadius.circular(12),
            //     gradient: neonShadeGradient,
            //   ),
            //   tabs: [
            //     Tab(
            //       child: SizedBox(
            //         width: kwidth * 0.3,
            //         child: const Center(
            //           child: Text(
            //             "History/Log",
            //             style: TextStyle(color: kwhite),
            //           ),
            //         ),
            //       ),
            //     ),
            //     Tab(
            //       child: SizedBox(
            //         width: kwidth * 0.3,
            //         child: const Center(
            //           child: Text(
            //             "Profile",
            //             style: TextStyle(color: kwhite),
            //           ),
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
            adjustHieght(khieght * 0.02),
            AuthButton(text: 'History', onTap: () {}),
            adjustHieght(khieght * 0.02),
            const Expanded(
              child:
                  // TabBarView(
                  //   children: [
                  MeetingDetailHistoryLogTabBuilder(),
              // MeetingDetailProfileTabWidgets(),
              // ],
              // ),
            )
          ],
        ),
      ),
    );
  }
}
