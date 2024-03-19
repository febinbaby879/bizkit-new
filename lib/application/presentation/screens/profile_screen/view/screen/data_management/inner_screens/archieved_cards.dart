import 'package:bizkit/application/business_logic/profile/profile_bloc.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:bizkit/application/presentation/utils/constants/contants.dart';
import 'package:bizkit/application/presentation/utils/loading_indicator/loading_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ArchivedCards extends StatelessWidget {
  const ArchivedCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: kwhite,
          ),
        ),
        backgroundColor: knill,
        title: Text(
          'Archived cards',
          style: textHeadStyle1,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: BlocBuilder<ProfileBloc, ProfileState>(
            builder: (context, state) {
              if (state.isLoading) {
                return const LoadingAnimation();
              } else {
                if (state.archievedCards != null) {
                  return SizedBox(
                    child: ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: state.archievedCards!.length,
                      separatorBuilder: (context, index) =>
                          adjustWidth(kwidth * .05),
                      itemBuilder: (context, index) {
                        final card = state.archievedCards![index];
                        return Container(
                          decoration: BoxDecoration(
                            color: textFieldFillColr,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          width: 300,
                          child: Column(
                            children: [
                              Stack(
                                children: [
                                  SizedBox(
                                    width: 300,
                                    height: 200,
                                    child: InkWell(
                                      onTap: () {},
                                      child: ClipRRect(
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(25),
                                          topRight: Radius.circular(20),
                                        ),
                                        child: state.archievedCards == null ||
                                                state.archievedCards![index]
                                                        .logo ==
                                                    null
                                            ? Image.network(imageDummyNetwork,
                                                fit: BoxFit.cover)
                                            : Image.network(
                                                card.logo!,
                                                fit: BoxFit.cover,
                                              ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              adjustHieght(khieght * .02),
                              Row(
                                children: [
                                  adjustWidth(kwidth * .02),
                                  Text(
                                    '${state.archievedCards![index].name ?? ''}\n${state.archievedCards![index].designation}',
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  const Spacer(),
                                  InkWell(
                                    // onTap: () => bottomSheet(context, card),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: kblue,
                                      ),
                                      width: 100,
                                      height: 30,
                                      child: Center(
                                        child:
                                            Text('Restore', style: textStyle1),
                                      ),
                                    ),
                                  ),
                                  adjustWidth(kwidth * .02)
                                ],
                              ),
                              adjustHieght(khieght * .02),
                            ],
                          ),
                        );
                      },
                    ),
                  );
                } else {
                  return SizedBox(
                      height: khieght,
                      child: const Center(
                          child: Text("You don't have archeived cards")));
                }
              }
            },
          ),
        ),
      ),
    );
  }
}
