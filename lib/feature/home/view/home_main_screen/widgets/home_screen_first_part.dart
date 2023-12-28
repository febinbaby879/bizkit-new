import 'package:bizkit/core/const.dart';
import 'package:bizkit/fade_transition/fade_transition.dart';
import 'package:bizkit/feature/business_card_preview/view/screen/preview_main_screen.dart';
import 'package:bizkit/feature/create_business_card.dart/view/screens/create_business_card.dart';
import 'package:bizkit/feature/home/view/widgets/view_all_connection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreenFirstPart extends StatelessWidget {
  const HomeScreenFirstPart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 410,
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            children: [
              Column(
                children: [
                  Text(
                    'Hello',
                    style: TextStyle(
                      color: kwhite,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    'Febin',
                    style: TextStyle(
                      color: kwhite,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              const CircleAvatar(
                radius: 17,
                backgroundColor: textFieldFillColr,
                backgroundImage: AssetImage(
                  'asset/images/bizkitIcon.png',
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Text(
                'My Cards',
                style: TextStyle(
                  color: kwhite,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          adjustHieght(khieght * .02),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 130,
                width: 240,
                child: ListView.separated(
                  separatorBuilder: (context, index) => adjustWidth(
                    kwidth * .03,
                  ),
                  itemCount: 3,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () => Navigator.of(context)
                        .push(fadePageRoute(const PreviewMainScreen())),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      height: 130,
                      width: 220,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: kgreen,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                'Febin baby',
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(
                                'Mobile app developer',
                                style: TextStyle(fontSize: 14.sp),
                              ),
                              Image.asset('asset/images/home logo 1.png'),
                            ],
                          ),
                          const Icon(
                            Icons.arrow_right,
                            color: kwhite,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              adjustWidth(kwidth * .07),
              Expanded(
                child: GestureDetector(
                  onTap: () => Navigator.of(context).push(
                    fadePageRoute(const StartingBusinessCardCreation()),
                  ),
                  child: Container(
                    height: 130,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: textFieldFillColr,
                    ),
                    width: 140,
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage(
                            'asset/images/home add circl.png',
                          ),
                        ),
                        Text('Add Card'),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          adjustHieght(khieght * .02),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'My connections',
                style: TextStyle(
                  color: kwhite,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              GestureDetector(
                onTap: () => Navigator.of(context).push(
                  fadePageRoute(const ViewAllConnections()),
                ),
                child: Text(
                  'view all',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    decorationColor: kwhite,
                    decorationThickness: 1.5,
                    color: kwhite,
                    fontSize: 11.sp,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            height: 60,
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  height: 60,
                  width: 70,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: textFieldFillColr),
                  child: const Center(
                    child: Icon(
                      Icons.add,
                      size: 20,
                      color: kwhite,
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.separated(
                    separatorBuilder: (context, index) =>
                        adjustWidth(kwidth * .02),
                    itemCount: 5,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      List image = [
                        'https://images.healthshots.com/healthshots/en/uploads/2020/12/08182549/positive-person.jpg',
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRE4g-3ZH_1TjfN-zOuCRru2LrfrGtPbwaCsQ&usqp=CAU',
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT2fU6VWMdDDAYhNv6NQiHuGeXP3KKtPwVHew&usqp=CAU',
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSoKJPxxwPeNvISnBbZsZHe887Ws0FnrL7o0w&usqp=CAU',
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQm3gg3rbRr7rpvpYvr5viM9Bi1L3LglCYQ7w&usqp=CAU',
                      ];
                      return Container(
                        height: 40,
                        width: 60,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(image[index]),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}