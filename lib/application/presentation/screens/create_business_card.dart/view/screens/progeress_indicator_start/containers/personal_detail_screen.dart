import 'package:bizkit/application/presentation/screens/create_business_card.dart/view/widgets/last_skip_and_aontinue.dart';
import 'package:bizkit/application/presentation/utils/text_field/textform_field.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PersonlDetails extends StatelessWidget {
  PersonlDetails({super.key, required this.pageController});

  TextEditingController bloodGroup = TextEditingController();
  TextEditingController homeAddress = TextEditingController();
  TextEditingController birthDaycontroller = TextEditingController();
  TextEditingController accoladesController = TextEditingController();
  TextEditingController datesToReminderController = TextEditingController();

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode focusScope = FocusScope.of(context);
        if (!focusScope.hasPrimaryFocus) {
          focusScope.unfocus();
        }
      },
      child: ListView(
        children: [
          adjustHieght(khieght * .04),
          const Text(
            'Personal Details',
            style: TextStyle(fontSize: 20),
          ),
          adjustHieght(khieght * .02),
          TTextFormField(
            text: 'Home address',
            controller: homeAddress,
            inputType: TextInputType.name,
          ),
          TTextFormField(
            text: 'Blood Group',
            controller: bloodGroup,
            inputType: TextInputType.name,
          ),
          TTextFormField(
            text: 'Birthday',
            controller: birthDaycontroller,
            inputType: TextInputType.name,
          ),
          Container(
            margin: const EdgeInsets.only(left: 12),
            height: 48.0,
            color: textFieldFillColr,
            child: const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Accolades',
                style: TextStyle(color: klightgrey),
              ),
            ),
          ),
          TTextFormField(
            text: 'Dates To Remember',
            controller: datesToReminderController,
            inputType: TextInputType.name,
          ),
          TTextFormField(
            text: 'ICE Details',
            controller: datesToReminderController,
            inputType: TextInputType.name,
            suffix: const Icon(
              Icons.keyboard_arrow_right,
            ),
          ),
          TTextFormField(
            text: 'Photos',
            controller: datesToReminderController,
            inputType: TextInputType.name,
          ),
          adjustHieght(khieght * .05),
          LastSkipContinueButtons(
            onTap: () => pageController.nextPage(
              duration: const Duration(milliseconds: 500),
              curve: Curves.ease,
            ),
          ),
          adjustHieght(khieght * .02),
        ],
      ),
    );
  }
}
