import 'package:bizkit/application/business_logic/auth/login/auth_bloc.dart';
import 'package:bizkit/application/business_logic/auth/signup/sign_up_bloc.dart';
import 'package:bizkit/application/business_logic/card/business_data/business_data_bloc.dart';
import 'package:bizkit/application/business_logic/card/user_data/user_data_bloc.dart';
import 'package:bizkit/application/business_logic/contacts/contacts_bloc.dart';
import 'package:bizkit/application/business_logic/internet_connection_check/internet_connection_check_cubit.dart';
import 'package:bizkit/application/presentation/screens/splash_screen/splash_screen.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:bizkit/domain/core/di/dipendency_injection.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  );
  await configuteInjection();
  runApp(MyApp(
    connectivity: Connectivity(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.connectivity});
  final Connectivity connectivity;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    khieght = size.height;
    kwidth = size.width;

    return ScreenUtilInit(
      child: MultiBlocProvider(
        providers: [
          BlocProvider<InternetConnectionCheckCubit>(
              create: (ctx) =>
                  InternetConnectionCheckCubit(connectivity: connectivity)),
          BlocProvider(create: (context) => getIt<ContactsBloc>()),
          BlocProvider(create: (context) => getIt<AuthBloc>()),
          BlocProvider(create: (context) => getIt<SignUpBloc>()),
          BlocProvider(create: (context) => getIt<UserDataBloc>()),
          BlocProvider(create: (context) => getIt<BusinessDataBloc>()),
        ],
        child: MaterialApp(
          debugShowMaterialGrid: false,
          theme: ThemeData(
            primaryColor: kblack,
            colorScheme: const ColorScheme.dark(primary: neonShade),
            scaffoldBackgroundColor: backgroundColour,
            textTheme: Theme.of(context).textTheme.apply(
                  bodyColor: kwhite,
                  displayColor: kwhite,
                  fontFamily: 'Euclid',
                ),
          ),
          debugShowCheckedModeBanner: false,
          home: const SplashScreen(),
        ),
      ),
    );
  }
}
