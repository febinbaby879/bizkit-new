import 'package:bizkit/application/presentation/screens/create_business_card.dart/view/screens/progeress_indicator_start/linear_progress_indicator/personal_detail_screen/accolades/accolades_screen.dart';
import 'package:bizkit/application/presentation/screens/preview_commen_widgets/banking_personal_achieved/banking_and_presonal_screens.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:bizkit/application/presentation/fade_transition/fade_transition.dart';
import 'package:bizkit/application/presentation/utils/constants/contants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardViewBankPersonAchivedRows extends StatelessWidget {
  const CardViewBankPersonAchivedRows({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 5, right: 7),
            child: InkWell(
              onTap: () => Navigator.of(context).push(
                fadePageRoute(const PreviewBankOrPersnalScreen(
                  isFromBankScreen: true,
                )),
              ),
              child: containerStyle(iconBankingHouse, 'Banking'),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 5, right: 7),
            child: InkWell(
              onTap: () => Navigator.of(context).push(fadePageRoute(
                const PreviewBankOrPersnalScreen(
                  isFromBankScreen: false,
                ),
              )),
              child: containerStyle(iconPersonOutline, 'Personal'),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 5, right: 7),
            child: InkWell(
              onTap: () => Navigator.of(context).push(
                fadePageRoute(const AccolodesScreen(accolade: null)),
              ),
              child: containerStyle(iconAchivementsMedal, 'Achieved'),
            ),
          ),
        )
      ],
    );
  }

  Widget containerStyle(String image, String text) {
    return Container(
      height: 45,
      decoration: BoxDecoration(
        color: lightColr,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        border: Border.all(color: Colors.grey),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
              child: Image.asset(image)),
          Text(text, style: TextStyle(fontSize: 10.sp)),
        ],
      ),
    );
  }
}