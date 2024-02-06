import 'package:animate_do/animate_do.dart';
import 'package:bizkit/application/presentation/screens/create_business_card.dart/view/widgets/last_skip_and_continue.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:bizkit/application/presentation/utils/text_field/textform_field.dart';
import 'package:flutter/material.dart';

class Personality extends StatelessWidget {
  const Personality({super.key, required this.pageController});
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return FadeIn(
      duration: const Duration(milliseconds: 900),
      delay: const Duration(milliseconds: 600),
      child: ListView(
        children: [
          adjustHieght(khieght * .03),
          const Text(
            'Personality',
            style: TextStyle(fontSize: 20),
          ),
          adjustHieght(khieght * .04),
          const TTextFormField(
            maxLines: 10,
            text:
                "Your logo has been made with so much of thoughts and is designed to inspire. I'm sure that there is a story/ deep meaning behind your logo. This is one of the few places where you can impress the receiver of your card about the foundation of your logo",
          ),
          adjustHieght(khieght * .05),
          LastSkipContinueButtons(
            onTap: () => pageController.nextPage(
              duration: const Duration(milliseconds: 500),
              curve: Curves.ease,
            ),
          ),
        ],
      ),
    );
  }
}
