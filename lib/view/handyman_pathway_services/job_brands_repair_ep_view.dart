import 'dart:developer';

import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:doorway/res/color.dart';
import 'package:doorway/res/components/CustomGoogleFontText.dart';
import 'package:flutter/material.dart';

import '../../Model/SevicesModel.dart';
import '../../Model/SubServiceModel.dart';
import '../../utils/SizeConfig.dart';

class JobBrandsRepairEP extends StatefulWidget {
  final ServicesModel? selectedService;
  final int? totalPrice;

  const JobBrandsRepairEP({Key? key, this.selectedService, this.totalPrice})
      : super(key: key);

  @override
  _JobBrandsRepairEPState createState() => _JobBrandsRepairEPState();
}

class _JobBrandsRepairEPState extends State<JobBrandsRepairEP> {
  // late ServicesBloc servicesBloc;
  // ServicesState get initialState => InitialServicesState();

  List<SubServiceModel> subServices = [];
  List brands = [];

  @override
  void initState() {
    brands = widget.selectedService?.brands ?? [];
    if (brands.isNotEmpty) {
      for (var element in brands) {
        subServices.add(SubServiceModel(
          title: element,
          isSelected: false,
        ));
      }
    }
    // servicesBloc = ServicesBloc(initialState);
    // servicesBloc.add(SubServicesByVendorServiceEvent(
    //     serviceId: widget.selectedService!.id!,
    //     vendorId: VendorManager.vendor.id!));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: CustomGoogleFontText(
          text: 'Job Details',
          size: SizeConfig.width17,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          IconButton(
              icon: const Icon(
                Icons.close,
                color: Colors.black,
              ),
              onPressed: () async {
                final r1 = await showOkCancelAlertDialog(
                  context: context,
                  title: 'Confirmation',
                  message: 'Are you sure you want to exit?',
                  okLabel: 'Yes',
                  cancelLabel: 'No',
                );

                log(r1.index.toString());
                if (r1.index == 0) {}

                //Navigator.of(context).pop();
              })
        ],
      ),
      body: Column(
        children: [
          Container(
            height: SizeConfig.height40,
            color: Colors.grey.shade200,
            alignment: Alignment.center,
            child: CustomGoogleFontText(
              text: 'Which brand is your appliance?',
              size: SizeConfig.width15,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: Container(
              child: GridView.builder(
                itemCount: subServices.length,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 2),
                itemBuilder: (ctx, index) {
                  return serviceItem(name: brands[index], index: index);
                },
              ),
            ),
          ),
          // appColorButton(title: 'Continue'),
        ],
      ),
    );
  }

  Widget serviceItem({required String name, required int index}) {
    return GestureDetector(
      onTap: () async {
        for (var element in subServices) {
          element.isSelected = false;
        }
        subServices[index].isSelected = true;
        int totalPrice = widget.totalPrice ?? 0;
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            //color: Colors.white,
            color: subServices[index].isSelected
                ? AppColors.primaryColor
                : Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade300,
                offset: const Offset(3.0, 3.0),
                blurRadius: 5.0,
                spreadRadius: 2.0,
              ),
            ]),
        child: Row(
          children: [
            Expanded(
              child: CustomGoogleFontText(
                text: name,
                textAlign: TextAlign.center,
                size: SizeConfig.width13,
                fontWeight: FontWeight.bold,
                // color: AppColors.primaryColor,
                color: subServices[index].isSelected
                    ? Colors.white
                    : AppColors.primaryColor,
              ),
            ),
            const SizedBox(
              width: 20,
            ),
          ],
        ),
      ),
    );
  }
}
