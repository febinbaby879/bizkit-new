import 'package:bizkit/application/commen/const.dart';
import 'package:bizkit/application/presentation/home/view/home_main_screen/home_screen_main.dart';
import 'package:bizkit/application/presentation/home/view/home_second_screen/widgets/tabbar_with_containers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SecondHomeScreenPAgeviewMeetingScreen extends StatelessWidget {
  const SecondHomeScreenPAgeviewMeetingScreen(
      {super.key, this.fadeCallBack});

  final VoidCallback? fadeCallBack;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            fadeCallBack!=null?adjustHieght(khieght * .02):adjustHieght(khieght*0.1),
            Stack(
              children: [
                Container(
                  margin: const EdgeInsets.all(10),
                  height: khieght * .75,
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
                                width: kwidth * 0.8,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Venue :',
                                          style: TextStyle(
                                              fontSize: kwidth * 0.03),
                                        ),
                                        Text(
                                          'Created :',
                                          style: TextStyle(
                                              fontSize: kwidth * 0.03),
                                        ),
                                        Text(
                                          'Occation :',
                                          style: TextStyle(
                                              fontSize: kwidth * 0.03),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Central mall, Jaynagar',
                                          style: TextStyle(
                                            fontSize: kwidth * 0.03,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        Text(
                                          '2nd October, 11:45 AM',
                                          style: TextStyle(
                                            fontSize: kwidth * 0.03,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        Text(
                                          'International Filim Festival',
                                          style: TextStyle(
                                            fontSize: kwidth * 0.03,
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
                Align(
                  alignment: Alignment.topRight,
                  child: InkWell(
                    onTap: () {
                      if (fadeCallBack != null) {
                        showCardsNotifier.value = HomeScreensList.second;
                        showCardsNotifier.notifyListeners();
                        fadeCallBack!();
                      }else{
                        Navigator.pop(context);
                      }
                    },
                    child: const CircleAvatar(
                      radius: 15,
                      backgroundColor: neonShade,
                      child: Icon(
                        Icons.close,
                      ),
                    ),
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
