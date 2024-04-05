import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_vendor/extension/build_context_extension.dart';
import 'package:frontend_vendor/provider/pan_details_provider.dart';
import 'package:frontend_vendor/widgets/custom_textfields.dart';
import 'package:frontend_vendor/widgets/text_field_title.dart';

class PanDetailsMobile extends StatefulWidget {
  const PanDetailsMobile({super.key, required this.onSucess});
  final Function onSucess;

  @override
  State<PanDetailsMobile> createState() => _PanDetailsMobileState();
}

class _PanDetailsMobileState extends State<PanDetailsMobile> {
  late final TextEditingController panNameController;
  late final TextEditingController panNumberController;
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
    panNumberController = TextEditingController();
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
    panNumberController.dispose();
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
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Personal Details",
                    style: context.titleMedium,
                  ),
                  const SizedBox(height: 20),
                  textfieldTitle(title: "Pan Name", context: context),
                  const SizedBox(height: 5),
                  CustomTextField(
                    controller: panNameController,
                    hintText: "Pan Name",
                  ),
                  const SizedBox(height: 10),
                  textfieldTitle(title: "Pan Address", context: context),
                  const SizedBox(height: 5),
                  CustomTextField(
                    controller: panAddressController,
                    hintText: "Pan Address",
                  ),
                  const SizedBox(height: 10),
                  textfieldTitle(title: "Issue Date", context: context),
                  const SizedBox(height: 5),
                  CustomTextField(
                    controller: issueDateController,
                    hintText: "Issue Date",
                  ),
                  const SizedBox(height: 10),
                  textfieldTitle(title: "Date of Birth", context: context),
                  const SizedBox(height: 5),
                  CustomTextField(
                    controller: dobController,
                    hintText: "Date of Birth",
                  ),
                  const SizedBox(height: 20),
                  Consumer(builder: (context, ref, child) {
                    final state = ref.watch(panDetailsProvider);
                    return ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            FocusScope.of(context).unfocus();
                            ref.read(panDetailsProvider.notifier).addPanDetails(
                           
                                panName: panNameController.text,
                                panAddress: panAddressController.text,
                                issueDate: issueDateController.text,
                                dob: dobController.text,
                                onSuccess: () {
                                  widget.onSucess();
                                },
                                onError: (error) {
                                  context.showSnackBar(error);
                                });
                          }
                        },
                        child: state.isLoading
                            ? const CircularProgressIndicator()
                            : const Text("Submit"));
                  })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
