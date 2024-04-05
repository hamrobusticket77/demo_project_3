import 'package:flutter/material.dart';
import 'package:frontend_vendor/constants/assets_source.dart';
import 'package:frontend_vendor/constants/constants.dart';
import 'package:frontend_vendor/extension/build_context_extension.dart';

class BusConfiguration extends StatelessWidget {
  const BusConfiguration({super.key});

  Widget _busConfigurationCard(
      {required String title,
      required String image,
      required BuildContext context,
      required Function ontap
      }) {
    return InkWell(
      onTap: () => ontap(),
      child: Container(
        height: context.height * 0.2,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.green,
          image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
        ),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xFF0B1875).withOpacity(0.8),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            height: 50,
            child: Center(
              child: Text(
                title,
                style: context.labelSmall!.copyWith(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 21),
          child: Column(
            children: [
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Row(
                  children: [
                    Icon(
                      Icons.arrow_back_ios,
                      color: AppColors.primaryColor,
                      size: 13,
                    ),
                    Text(
                      "Bus Configuration",
                      style: context.labelSmall!
                          .copyWith(color: AppColors.primaryColor),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              _busConfigurationCard(
                ontap: (){
                  context.navigatorPushNamed(Routes.busdetails);
                },
                  title: "Bus Details",
                  image: AssetsSource.busDetailsImage,
                  context: context),
              const SizedBox(height: 10),
              _busConfigurationCard(
                 ontap: (){
                  context.navigatorPushNamed(Routes.seatDetails);
                },
                  title: "Seat Details",
                  image: AssetsSource.busSeatImage,
                  context: context)
            ],
          ),
        ),
      ),
    );
  }
}
