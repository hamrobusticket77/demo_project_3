import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_vendor/constants/constants.dart';
import 'package:frontend_vendor/extension/build_context_extension.dart';
import 'package:frontend_vendor/model/bus_add_model.dart';
import 'package:frontend_vendor/provider/add_bus_provider.dart';
import 'package:frontend_vendor/provider/bus_list_provider.dart';
import 'package:frontend_vendor/provider/document_upload_provider.dart';
import 'package:frontend_vendor/widgets/custom_appbar.dart';
import 'package:frontend_vendor/widgets/custom_textfields.dart';
import 'package:frontend_vendor/widgets/text_field_title.dart';

class BusDetails extends ConsumerStatefulWidget {
  const BusDetails({super.key});

  @override
  ConsumerState<BusDetails> createState() => _BusDetailsState();
}

class _BusDetailsState extends ConsumerState<BusDetails> {
  late final TextEditingController busNameController;
  late final TextEditingController busNumberController;
  late final TextEditingController busTypeController;
  late final TextEditingController seatingCapacityController;
  late final TextEditingController insuranceNameController;
  late final TextEditingController travelInsuranceController;
  late final TextEditingController dateOfIssueController;
  late final TextEditingController dateOfExpiryController;
  late final TextEditingController roadTaxIssueController;
  late final TextEditingController roadTaxExpiryController;

  @override
  void initState() {
    busNameController = TextEditingController();
    busNumberController = TextEditingController();
    busTypeController = TextEditingController();
    seatingCapacityController = TextEditingController();
    insuranceNameController = TextEditingController();
    travelInsuranceController = TextEditingController();
    dateOfIssueController = TextEditingController();
    dateOfExpiryController = TextEditingController();
    roadTaxIssueController = TextEditingController();
    roadTaxExpiryController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    busNameController.dispose();
    busNumberController.dispose();
    busTypeController.dispose();
    seatingCapacityController.dispose();
    insuranceNameController.dispose();
    travelInsuranceController.dispose();
    dateOfIssueController.dispose();
    dateOfExpiryController.dispose();
    roadTaxIssueController.dispose();
    roadTaxExpiryController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(addBusProvider, (previous, next) {
      if (next.isLoading) {
        context.showLoadingDialouge();
      }
      if (!next.isLoading && !next.busImage.isNotEmpty) {
        Navigator.pop(context);
      }
    });
    return Scaffold(
      appBar: CustomAppbar.defaultAppBar(context,
          title: "", automaticallLeadingbutton: false),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 21),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    ref.read(addBusProvider.notifier).clerImage();
                    Navigator.pop(context);
                  }, 
                  child: Row(
                    children: [
                      Icon(
                        Icons.arrow_back_ios,
                        color: AppColors.primaryColor,
                        size: 13,
                      ),
                      Text(
                        "Bus Details",
                        style: context.labelSmall!
                            .copyWith(color: AppColors.primaryColor),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Bus Information",
                    style: context.labelSmall,
                  ),
                ),
                const SizedBox(height: 20),
                textfieldTitle(title: "Bus Name", context: context),
                const SizedBox(height: 5),
                CustomTextField(
                  hintText: "Your bus here",
                  controller: busNameController,
                ),
                const SizedBox(height: 10),
                textfieldTitle(title: "Bus Number", context: context),
                const SizedBox(height: 5),
                CustomTextField(
                  hintText: "Bus Number here",
                  controller: busNumberController,
                ),
                const SizedBox(height: 10),
                textfieldTitle(title: "Bus Type", context: context),
                const SizedBox(height: 5),
                CustomTextField(
                  hintText: "Mini Bus",
                  controller: busTypeController,
                ),
                const SizedBox(height: 10),
                textfieldTitle(title: "Seating Capacity", context: context),
                const SizedBox(height: 5),
                const CustomTextField(hintText: "Number of seat available"),
                const SizedBox(height: 15),
                textfieldTitle(title: "Amenities", context: context),
                const SizedBox(height: 5),
                Row(
                  children: [
                    Checkbox(value: true, onChanged: (value) {}),
                    const Text("A/C"),
                    SizedBox(
                      width: context.width * 0.3,
                    ),
                    Checkbox(value: true, onChanged: (value) {}),
                    const Text("WiFi"),
                  ],
                ),
                Row(
                  children: [
                    Checkbox(value: true, onChanged: (value) {}),
                    const Text("A/C"),
                    SizedBox(
                      width: context.width * 0.3,
                    ),
                    Checkbox(value: true, onChanged: (value) {}),
                    const Text("Non-AC"),
                  ],
                ),
                const SizedBox(height: 20),
                textfieldTitle(title: "Bus Image", context: context),
                const SizedBox(height: 10),
                SizedBox(
                  child: Consumer(builder: (context, WidgetRef ref, child) {
                    final state = ref.watch(addBusProvider);
                    return GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: (state.busImage.length + 1) < 5
                          ? state.busImage.length + 1
                          : 5,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 14,
                              crossAxisCount: 3),
                      itemBuilder: (context, index) {
                        if ((index == state.busImage.length ||
                                state.busImage.isEmpty) &&
                            state.busImage.length < 5) {
                          return DottedBorder(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 15),
                            borderType: BorderType.RRect,
                            radius: const Radius.circular(4),
                            dashPattern: const [10, 2],
                            color: const Color(0xFFC5C5C8),
                            child: GestureDetector(
                              onTap: () {
                                if (state.busImage.length < 5) {
                                  ref
                                      .read(documentUploadProvider.notifier)
                                      .captureImage(onSucess: (img) {
                                    ref
                                        .read(addBusProvider.notifier)
                                        .addBusImage(img);
                                  });
                                }
                              },
                              child: Column(
                                children: [
                                  const Spacer(),
                                  const Center(child: Icon(Icons.add)),
                                  const Spacer(),
                                  Text(
                                    "${index + 1} of 5 Images",
                                    style: context.labelSmall,
                                  ),
                                ],
                              ),
                            ),
                          );
                        } else {
                          return DottedBorder(
                            borderType: BorderType.RRect,
                            radius: const Radius.circular(4),
                            dashPattern: const [10, 2],
                            color: const Color(0xFFC5C5C8),
                            child: Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: AssetImage(
                                        state.busImage[index].path,
                                      ))),
                            ),
                          );
                        }
                      },
                    );
                  }),
                ),
                const SizedBox(height: 5),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Insurance Details",
                    style: context.labelSmall,
                  ),
                ),
                const SizedBox(height: 20),
                textfieldTitle(title: "Insurance Name", context: context),
                const SizedBox(height: 5),
                CustomTextField(
                  hintText: "Name of Insurance Company",
                  controller: insuranceNameController,
                ),
                const SizedBox(height: 10),
                textfieldTitle(title: "Travel Insurance", context: context),
                const SizedBox(height: 5),
                CustomTextField(
                  hintText: "Insurance per Traveller",
                  controller: travelInsuranceController,
                ),
                const SizedBox(height: 10),
                textfieldTitle(title: "Date of Issue", context: context),
                const SizedBox(height: 5),
                CustomTextField(
                  hintText: "Issue Date",
                  controller: dateOfIssueController,
                ),
                const SizedBox(height: 10),
                textfieldTitle(title: "Date of Exipry", context: context),
                const SizedBox(height: 5),
                CustomTextField(
                  hintText: "Expiry Date",
                  controller: dateOfExpiryController,
                ),
                const SizedBox(height: 20),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Road Tax Details",
                    style: context.labelSmall,
                  ),
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  hintText: "Issue Date",
                  controller: roadTaxIssueController,
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  hintText: "Expiry Date",
                  controller: roadTaxExpiryController,
                ),
                const SizedBox(height: 20),
                Consumer(builder: (context, WidgetRef ref, child) {
                  final state = ref.watch(addBusProvider);
                  return ElevatedButton(
                      onPressed: () {
                        ref.read(addBusProvider.notifier).getModel(
                            onSuccess: () {
                              ref.read(busListProvider.notifier).getBusList();
                              context.showSnackBar("Bus Added Successfully");

                              Navigator.pop(context);
                            },
                            busAddModel: BusAddModel(
                                name: busNameController.text,
                                busNumber: busNumberController.text,
                                busType: busTypeController.text,
                                amenities: [],
                                insuranceName: insuranceNameController.text,
                                travelInsurance: travelInsuranceController.text,
                                insuranceIssueDate: dateOfIssueController.text,
                                insuranceExpiryDate:
                                    dateOfExpiryController.text,
                                roadTaxIssueDate: roadTaxIssueController.text,
                                roadTaxExpiryDate:
                                    roadTaxExpiryController.text));
                      },
                      child: state.isLoading
                          ? const CircularProgressIndicator()
                          : const Text("Update"));
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
