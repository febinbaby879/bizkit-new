import 'package:bizkit/core/const.dart';
import 'package:bizkit/feature/business_card_preview/view/widgets/bank_person_achived.dart';
import 'package:bizkit/feature/business_card_preview/view/widgets/image_offset_container.dart';
import 'package:bizkit/feature/business_card_preview/view/widgets/show_model_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ListTileDetailView extends StatelessWidget {
  const ListTileDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: kwhite,
          ),
        ),
        backgroundColor: Colors.transparent,
        title: const Text(
          'Febin',
          style: TextStyle(color: kwhite),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
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
              Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(7),
                  ),
                  border: Border.all(
                    color: textFieldFillColr,
                  ),
                ),
                height: 70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      radius: 10,
                      backgroundImage: AssetImage(
                        'asset/images/addButtunIconImage.png',
                      ),
                    ),
                    adjustWidth(kwidth * .03),
                    Text(
                      'Add Reminder',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () => bottomSheet(context),
                    child: SizedBox(
                      height: 80,
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
                height: 160,
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
                      height: 100,
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
              const VerticalScroll()
            ],
          ),
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

class VerticalScroll extends StatefulWidget {
  const VerticalScroll({super.key});

  @override
  State<VerticalScroll> createState() => _VerticalScrollState();
}

class _VerticalScrollState extends State<VerticalScroll> {
  double scrollPosition = 0.0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: NotificationListener<ScrollUpdateNotification>(
        onNotification: (notification) {
          setState(() {
            scrollPosition = notification.metrics.pixels;
          });
          return true;
        },
        child: Scrollbar(
          child: ListView.builder(
            itemCount: 50,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                  'Item $index',
                  style: const TextStyle(color: kwhite),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
