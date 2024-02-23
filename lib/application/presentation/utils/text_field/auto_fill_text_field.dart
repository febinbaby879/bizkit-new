import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:bizkit/application/presentation/utils/text_field/textform_field.dart';
import 'package:bizkit/application/presentation/utils/validators/validators.dart';
import 'package:flutter/material.dart';

class AutocompleteTextField extends StatefulWidget {
  final String label;
  final TextEditingController? controller;
  final TextInputType? inputType;
  final bool obscureText;
  final bool showDropdown;
  final bool showDropdownOnTap;
  final int? maxLength;
  final int? maxLines;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Color? hintColor;
  final Function(String)? onChanged;
  final VoidCallback? onTap;
  final FocusNode? focusNode;
  final List<String>? autocompleteItems;
  final Validate? validate;

  const AutocompleteTextField({
    Key? key,
    this.showDropdown = false,
    this.showDropdownOnTap = false,
    this.validate,
    required this.label,
    this.controller,
    this.inputType,
    this.obscureText = false,
    this.maxLength,
    this.maxLines,
    this.prefixIcon,
    this.suffixIcon,
    this.hintColor,
    this.onChanged,
    this.onTap,
    this.focusNode,
    this.autocompleteItems,
  }) : super(key: key);

  @override
  _AutocompleteTextFieldState createState() => _AutocompleteTextFieldState();
}

class _AutocompleteTextFieldState extends State<AutocompleteTextField> {
  List<String> filteredAutocompleteItems = [];
  bool isDropdownVisible = false;
  @override
  void initState() {
    filteredAutocompleteItems = widget.autocompleteItems ?? [];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('rebuild in autocomplete');
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Material(
        elevation: 3,
        color: textFieldFillColr,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              focusNode: widget.focusNode,
              onTap: () {
                if (widget.autocompleteItems!.isNotEmpty ||
                    widget.showDropdown) {
                  setState(() {
                    isDropdownVisible = true;
                  });
                  widget.onTap?.call();
                }
              },
              onChanged: (value) {
                setState(() {
                  filteredAutocompleteItems = value.isEmpty
                      ? widget.autocompleteItems!
                      : widget.autocompleteItems
                              ?.where((item) => item
                                  .toLowerCase()
                                  .contains(value.toLowerCase()))
                              .toList() ??
                          [];
                });

                if (widget.onChanged != null) {
                  widget.onChanged!(value);
                }
              },
              maxLines: widget.maxLines ?? 1,
              style: TextStyle(
                color: kwhite,
                fontSize: kwidth * 0.033,
              ),
              maxLength: widget.maxLength,
              // onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
              obscureText: widget.obscureText,
              controller: widget.controller,
              keyboardType: widget.inputType ?? TextInputType.name,
              decoration: InputDecoration(
                suffixIcon: widget.suffixIcon,
                suffixIconColor: klightgrey,
                prefixIcon: widget.prefixIcon,
                prefixIconColor: kwhite,
                fillColor: textFieldFillColr,
                filled: true,
                labelText: widget.label,
                labelStyle: custumText(
                  colr: widget.hintColor ?? klightgrey,
                ),
                border: UnderlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(7),
                ),
                // focusedBorder: OutlineInputBorder(
                //   borderRadius: BorderRadius.circular(7),
                //   borderSide: const BorderSide(
                //     color: kwhite,
                //   ),
                // ),
              ),
              validator: (value) {
                if (Validate.none == widget.validate) {
                  return null;
                } else if ((value == null || value.isEmpty) &&
                    widget.validate == Validate.notNull) {
                  return 'Please enter ${widget.label}';
                } else if (widget.validate == Validate.email &&
                    !isValidEmail(value!)) {
                  return 'Please enter a valid email address';
                } else if (widget.validate == Validate.password &&
                    value!.length < 8) {
                  return 'Password must contain at least 8 characters';
                } else if (widget.validate == Validate.password) {
                  if (!hasLowerCase(value!)) {
                    return 'Password must contains lowerCase letters';
                  } else if (!hasCapsLetter(value)) {
                    return 'Password must contains UpperCase letters';
                  } else if (!hasNumbers(value)) {
                    return 'Password must contains numbers';
                  } else if (!hasSpecialChar(value)) {
                    return 'Password must contains special characters';
                  } else if (value.length < 8) {
                    return 'Password must contains 8 characters';
                  } else {
                    return null;
                  }
                } else if (Validate.phone == widget.validate) {
                  if (!RegExp(r'^[0-9]+$').hasMatch(value!)) {
                    return 'Enter valid phone number (numeric characters only)';
                  } else if (value.length != 10) {
                    return 'Phone number should have exactly 10 digits';
                  } else {
                    return null;
                  }
                }
                return null;
              },
            ),
            if (isDropdownVisible && filteredAutocompleteItems.isNotEmpty)
              Container(
                padding: const EdgeInsets.all(8),
                child: SizedBox(
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: filteredAutocompleteItems.length,
                    itemBuilder: (context, index) {
                      return SizedBox(height: 40,
                        child: ListTile(
                          title: Text(filteredAutocompleteItems[index]),
                          onTap: () {
                            setState(() {
                              widget.controller?.text =
                                  filteredAutocompleteItems[index];
                              filteredAutocompleteItems = [];
                            });
                          },
                        ),
                      );
                    },
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
