// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';
import 'package:animate_do/animate_do.dart';
import 'package:bizkit/application/presentation/fade_transition/fade_transition.dart';
import 'package:bizkit/application/presentation/screens/business_card_preview/view/screen/preview_main_screen.dart';
import 'package:bizkit/application/presentation/screens/create_business_card.dart/view/widgets/last_skip_and_aontinue.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';

class BrochersAndProducts extends StatelessWidget {
  BrochersAndProducts({
    Key? key,
  }) : super(key: key);

  File? selectedImage;

  @override
  Widget build(BuildContext context) {
    return FadeIn(
      duration: const Duration(milliseconds: 900),
      delay: const Duration(milliseconds: 600),
      child: ListView(
        children: [
          adjustHieght(khieght * .03),
          const Text(
            'Brochures / Products',
            style: TextStyle(fontSize: 20),
          ),
          adjustHieght(khieght * .03),
          selectedImage == null
              ? const SizedBox()
              : SizedBox(
                  width: 100.dm,
                  height: 100.dm,
                  child: Image.file(File(selectedImage!.path)),
                ),
          Center(
            child: InkWell(
              onTap: () async {
                //await _pickImage(context);
              },
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
                        child: CircleAvatar(
                          child: IconButton(
                              onPressed: () {}, icon: const Icon(Icons.add)),
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
          ),
          adjustHieght(khieght * .5),
          LastSkipContinueButtons(
            onTap: () => Navigator.of(context).push(
              fadePageRoute(const PreviewMainScreen()),
            ),
          ),
        ],
      ),
    );
  }
}
