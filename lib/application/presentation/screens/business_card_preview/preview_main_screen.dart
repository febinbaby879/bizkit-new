import 'package:bizkit/application/business_logic/card/card/card_bloc.dart';
import 'package:bizkit/application/business_logic/card/create/business_data/business_data_bloc.dart';
import 'package:bizkit/application/business_logic/card/create/user_data/user_data_bloc.dart';
import 'package:bizkit/application/presentation/routes/routes.dart';
import 'package:bizkit/application/presentation/screens/business_card_preview/widgets/business_card_popupmenu_items.dart';
import 'package:bizkit/application/presentation/screens/create_business_card.dart/view/screens/create_business_card.dart';
import 'package:bizkit/application/presentation/screens/preview_commen_widgets/banking_personal_achieved/bank_person_achived_rows.dart';
import 'package:bizkit/application/presentation/screens/preview_commen_widgets/preview_pageview_image_builder/preview_pageview_image_builder.dart';
import 'package:bizkit/application/presentation/screens/preview_commen_widgets/brochers_and_products_builder/brocher_and_products_tab/preview_products_and_brands.dart';
import 'package:bizkit/application/presentation/screens/preview_commen_widgets/preview_row_vice_icons/preview_row_wice_icons.dart';
import 'package:bizkit/application/presentation/utils/loading_indicator/loading_animation.dart';
import 'package:bizkit/application/presentation/utils/snackbar/snackbar.dart';
import 'package:bizkit/domain/model/card/card/product/product.dart';
import 'package:bizkit/domain/model/card/create_card_by_id_model/create_card_by_id_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:bizkit/application/presentation/screens/authentication/view/widgets/auth_button.dart';
import 'package:go_router/go_router.dart';

class BusinessCardCreationPreviewScreen extends StatelessWidget {
  const BusinessCardCreationPreviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(kwidth, 50),
        child: const BusinessCardCreationPreviewAppBar(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            // image slide view
            SizedBox(
              height: 220,
              child: BlocBuilder<BusinessDataBloc, BusinessDataState>(
                builder: (context, business) {
                  return BlocBuilder<UserDataBloc, UserDataState>(
                    builder: (context, user) {
                      final logo = business.businessData?.logo != null
                          ? [business.businessData!.logo!]
                          : <String>[];
                      List<String> images = user.personalData?.photos != null
                          ? [user.personalData!.photos!]
                          : <String>[];
                      return PreviewPageviewImageBuilder(
                          imagesList: images + logo);
                    },
                  );
                },
              ),
            ),
            adjustHieght(khieght * .02),
            // user name and designation
            BlocBuilder<UserDataBloc, UserDataState>(
              builder: (context, user) {
                return Column(
                  children: [
                    Text(
                      user.personalData?.name ?? 'Name',
                      style: TextStyle(fontSize: 26.sp),
                    ),
                    Text(user.personalData?.designation ?? 'Designation'),
                  ],
                );
              },
            ),
            adjustHieght(khieght * .02),
            // contact,social,web details icon button row
            const PreviewRowWiceIcons(fromPreview: true),
            adjustHieght(khieght * .02),
            // banking, personal, achivements row icons
            const PreviewBankPersonAchivedRows(fromPreview: true),
            adjustHieght(khieght * .02),
            // products and brochers horizontal List view
            BlocBuilder<BusinessDataBloc, BusinessDataState>(
              builder: (context, business) {
                List<Product> images = [];
                if (business.businessData?.product != null) {
                  images = business.businessData!.product!;
                }
                List<String> pdf = [];
                if (business.businessData?.brochure != null) {
                  pdf = business.businessData!.brochure!
                      .map((e) => e.file!
                          .substring('data:application/pdf;base64,'.length))
                      .toList();
                }
                return PreviewProductsBrandsLists(
                  networkImages: images,
                  pdf: pdf,
                );
              },
            ),
            adjustHieght(khieght * .04),
            // card create button
            BlocBuilder<BusinessDataBloc, BusinessDataState>(
              builder: (context, businessSate) {
                return BlocConsumer<UserDataBloc, UserDataState>(
                  listener: (context, state) {
                    if (state.message != null) {
                      showSnackbar(context,
                          message: state.message!,
                          backgroundColor: state.hasError ? kred : neonShade);
                    }
                    if (state.cardAdded != null) {
                      context
                          .read<CardBloc>()
                          .add(const CardEvent.getCards(call: true));
                      if (fromHomeAddCard) {
                        print('go homw from home add card');
                        context.go(Routes.homePage);
                        // Navigator.pop(context);
                        // Navigator.pop(context);
                        // Navigator.pop(context);
                      } else {
                        context.go(Routes.homePage);
                        // Navigator.pushAndRemoveUntil(
                        //   context,
                        //   fadePageRoute(const BizkitBottomNavigationBar()),
                        //   (route) => false);
                      }
                      context.read<UserDataBloc>().add(UserDataEvent.clear());
                      context
                          .read<BusinessDataBloc>()
                          .add(BusinessDataEvent.clear());
                    }
                  },
                  builder: (context, userState) {
                    if (userState.isLoading) {
                      return const LoadingAnimation();
                    }
                    return AuthButton(
                      wdth: 180,
                      text: 'Create Business Card',
                      onTap: () {
                        print('on tap card creation');
                        // final CreateCardModel createCardModel = CreateCardModel(
                        //   personalDetails: userState.personalDetails,
                        //   bankDetails: businessSate.bankDetails,
                        //   businessDetails: businessSate.businessDetails,
                        // );
                        // print('on tap card creation model created');
                        // print(
                        //     'personal details ()=> ${createCardModel.personalDetails!.toJson()}');
                        // print('personal details  ()=> accolades ');
                        // for (var x
                        //     in createCardModel.personalDetails!.accolades!) {
                        //   print('personal accolades  ()=> ${x.toJson()}');
                        // }
                        // print('personal details  ()=> dates ');
                        // for (var x in createCardModel
                        //     .personalDetails!.datesToRemember!) {
                        //   print('personal dates  ()=> ${x.toJson()}');
                        // }
                        // print('personal details  ()=> socialmedia ');
                        // for (var x in createCardModel
                        //     .personalDetails!.personalSocialMedia!) {
                        //   print('personal social media  ()=> ${x.toJson()}');
                        // }
                        // print(
                        //     'business details ()=> ${createCardModel.businessDetails!.toJson()}');
                        // print('business details  ()=> brochure ');
                        // for (var x
                        //     in createCardModel.businessDetails!.brochure!) {
                        //   print('personal social brochure  ()=> ${x.toJson()}');
                        // }
                        // print('business details  ()=> social ');
                        // for (var x in createCardModel
                        //     .businessDetails!.socialMediaHandles!) {
                        //   print('personal social brochure  ()=> ${x.toJson()}');
                        // }
                        // print(
                        //     'bank details ()=> ${createCardModel.bankDetails!.toJson()}');
                        context.read<UserDataBloc>().add(
                              UserDataEvent.createCard(
                                createCardByIdModel: CreateCardByIdModel(
                                    businessDetails:
                                        businessSate.businessData!.id!,
                                    personalDetails:
                                        userState.personalData!.id!),
                              ),
                            );
                      },
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
