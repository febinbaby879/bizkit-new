import 'package:bizkit/application/presentation/fade_transition/fade_transition.dart';
import 'package:bizkit/application/presentation/screens/authentication/view/widgets/auth_button.dart';
import 'package:bizkit/application/presentation/utils/appbar.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:bizkit/application/presentation/utils/constants/contants.dart';
import 'package:flutter/material.dart';

class ProductsBuilder extends StatelessWidget {
  const ProductsBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              adjustHieght(khieght * .04),
              ListView.separated(
                separatorBuilder: (context, index) =>
                    adjustHieght(kwidth * .03),
                itemCount: 5,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return SizedBox(
                    height: 260,
                    width: double.infinity,
                    child: Stack(
                      children: [
                        SizedBox(
                          height: 200,
                          width: double.infinity,
                          child: Image.asset(
                            'asset/images/person3.jpeg',
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          left: 0,
                          right: 0,
                          bottom: 0,
                          child: Container(
                            padding: const EdgeInsets.only(left: 10),
                            color: klightgrey.withOpacity(.1),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Best Employee Award',
                                        style: textStyle1.copyWith(
                                          fontSize: kwidth * .04,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      Text(
                                        'Lorem Ipsum Sic Mundus Creatus Est. Lorem Ipsum Sic Mundus Creatus Est.',
                                        style: textStyle1.copyWith(
                                          fontSize: kwidth * .03,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                adjustWidth(kwidth * .02),
                                AuthButton(
                                  hieght: 35,
                                  wdth: 90,
                                  text: 'View',
                                  onTap: () {
                                    Navigator.of(context).push(fadePageRoute(
                                        const ProductViewDetail()));
                                  },
                                ),
                                adjustWidth(kwidth * .02),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              adjustHieght(khieght * .03),
            ],
          ),
        ),
      ),
    );
  }
}

class ProductViewDetail extends StatelessWidget {
  const ProductViewDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(kwidth, 70),
          child: const AppbarCommen(tittle: 'Products')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Image.asset(dummyPersonImage),
              adjustHieght(30),
              const Text('Best employee Award'),
              adjustHieght(30),
              const Text(
                  'Lorem Ipsum Sic Mundus Creatus Est. Lorem Ipsum Sic Mundus Creatus Est. Lorem Ipsum Sic Mundus Creatus Est. Lorem Ipsum Sic Mundus Creatus'),
              const Spacer(),
              AuthButton(
                text: 'Continue',
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
              adjustHieght(30),
            ],
          ),
        ),
      ),
    );
  }
}