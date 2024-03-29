import 'package:bizkit/application/business_logic/card/create/business_data/business_data_bloc.dart';
import 'package:bizkit/application/business_logic/card/create/user_data/user_data_bloc.dart';
import 'package:bizkit/application/presentation/screens/authentication/view/widgets/auth_button.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:bizkit/application/presentation/utils/constants/contants.dart';
import 'package:bizkit/application/presentation/utils/snackbar/snackbar.dart';
import 'package:bizkit/application/presentation/utils/text_field/textform_field.dart';
import 'package:bizkit/domain/model/card/create_card/social_media_handle/social_media_handle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SocialMediahandlesScreen extends StatefulWidget {
  const SocialMediahandlesScreen({super.key, required this.fromBusiness});

  final bool fromBusiness;

  @override
  State<SocialMediahandlesScreen> createState() =>
      _SocialMediahandlesScreenState();
}

class _SocialMediahandlesScreenState extends State<SocialMediahandlesScreen> {
  TextEditingController linkController = TextEditingController();
  String selectedCategory = 'Social Media';
  List<String> socialMedias = socialMedia;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode focusScopeNode = FocusScope.of(context);
        if (!focusScopeNode.hasPrimaryFocus) {
          focusScopeNode.unfocus();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              size: 17,
            ),
          ),
          backgroundColor: knill,
          title: Text('Social media accounts', style: textHeadStyle1),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.check)),
            adjustWidth(20)
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: BlocBuilder<BusinessDataBloc, BusinessDataState>(
            builder: (context, business) {
              return BlocBuilder<UserDataBloc, UserDataState>(
                builder: (context, user) {
                  return Column(
                    children: [
                      adjustHieght(40),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: selectedCategory == 'Select your account'
                              ? null
                              : Border.all(color: kwhite),
                        ),
                        padding: const EdgeInsets.only(left: 10),
                        width: double.infinity,
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedCategory = newValue!;
                              });
                            },
                            items: List.generate(
                              socialMedias.length,
                              (index) => DropdownMenuItem(
                                value: socialMedias[index],
                                child: Text(socialMedias[index]),
                              ),
                            ),
                            hint: Text(
                              selectedCategory,
                              style: selectedCategory == 'Social Media'
                                  ? null
                                  : textStyle1.copyWith(color: kwhite),
                            ),
                          ),
                        ),
                      ),
                      adjustHieght(10),
                      TTextFormField(
                        maxlegth: selectedCategory == 'Whatsapp' ||
                                selectedCategory == 'Telegram'
                            ? 10
                            : null,
                        controller: linkController,
                        text: selectedCategory == 'Whatsapp'
                            ? 'Enter Whatsap Number'
                            : selectedCategory == 'Telegram'
                                ? 'Enter Telegram Number'
                                : 'Account link paste here',
                        inputType: selectedCategory == 'Whatsapp' ||
                                selectedCategory == 'Telegram'
                            ? TextInputType.number
                            : TextInputType.url,
                      ),
                      adjustHieght(30),
                      AuthButton(
                        text: 'Add',
                        onTap: () {
                          if (selectedCategory == 'Social Media') {
                            showSnackbar(context,
                                message: 'Select social media first',
                                textColor: kwhite,
                                backgroundColor: kred);
                            return;
                          }
                          if (linkController.text == '') {
                            showSnackbar(context,
                                message: 'add your social media link',
                                textColor: kwhite,
                                backgroundColor: kred);
                            return;
                          }
                          final link = selectedCategory == 'Whatsapp'
                              ? 'https://wa.me/${linkController.text}'
                              : selectedCategory == 'Telegram'
                                  ? 'https://t.me/+${linkController.text}'
                                  : linkController.text;
                          final model = SocialMediaHandleCreate(
                              label: selectedCategory, socialMedia: link);
                          !widget.fromBusiness
                              ? context.read<UserDataBloc>().add(
                                  UserDataEvent.addSocialMedia(
                                      socialMediaHandle: model))
                              : context.read<BusinessDataBloc>().add(
                                  BusinessDataEvent.addSocialMedia(
                                      socialMediaHandle: model));
                          linkController.text = '';
                          selectedCategory = 'Social Media';
                          setState(() {});
                        },
                      ),
                      adjustHieght(30),
                      Wrap(
                        children: List.generate(
                          widget.fromBusiness
                              ? business.socialMedias.length
                              : user.socialMedias.length,
                          (index) => Stack(
                            children: [
                              Container(
                                margin: const EdgeInsets.all(8),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 8),
                                decoration: BoxDecoration(
                                    border: Border.all(color: neonShade),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10))),
                                child: Text(widget.fromBusiness
                                    ? business.socialMedias[index].label ??
                                        'accound $index'
                                    : user.socialMedias[index].label ??
                                        'account $index'),
                              ),
                              Positioned(
                                right: 0,
                                top: 0,
                                child: InkWell(
                                  onTap: () {
                                    widget.fromBusiness
                                        ? context.read<BusinessDataBloc>().add(
                                            BusinessDataEvent.removeSocialMedia(
                                                index: index))
                                        : context.read<UserDataBloc>().add(
                                            UserDataEvent.removeSocialMedia(
                                                index: index));
                                  },
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: const ColoredBox(
                                      color: neonShade,
                                      child: Padding(
                                        padding: EdgeInsets.all(5),
                                        child: Icon(Icons.close, size: 12),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
