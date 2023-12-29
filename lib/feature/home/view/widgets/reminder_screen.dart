import 'package:bizkit/commen/widgets/textform_field.dart';
import 'package:bizkit/core/const.dart';
import 'package:flutter/material.dart';

class AddReminderScreen extends StatelessWidget {
  AddReminderScreen({super.key});

  final dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    DateTime? selectedDate;
    DateTime? chooseDate;
    return GestureDetector(
      onTap: () {
        FocusScopeNode focusScope = FocusScope.of(context);
        if (!focusScope.hasPrimaryFocus) {
          focusScope.unfocus();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: knill,
          foregroundColor: kwhite,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
            ),
          ),
          title: const Text('Alex Adams'),
          actions: [
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.more_vert_outlined))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                TTextFormField(
                  suffix: Icon(
                    Icons.edit_outlined,
                    color: kwhite.withOpacity(0.5),
                  ),
                  text: 'Write Meeting Label',
                  controller: TextEditingController(),
                  inputType: TextInputType.text,
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  height: kwidth * 0.3,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: textFieldFillColr,
                    borderRadius: BorderRadius.all(
                      Radius.circular(7),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Message',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: klightgrey,
                            fontSize: kwidth * 0.04),
                      ),
                      TextField(
                        controller: TextEditingController(),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Write here',
                          hintStyle: TextStyle(
                              color: klightgrey, fontSize: kwidth * 0.03),
                        ),
                      ),
                    ],
                  ),
                ),
                adjustHieght(kwidth * 0.03),
                Container(
                  padding: const EdgeInsets.all(10),
                  height: kwidth * 0.13,
                  decoration: const BoxDecoration(
                    color: textFieldFillColr,
                    borderRadius: BorderRadius.all(
                      Radius.circular(7),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          child: TextField(
                        controller: dateController,
                      )),
                    ],
                  ),
                ),
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  child: ColoredBox(
                    color: kwhite.withOpacity(0.05),
                    child: Column(
                      children: [
                        CalendarDatePicker(
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate: DateTime.now().add(
                            const Duration(days: 365),
                          ),
                          onDateChanged: (date) {
                            selectedDate = date;
                            print(selectedDate);
                          },
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () {
                                chooseDate = null;
                              },
                              child: const Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () {
                                chooseDate = selectedDate;
                                print('choose date = $chooseDate');
                              },
                              child: const Text('ok'),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                adjustHieght(kwidth * 0.10),
                Row(
                  children: [
                    adjustWidth(kwidth * 0.30),
                    Expanded(
                        child: GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: Container(
                        height: kwidth * 0.1,
                        decoration: BoxDecoration(
                            border: Border.all(color: neonShade),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(8))),
                        child: const Center(
                          child: Text('Cancel'),
                        ),
                      ),
                    )),
                    adjustWidth(kwidth * 0.10),
                    Expanded(
                        child: Container(
                      height: kwidth * 0.1,
                      decoration: const BoxDecoration(
                          color: textFieldFillColr,
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      child: const Center(
                        child: Text('Save & Notify'),
                      ),
                    ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
