import 'package:bizkit/core/const.dart';
import 'package:bizkit/feature/home/view/home_second_screen/widgets/tabbar_with_containers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SecondHomeScreenPAgeviewMeetingScreen extends StatelessWidget {
  const SecondHomeScreenPAgeviewMeetingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: IconButton(
        //   onPressed: () {
        //     Navigator.of(context).pop();
        //   },
        //   icon: const Icon(
        //     Icons.arrow_back_ios,
        //     color: kwhite,
        //     size: 20,
        //   ),
        // ),
        backgroundColor: Colors.transparent,
        title: Text(
          'Todays \nReminders',
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w700,
            color: kwhite,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              color: kwhite,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.list_rounded,
              color: kwhite,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            adjustHieght(khieght * .03),
            Stack(
              children: [
                Positioned(
                  right: 2,
                  top: 2,
                  child: InkWell(
                    onTap: () => Navigator.of(context).pop(),
                    child: const CircleAvatar(
                      radius: 15,
                      backgroundImage:
                          AssetImage('asset/images/close icon home.png'),
                      child: Icon(
                        Icons.close,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: khieght * .8,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: neonShade,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: SizedBox(
                          child: Column(
                            children: [
                              adjustHieght(khieght * .02),
                              Row(
                                children: [
                                  adjustWidth(kwidth * .03),
                                  const CircleAvatar(
                                    radius: 32,
                                    backgroundColor: neonShade,
                                    child: CircleAvatar(
                                      backgroundImage: NetworkImage(
                                        'https://images.healthshots.com/healthshots/en/uploads/2020/12/08182549/positive-person.jpg',
                                      ),
                                      radius: 30,
                                    ),
                                  ),
                                  adjustWidth(kwidth * .02),
                                  Text(
                                    'Meeting With \nMarcopolo',
                                    style: TextStyle(
                                      fontSize: 19.sp,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                              adjustHieght(khieght * .03),
                              SizedBox(
                                width: 280,
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          'Venue :',
                                          style: TextStyle(fontSize: 9.sp),
                                        ),
                                        const Spacer(),
                                        Text(
                                          'Central Mall, Jayanagar',
                                          style: TextStyle(
                                            fontSize: 9.sp,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'Created :',
                                          style: TextStyle(fontSize: 9.sp),
                                        ),
                                        const Spacer(),
                                        Text(
                                          '2nd October, 11:45 AM',
                                          style: TextStyle(
                                            fontSize: 9.sp,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'Occasion :',
                                          style: TextStyle(fontSize: 9.sp),
                                        ),
                                        const Spacer(),
                                        Text(
                                          'International Film Festival',
                                          style: TextStyle(
                                            fontSize: 9.sp,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              adjustHieght(khieght * .03),
                              Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      height: 42,
                                      decoration: const BoxDecoration(
                                        color: neonShade,
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(7),
                                          topLeft: Radius.circular(7),
                                        ),
                                      ),
                                      child: const Center(
                                        child: Text('Connect'),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      height: 42,
                                      decoration: BoxDecoration(
                                        border: Border.all(color: neonShade),
                                        borderRadius: const BorderRadius.only(
                                          bottomRight: Radius.circular(7),
                                          topRight: Radius.circular(7),
                                        ),
                                      ),
                                      child: const Center(
                                        child: Text(
                                          'Postpone',
                                          style: TextStyle(color: neonShade),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      adjustHieght(khieght * .02),
                      const Expanded(child: TabBarHomeScreen())
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
