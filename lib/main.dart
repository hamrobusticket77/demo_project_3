import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_vendor/constants/constants.dart';
import 'package:frontend_vendor/constants/themes.dart';
import 'package:frontend_vendor/view/authentication/login_screen/login_screen.dart';
import 'package:frontend_vendor/view/authentication/otp_page/otp_page.dart';
import 'package:frontend_vendor/view/authentication/verify_otp/verify_otp.dart';
import 'package:frontend_vendor/view/bus_configuration/bus_configuration.dart';
import 'package:frontend_vendor/view/bus_configuration/view/bus_detsils.dart';
import 'package:frontend_vendor/view/bus_configuration/view/seat_details.dart';
import 'package:frontend_vendor/view/bus_list/bus_list.dart';
import 'package:frontend_vendor/view/document_submit/document_submit.dart';
import 'package:frontend_vendor/view/edit_profile/edit_profile.dart';
import 'package:frontend_vendor/view/homepage/home_page.dart';
import 'package:frontend_vendor/view/pending_page/pending_page.dart';
import 'package:frontend_vendor/view/splash_screen/splash_screen.dart';
import 'package:frontend_vendor/view/sucess_page.dart/success_page.dart';
import 'package:hive_flutter/hive_flutter.dart';

//for developemt only
String testOtp = "";
final navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('localData');
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      theme: AppThemes.lightTheme(context),
      routes: {
        Routes.splash: (context) => const SplashScreen(),
        Routes.otpPage: (context) => const OtpPage(),
        Routes.verifyOtp: (context) => const VerifyOtpPage(),
        Routes.document: (context) => const DocumentSubmit(),
        Routes.loginPage: (context) => const LoginScreen(),
        Routes.pendingPage: (context) => const PendingPage(),
        Routes.successPage: (context) => const SuccessPage(),
        Routes.homePage: (context) => const HomePage(),
        Routes.editProfile: (context) => const EditProfile(),
        Routes.busConfiguration: (context) => const BusConfiguration(),
        Routes.busdetails: (context) => const BusDetails(),
        Routes.seatDetails: (context) => const SeatDetails(),
        Routes.busList: (context) => const BusList(),
      },
      initialRoute: Routes.splash,
    );
  }
}

