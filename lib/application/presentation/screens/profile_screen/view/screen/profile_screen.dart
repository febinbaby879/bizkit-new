import 'package:bizkit/application/business_logic/auth/login/auth_bloc.dart';
import 'package:bizkit/application/presentation/fade_transition/fade_transition.dart';
import 'package:bizkit/application/presentation/screens/authentication/view/screens/login_screen.dart';
import 'package:bizkit/application/presentation/screens/profile_screen/view/screen/account_settings/account_settings_scree.dart';
import 'package:bizkit/application/presentation/screens/profile_screen/view/screen/connection_network/connection_network_screen.dart';
import 'package:bizkit/application/presentation/screens/profile_screen/view/screen/data_management/data_management.dart';
import 'package:bizkit/application/presentation/screens/profile_screen/view/screen/help_support/help_support.dart';
import 'package:bizkit/application/presentation/screens/profile_screen/view/screen/privacy_security/privacy_screen.dart';
import 'package:bizkit/application/presentation/screens/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';

import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    animation = Tween<double>(begin: 0, end: 1).animate(animationController);
    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: knill,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: FadeTransition(
            opacity: animation,
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 75,
                  backgroundColor: neonShade,
                  child: CircleAvatar(
                    radius: 73,
                    backgroundColor: kblack,
                    child: CircleAvatar(
                      radius: 67,
                      backgroundImage: AssetImage('asset/images/person.jpeg'),
                    ),
                  ),
                ),
                adjustHieght(khieght * .04),
                const ProfileTiles(
                  heading: 'Account Settings',
                  subtittle: 'Profile, Password, Email Etc.',
                  widget: AccountSettigsScreen(),
                ),
                const ProfileTiles(
                  heading: 'Privacy and Security',
                  subtittle: 'Level, Security Preferences Etc.',
                  widget: PrivacyAndSecurityScreen(),
                ),
                const ProfileTiles(
                  heading: 'Data Management',
                  subtittle: 'Data Export, delete etc.',
                  widget: DataManagement(),
                ),
                const ProfileTiles(
                  heading: 'Connections & Networking',
                  subtittle: 'Blocked, Restricted, Report Connections',
                  widget: ConnectionNetworkScreen(),
                ),
                ProfileTiles(
                  heading: 'Help & Support',
                  subtittle: 'Contact, Faq etc.',
                  widget: HelpSupport(),
                ),
                ProfileTiles(
                  heading: 'Logout',
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoGInScreen()),
                        (route) => false);
                    context.read<AuthBloc>().add(const AuthEvent.logOut());
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProfileTiles extends StatelessWidget {
  const ProfileTiles({
    Key? key,
    this.widget,
    required this.heading,
    this.subtittle,
    this.onTap,
  }) : super(key: key);
  final Widget? widget;
  final String heading;
  final String? subtittle;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onTap != null) {
          onTap!();
        } else {
          Navigator.of(context).push(fadePageRoute(widget!));
        }
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: ColoredBox(
          color: textFieldFillColr,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(heading,
                        style: TextStyle(
                          fontSize: kwidth * 0.045,
                          fontWeight: FontWeight.w200,
                          color: kwhite,
                        )),
                    subtittle == null
                        ? const SizedBox()
                        : Text(
                            subtittle!,
                            style: TextStyle(
                              fontSize: kwidth * 0.03,
                              fontWeight: FontWeight.w200,
                              color: klightgrey,
                            ),
                          ),
                  ],
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.arrow_forward_ios_sharp,
                    color: kwhite,
                    size: 17,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
