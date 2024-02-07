import 'dart:io';
import 'package:bizkit/application/presentation/utils/appbar.dart';
import 'package:bizkit/application/presentation/utils/constants/contants.dart';
import 'package:bizkit/application/presentation/utils/text_field/textform_field.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:bizkit/application/presentation/screens/authentication/view/widgets/auth_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddPrductsScreen extends StatefulWidget {
  final File? image;

  const AddPrductsScreen({
    Key? key,
    this.image,
  }) : super(key: key);

  @override
  State<AddPrductsScreen> createState() => _AddPrductsScreenState();
}

class _AddPrductsScreenState extends State<AddPrductsScreen> {
  TextEditingController textEditingController = TextEditingController();

  String selectedOption = '';
  bool? switchValue;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode focusScope = FocusScope.of(context);
        if (!focusScope.hasPrimaryFocus) {
          focusScope.unfocus();
        }
      },
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(kwidth, 70),
          child: const AppbarCommen(tittle: 'Add product contents'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Center(
              child: Column(
                children: [
                  adjustHieght(khieght * .05),
                  SizedBox(
                    width: 270.dm,
                    height: 170.dm,
                    child: Image.asset(
                      dummyPersonImage,
                      fit: BoxFit.cover,
                    ),
                  ),
                  adjustHieght(khieght * .02),
                  TTextFormField(
                    text: 'Name',
                    controller: textEditingController,
                    inputType: TextInputType.name,
                  ),
                  TTextFormField(
                    text: 'Description',
                    maxLines: 10,
                    controller: textEditingController,
                    inputType: TextInputType.name,
                  ),
                  adjustHieght(khieght * .02),
                  Container(
                    padding: const EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                      color: textFieldFillColr,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Add Enquire Button'),
                        Switch(
                          value: switchValue ?? false,
                          onChanged: (value) {
                            setState(() {
                              switchValue = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  adjustHieght(khieght * .03),
                  AuthButton(
                    text: 'Save product',
                    onTap: () => Navigator.of(context).pop(),
                  ),
                  adjustHieght(khieght * .04),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
