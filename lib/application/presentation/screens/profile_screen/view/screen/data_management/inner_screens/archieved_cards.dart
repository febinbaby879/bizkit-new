import 'package:bizkit/application/business_logic/card/card/card_bloc.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:bizkit/application/presentation/utils/constants/contants.dart';
import 'package:bizkit/application/presentation/utils/dailog.dart';
import 'package:bizkit/application/presentation/utils/loading_indicator/loading_animation.dart';
import 'package:bizkit/application/presentation/utils/shimmier/shimmer.dart';
import 'package:bizkit/application/presentation/utils/snackbar/snackbar.dart';
import 'package:bizkit/application/presentation/widgets/refresh_indicator.dart';
import 'package:bizkit/domain/model/card/cards_in_profile/card_action_rewuest_model/card_action_rewuest_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ArchivedCards extends StatefulWidget {
  const ArchivedCards({super.key, this.scrollController});

  final ScrollController? scrollController;

  @override
  State<ArchivedCards> createState() => _ArchivedCardsState();
}

class _ArchivedCardsState extends State<ArchivedCards> {
  _scrollCallBack() {
    if (widget.scrollController!.position.pixels ==
        widget.scrollController!.position.maxScrollExtent) {
      context.read<CardBloc>().add(const CardEvent.getArchievedCardsEvent());
    }
  }

  @override
  void initState() {
    super.initState();
    if (widget.scrollController != null) {
      widget.scrollController!.addListener(() {
        widget.scrollController!.animateTo(.1,
            duration: const Duration(milliseconds: 500),
            curve: Curves.fastEaseInToSlowEaseOut);
        _scrollCallBack();
      });
    }
  }

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
          child: BlocConsumer<CardBloc, CardState>(listener: (context, state) {
            if (state.successResponseModel != null) {}
          }, builder: (context, state) {
            if (state.isLoading) {
              return ShimmerLoader(
                itemCount: 10,
                height: 240,
                width: kwidth * 0.9,
                seprator: const SizedBox(height: 10),
              );
            } else if (state.archievedCards == null) {
              return RefreshIndicatorCustom(
                message: errorMessage,
                onRefresh: () => context
                    .read<CardBloc>()
                    .add(const CardEvent.getArchievedCardsEvent()),
              );
            }
            if (state.archievedCards!.isEmpty) {
              return SizedBox(
                height: khieght,
                child: const Center(
                  child: Text("You don't have Archived cards"),
                ),
              );
            }
            return ListView.separated(
              controller: widget.scrollController,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: (state.archievedCards?.length ?? 0) +
                  (state.archiveCardLoading ? 1 : 0),
              separatorBuilder: (context, index) => adjustWidth(kwidth * .05),
              itemBuilder: (context, index) {
                if (state.archiveCardLoading &&
                    index == state.archievedCards!.length) {
                  return const LoadingAnimation();
                }
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
                                        state.archievedCards![index].logo ==
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
                            onTap: () {
                              showConfirmationDialog(
                                heading: 'Restore Card',
                                actionButton: 'Restore',
                                context,
                                onPressed: () {
                                  CardActionRewuestModel
                                      cardActionRewuestModel =
                                      CardActionRewuestModel(
                                    isArchived: false,
                                  );
                                  context.read<CardBloc>().add(
                                        CardEvent.restoreArchiveDeleteCard(
                                            cardActionRewuestModel:
                                                cardActionRewuestModel,
                                            cardId: state
                                                .archievedCards![index].id!),
                                      );
                                  showSnackbar(
                                    context,
                                    message: 'Card restored',
                                  );
                                },
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: kblue,
                              ),
                              width: 100,
                              height: 30,
                              child: Center(
                                child: Text('Restore', style: textStyle1),
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
            );
          }),
        ),
      ),
    );
  }
}
