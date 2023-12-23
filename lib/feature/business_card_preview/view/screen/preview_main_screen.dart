import 'package:bizkit/fade_transition/fade_transition.dart';
import 'package:bizkit/feature/business_card_preview/view/widgets/bank_person_achived.dart';
import 'package:bizkit/feature/business_card_preview/view/widgets/image_offset_container.dart';
import 'package:bizkit/feature/business_card_preview/view/widgets/show_model_items.dart';
import 'package:bizkit/navbar/navba.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bizkit/core/const.dart';
import 'package:bizkit/feature/authentication/view/widgets/auth_button.dart';

class PreviewMainScreen extends StatelessWidget {
  const PreviewMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          PopupMenuButton<String>(
            icon: const Icon(
              Icons.more_vert,
              size: 30,
              color: kwhite,
            ),
            onSelected: (value) {
              print('Selected: $value');
            },
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'Edit Bizkit card',
                child: Text('Edit Bizkit card'),
              ),
              const PopupMenuItem(
                value: 'Add information',
                child: Text('Add information'),
              ),
              const PopupMenuItem(
                value: 'Report a problem',
                child: Text('Report a problem'),
              ),
            ],
          ),
        ],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
          color: kwhite,
        ),
        backgroundColor: Colors.transparent,
        title: const Text(
          'My Bizkit Card Preview',
          style: TextStyle(color: kwhite),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            const SizedBox(
              height: 200,
              child: ImageOffsetContainers(),
            ),
            const SizedBox(height: 20),
            Text(
              'Febin Baby',
              style: TextStyle(color: kwhite, fontSize: 26.sp),
            ),
            const Text('Mobile app developer - Flutter'),
            adjustHieght(khieght * .02),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () => bottomSheet(context),
                  child: Container(
                    height: 40,
                    decoration: const BoxDecoration(color: textFieldFillColr),
                    child: Image.asset('asset/images/preview phone.png'),
                  ),
                ),
                rowItems(asset: 'asset/images/preview messages gif.gif'),
                rowItems(asset: 'asset/images/preview globe.gif'),
                rowItems(asset: 'asset/images/preview_spinner.png'),
                rowItems(asset: 'asset/images/preview location gif.gif'),
              ],
            ),
            adjustHieght(khieght * .02),
            const BankPersonAchivedRows(
              first: 'asset/images/banking.png',
              scnd: 'asset/images/persona.png',
              third: 'asset/images/achieved.png',
            ),
            adjustHieght(khieght * .02),
            Container(
              decoration: const BoxDecoration(
                color: textFieldFillColr,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              width: double.infinity,
              height: 140,
              child: Column(
                children: [
                  adjustHieght(khieght * .01),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Products / Brands'),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: neonShade,
                          ),
                          child: const Icon(Icons.arrow_right_outlined),
                        ),
                      ],
                    ),
                  ),
                  adjustHieght(khieght * .01),
                  SizedBox(
                    width: double.infinity,
                    height: 80,
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        List listImages = [
                          'asset/images/preview image 0.png',
                          'asset/images/preview list image 2.png',
                          'asset/images/preview list image 3.png',
                          'asset/images/previewlist image 1.png',
                          'asset/images/preview list image 3.png',
                          'asset/images/preview list image 2.png',
                        ];
                        return SizedBox(
                          width: 75.dm,
                          height: 80.dm,
                          child: Image.asset(
                            listImages[index],
                          ),
                        );
                      },
                      itemCount: 6,
                    ),
                  ),
                ],
              ),
            ),
            adjustHieght(khieght * .02),
            AuthButton(
              wdth: 180,
              text: 'Create buziness card',
              onTap: () {
                Navigator.of(context)
                    .push(fadePageRoute(const BizkitBottomNavigationBar()));
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget rowItems({required String asset}) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(6),
        ),
        color: Color.fromRGBO(53, 53, 53, 0.42),
      ),
      height: 40,
      child: Image.asset(asset),
    );
  }

  void bottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => const ModelSheetItems(),
    );
  }
}
