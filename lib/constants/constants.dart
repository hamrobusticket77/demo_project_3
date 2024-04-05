import 'package:flutter/material.dart';

class Constants {
  static const String appName = 'Hamro bus ticket';
  static const developerUrl = 'https://';
  static const emptyString = '';
  static const emptyDashedString = '---';
  static const orZero = 0;
  static const orZeroDouble = 0.0;
  static const debugPass = 'stackTrace';
  static double padding(double deviceWidth) => deviceWidth * 0.03;
  static double hPadding(double deviceHeight) => deviceHeight * 0.02;
}

class AppColors {
  static Color primaryColor = const Color(0xFF0B1875);
  static Color primaryColorLight = const Color(0xFF262B4F);
}

class AppDefaults {
  static double bodyHeight(double deviceHeight) => deviceHeight * 0.8307;
  static const mapMarkerDefaultWidth = 50;
  static const mapMarkerMyLocationWidth = 60;
  static const mapMarkerOnlineWidth = 20;
  static const minDragScaleSize = 25;
  static const maxDragScaleSize = 50;
  static const phoneNumberLength = 10;
  static const reportDuration = 1;
  static const minCarouselInfiniteScrollLength = 3;
  static const reportCrossAxisCount = 3;
  static const inAppNotificationDuration = 10;
  static const geofenceRadiusMin = 100.0;
  static const geofenceRadiusMax = 1000.0;
  static const geofenceRadiusStep = 10;
  static const flickVelocity = 1000;
  static const minDragDismissDistance = 100;
  static const drawerHeaderHeightPX = 78.0;
  static const connectionTimeOutSeconds = 60;
  static const splashSec = 1;
  static const animationDurationMSShort = 100;
  static const animationDurationMS = 300;
  static const animationDurationMSLong = 500;
  static const animationDurationSec = 1;
  static const markerAnimationDurationSec = 3;
  static const markerLabelBorderRadius = 4.0;
  static const contentBorderRadius = 8.0;
  static const borderRadius = 16.0;
  static const borderRadiusSmall = 12.0;
  static const contentPaddingXXSmall = 2.0;
  static const contentPaddingXSmall = 4.0;
  static const contentPaddingSmall = 6.0;
  static const contentPadding = 8.0;
  static const padding = 12.0;
  static const paddingLarge = 16.0;
  static const paddingXLarge = 18.0;
  static const paddingXXLarge = 24.0;
  static const feedbackMaxCharacters = 120;
  static const reportStaffMaxCharacters = 120;
  static const minZoomLevel = 6.0;
  static const minZoomClamp = 12.0;
  static const midZoomLevel = 14.0;
  static const maxZoomLevel = 18.0;
  static const maxZoomClamp = 16.0;
}

class UrlConstants {
  static String baseUrl = "http://www.hamrobusticket.com:8525";
  static String otpauth = "$baseUrl/api/otpauth/generateotp";
  static String otpVerify = "$baseUrl/api/otpauth/verifyotp";
  static String addPersonalDetails = "/api/auth-owner/addPersonalDetail";
  static String addBankDetails = "/api/auth-owner/addBankDetail";
  static String addPanDetails = "/api/auth-owner/addPanDetail";
  static const addPanCard = "/api/auth-owner/adddocuments/pancard";
  static const addCitizenship = "/api/auth-owner/adddocuments/citizenship";
  static const getProfileInfo = "/api/owners/myprofile";
  static const changeUserImage = "/api/owners/updateprofilepic";
  static const editUserProfile = "/api/owners/updateuserdetails";
  static const getBusList = "/api/bus/getlistofbus";
  static const String generateBus = "/api/bus/generatebus/";
  static String addBus(String id) => "/api/bus/businformation/$id";
  static String addBusImage(String id) => "/api/bus/uploadbusimage/$id";
}

class Routes {
  static const String test = "test";
  static const splash = '/';
  static const otpPage = '/otpPage';
  static const verifyOtp = '/verify';
  static const personalDetails = '/personalDetails';
  static const bankDetailsRoute = '/bankDetails';
  static const panDetailsRoute = '/panDetails';
  static const document = '/document';
  static const loginPage = "/loginPage";
  static const kycRoute = "/kyc";
  static const pendingPage = "/pendingPage";
  static const successPage = "/successPage";
  static const homePage = "/homePage";
  static const editProfile = "/editProfile";
  static const busConfiguration = "/busConfiguration";
  static const busdetails = "/busdetails";
  static const seatDetails = "/seatDetails";
  static const busList = "/busList";
}
