import 'package:alphabet_scroll_view/alphabet_scroll_view.dart';
import 'package:bizkit/application/business_logic/contacts/contacts_bloc.dart';
import 'package:bizkit/application/presentation/fade_transition/fade_transition.dart';
import 'package:bizkit/application/presentation/screens/card_view/card_detail_view.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:bizkit/application/presentation/utils/snackbar/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactConnectionsTab extends StatelessWidget {
  const ContactConnectionsTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ContactsBloc>().add(const ContactsEvent.getContactsList());
    });
    return Expanded(
      child: BlocConsumer<ContactsBloc, ContactsState>(
        listener: (context, state) {
          if (state.message != null) {
            showSnackbar(
              context,
              message: state.message!,
            );
          }
        },
        builder: (context, state) {
          print('contacts list length ==> (${state.contactList?.length})');

          if (state.isLoading || state.fetchingLoading) {
            return Column(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Center(
                  child: CircularProgressIndicator(),
                ),
                adjustHieght(20),
                const Text('We are syncing your contacts,\n please wait',textAlign: TextAlign.center,)
              ],
            );
          } else if (state.contactList == null || state.hasError) {
            return const Center(
              child: Text('Contacts List is Empty'),
            );
          } else {
            return AlphabetScrollView(
              list: state.contactList!
                  .map((e) => AlphaModel(e.name ?? 'Names'))
                  .toList(),
              alignment: LetterAlignment.right,
              itemExtent: 50,
              unselectedTextStyle: TextStyle(
                fontSize: kwidth * .042,
                color: smallBigGrey,
              ),
              selectedTextStyle:
                  TextStyle(fontSize: kwidth * .049, color: kwhite),
              overlayWidget: (value) => Stack(
                alignment: Alignment.center,
                children: [
                  const Icon(
                    Icons.star_border_sharp,
                    size: 50,
                    color: neonShade,
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      value.toUpperCase(),
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
              itemBuilder: (context, index, __) {
                final data = state.contactList![index];
                return GestureDetector(
                  onTap: () => Navigator.of(context).push(
                    fadePageRoute(ScreenCardDetailView(
                      userId: data.id,
                    )),
                  ),
                  child: ListTile(
                    leading: data.photo != null && data.photo!.isNotEmpty
                        ? CircleAvatar(
                            radius: 18,
                            backgroundImage: NetworkImage(data.photo!))
                        : const CircleAvatar(
                            radius: 18,
                            backgroundColor: textFieldFillColr,
                            child: Center(
                              child: Icon(
                                Icons.person,
                                color: neonShade,
                              ),
                            ),
                          ),
                    title: Row(
                      children: [
                        Text(
                          data.name ?? data.phoneNumber ?? 'data',
                          style: TextStyle(
                            fontSize: kwidth * .040,
                          ),
                        ),
                        //   adjustWidth(kwidth * .03),
                        //   Text(
                        //     // data.jobTitle ??
                        //     'Job Title',
                        //     style: TextStyle(
                        //       fontWeight: FontWeight.w200,
                        //       fontSize: kwidth * .031,
                        //     ),
                        //   ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
