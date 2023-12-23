import 'package:animate_do/animate_do.dart';
import 'package:bizkit/core/const.dart';
import 'package:bizkit/feature/create_business_card.dart/view/widgets/indicator_skip_continue.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LogoStory extends StatelessWidget {
  LogoStory({super.key, required this.pageController});

  final PageController pageController;
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return FadeIn(
      duration: const Duration(milliseconds: 900),
      delay: const Duration(milliseconds: 600),
      child: ListView(
        children: [
          adjustHieght(khieght * .03),
          const Text(
            'Logo Story',
            style: TextStyle(fontSize: 20),
          ),
          adjustHieght(khieght * .02),
          Center(
            child: DottedBorder(
              dashPattern: const [8, 8],
              color: neonShade,
              strokeWidth: 2.5,
              child: SizedBox(
                width: 290.dm,
                height: 91.dm,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 32.dm,
                      height: 32.dm,
                      child: const CircleAvatar(
                        backgroundImage: AssetImage(
                          'asset/images/carbon_add-filled.png',
                        ),
                      ),
                    ),
                    Text(
                      'Add logo from file',
                      style: TextStyle(fontSize: 10.sp),
                    ),
                  ],
                ),
              ),
            ),
          ),
          adjustHieght(khieght * .02),
          const Text(
            'Logo story',
            style: TextStyle(fontSize: 20),
          ),
          adjustHieght(khieght * .02),
          Container(
            color: textFieldFillColr,
            child: TextField(
              maxLines: 13,
              decoration: InputDecoration(
                fillColor: textFieldFillColr,
                filled: true,
                hintText:
                    "Your logo has been made with so much of thoughts and is designed to inspire. I'm sure that there is a story/ deep meaning behind your logo. This is one of the few places where you can impress the receiver of your card about the foundation of your logo",
                hintStyle: const TextStyle(color: klightgrey),
                border: UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(7),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(7),
                  borderSide: const BorderSide(
                    color: kwhite,
                  ),
                ),
              ),
            ),
          ),
          adjustHieght(khieght * .04),
          SkipContinueIndicator(pageController: pageController),
        ],
      ),
    );
  }
}
