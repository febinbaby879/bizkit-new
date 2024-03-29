import 'dart:convert';

import 'package:animate_do/animate_do.dart';
import 'package:bizkit/application/business_logic/auth/signup/sign_up_bloc.dart';
import 'package:bizkit/application/presentation/routes/routes.dart';
import 'package:bizkit/application/presentation/screens/authentication/view/widgets/auth_button.dart';
import 'package:bizkit/application/presentation/utils/loading_indicator/loading_animation.dart';
import 'package:bizkit/application/presentation/utils/snackbar/snackbar.dart';
import 'package:bizkit/application/presentation/utils/text_field/textform_field.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:bizkit/domain/model/auth/email_model/email_model.dart';
import 'package:bizkit/domain/model/auth/sign_up_indivudal_model/sign_up_indivudal_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class IndividuelSignIn extends StatelessWidget {
  IndividuelSignIn({super.key});

  final TextEditingController mobileController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailIdController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController rePasswordController = TextEditingController();
  final GlobalKey<FormState> personalSignup = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: FadeIn(
        duration: const Duration(milliseconds: 700),
        delay: const Duration(milliseconds: 200),
        child: Form(
          key: personalSignup,
          child: Column(
            children: [
              adjustHieght(khieght * .04),
              Text(
                'Create your key to your business kit',
                style: custumText(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              adjustHieght(khieght * .04),
              TTextFormField(
                text: 'Name',
                controller: nameController,
                validate: Validate.notNull,textCapitalization: TextCapitalization.words,
                inputType: TextInputType.text,
              ),
              TTextFormField(
                validate: Validate.phone,
                maxlegth: 10,
                text: 'Mobile Number',
                controller: mobileController,
                inputType: TextInputType.number,
              ),
              // company mail
              BlocListener<SignUpBloc, SignUpState>(
                listener: (context, state) {
                  if (state.message != null) {
                    showSnackbar(context,
                        message: state.message!,
                        backgroundColor: state.hasError ? kred : neonShade);
                  }
                  if (state.otpSendIndividual) {
                    // navigate to otp screen when send
                    final SignUpIndivudalModel signUpModel =
                        SignUpIndivudalModel(
                            isBusiness: false,
                            isVerified: false,
                            name: nameController.text.trim(),
                            email: emailIdController.text.trim(),
                            password: passwordController.text.trim(),
                            phoneNumber: mobileController.text.trim());
                    print('otp individual got');
                    GoRouter.of(context)
                        .pushNamed(Routes.otpPage, pathParameters: {
                      'email': emailIdController.text.trim(),
                      'fromBusiness': 'false',
                      'model': jsonEncode({
                        'signUpIndivudalModel': jsonEncode(signUpModel.toJson())
                      })
                    });
                  }
                },
                child: TTextFormField(
                  validate: Validate.email,
                  text: 'Mail',
                  controller: emailIdController,
                  inputType: TextInputType.emailAddress,
                ),
              ),
              // TTextFormField(
              //   validate: Validate.password,
              //   password: passwordController,
              //   text: 'Password',
              //   controller: passwordController,
              //   inputType: TextInputType.visiblePassword,
              //   obscureText: true,
              // ),
              PasswordHintmaker(passwordController: passwordController),
              TTextFormField(
                validate: Validate.rePassword,
                password: passwordController,
                text: 'Re-Enter Password',
                controller: rePasswordController,
                inputType: TextInputType.visiblePassword,
                obscureText: true,
              ),
              adjustHieght(khieght * .01),
              InkWell(
                onTap: () => Navigator.pop(context),
                child: const Text(
                  'Already have an account?  Login',
                ),
              ),
              adjustHieght(khieght * .04),
              BlocBuilder<SignUpBloc, SignUpState>(
                builder: (context, state) {
                  if (state.isLoading) {
                    return const LoadingAnimation();
                  }
                  return AuthButton(
                    text: 'SignUp',
                    onTap: () {
                      if (personalSignup.currentState!.validate()) {
                        context.read<SignUpBloc>().add(
                              SignUpEvent.sendOtp(
                                emailModel: EmailModel(
                                    email: emailIdController.text.trim()),
                                isBusiness: false,
                              ),
                            );
                      }
                    },
                  );
                },
              ),
              adjustHieght(khieght * .04),
            ],
          ),
        ),
      ),
    );
  }
}

class PasswordHintmaker extends StatefulWidget {
  const PasswordHintmaker({super.key, required this.passwordController});

  final TextEditingController passwordController;
  @override
  State<PasswordHintmaker> createState() => _PasswordHintmakerState();
}

class _PasswordHintmakerState extends State<PasswordHintmaker> {
  bool showHint = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Visibility(visible: showHint, child: adjustHieght(5)),
        Visibility(
          visible: showHint,
          child: Text(
            'Password must contain 8 characters and should have 1 uppercase, 1 lowercase, 1 special character and 1 number',
            style: textStyle1.copyWith(color: kred.withOpacity(0.7)),
          ),
        ),
        TTextFormField(
          onTap: () {
            if (!showHint) {
              setState(() {
                showHint = true;
              });
            }
          },
          validate: Validate.password,
          text: 'Password',
          controller: widget.passwordController,
          obscureText: true,
          inputType: TextInputType.visiblePassword,
        ),
      ],
    );
  }
}
