import 'package:flutter/material.dart';
import 'package:frontend_vendor/extension/build_context_extension.dart';
import 'package:frontend_vendor/widgets/custom_textfields.dart';
import 'package:frontend_vendor/widgets/text_field_title.dart';

class PanDetailsWeb extends StatefulWidget {
  const PanDetailsWeb({super.key, required this.onSucess});
  final Function onSucess;

  @override
  State<PanDetailsWeb> createState() => _PanDetailsWebState();
}

class _PanDetailsWebState extends State<PanDetailsWeb> {
  late final TextEditingController panNameController;
  late final TextEditingController panAddressController;
  late final TextEditingController issueDateController;
  late final TextEditingController dobController;
  late final TextEditingController emailController;
  late final TextEditingController nameController;
  late final TextEditingController countryController;
  late final TextEditingController districtController;
  late final GlobalKey<FormState> formKey;

  @override
  void initState() {
    formKey = GlobalKey<FormState>();
    panNameController = TextEditingController();
    panAddressController = TextEditingController();
    issueDateController = TextEditingController();
    dobController = TextEditingController();
    emailController = TextEditingController();
    nameController = TextEditingController();
    countryController = TextEditingController();
    districtController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    panNameController.dispose();
    panAddressController.dispose();
    issueDateController.dispose();
    dobController.dispose();
    emailController.dispose();
    nameController.dispose();
    countryController.dispose();
    districtController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Form(
            key: formKey,
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 130, vertical: 60),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 2,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      "Pan Details",
                      style: context.titleMedium,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          flex: 1,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  textfieldTitle(
                                      title: "Name*", context: context),
                                  const SizedBox(height: 5),
                                  const Spacer(),
                                  SizedBox(
                                    width: context.width * 0.18,
                                    child: CustomTextField(
                                      isRequired: true,
                                      controller: panNameController,
                                      hintText: "Your Pan Name",
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),
                              Row(
                                children: [
                                  textfieldTitle(
                                      title: "Address*", context: context),
                                  const SizedBox(height: 5),
                                  const Spacer(),
                                  SizedBox(
                                    width: context.width * 0.18,
                                    child: CustomTextField(
                                      isRequired: true,
                                      controller: panAddressController,
                                      hintText: "Enter your Address",
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),
                              Row(
                                children: [
                                  textfieldTitle(
                                      title: "D.O.B*",
                                      context: context),
                                  const SizedBox(height: 5),
                                  const Spacer(),
                                  SizedBox(
                                    width: context.width * 0.18,
                                    child: CustomTextField(
                                      isRequired: true,
                                      controller: dobController,
                                      hintText: "Date of Birth",
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )),
                      const SizedBox(width: 100),
                      Expanded(
                          flex: 1,
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment
                                  .start, // Align children to the start of the cross axis

                              // mainAxisSize: MainAxisSize.max,
                              children: [
                                Row(
                                  children: [
                                    textfieldTitle(
                                        title: "Pan Number*", context: context),
                                    const SizedBox(height: 5),
                                    const Spacer(),
                                    SizedBox(
                                      width: context.width * 0.18,
                                      child: CustomTextField(
                                        isRequired: true,
                                        controller: issueDateController,
                                        hintText: "Your Account Number",
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 20),
                                Row(
                                  children: [
                                    textfieldTitle(
                                        title: "Issue Date*",
                                        context: context),
                                    const SizedBox(height: 5),
                                    const Spacer(),
                                    SizedBox(
                                      width: context.width * 0.18,
                                      child: CustomTextField(
                                        isRequired: true,
                                        controller: panNameController,
                                        hintText: "2023/04/12",
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )),
                    ],
                  ),
                  const Spacer(),
                  Center(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(200, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            FocusScope.of(context).unfocus();
                          }
                        },
                        child: const Text("Next")),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
