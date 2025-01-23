import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:doorway/res/color.dart';
import 'package:doorway/res/components/CustomGoogleFontText.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../Model/SevicesModel.dart';
import '../../Model/SubServiceModel.dart';
import '../../res/components/custom_text_button.dart';
import '../../utils/SizeConfig.dart';
import 'main_screen.dart';

class OtherInfoRepairEP extends StatefulWidget {
  final ServicesModel? selectedService;
  final SubServiceModel? selectedSubService;
  final List<ServicesModel>? servicesList;
  final List<SubServiceModel>? subsList;
  final int? totalPrice;
  final int? smallQ;
  final int? mediumQ;
  final int? largeQ;
  final int? ladderLength;

  const OtherInfoRepairEP({
    Key? key,
    this.selectedService,
    this.selectedSubService,
    this.totalPrice,
    this.largeQ,
    this.mediumQ,
    this.smallQ,
    this.ladderLength,
    this.servicesList,
    this.subsList,
  }) : super(key: key);

  @override
  _OtherInfoRepairEPState createState() => _OtherInfoRepairEPState();
}

class _OtherInfoRepairEPState extends State<OtherInfoRepairEP> {
  TextEditingController notesController = TextEditingController();

  late ImagePicker imagePicker;

  List<File> images = [];

  @override
  void initState() {
    imagePicker = ImagePicker();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: CustomGoogleFontText(
            text: 'Job Details',
            size: SizeConfig.width17,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          automaticallyImplyLeading: false,
          elevation: 0.0,
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
                  if (r1.index == 0) {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (context) => const ServiceMain(
                                  selectedIndex: 0,
                                )),
                        (route) => false);
                  }

                  //Navigator.of(context).pop();
                })
          ],
        ),
        body: Stack(
          children: [
            ListView(
              children: [
                Container(
                    height: SizeConfig.height40,
                    color: Colors.grey.shade200,
                    alignment: Alignment.center,
                    child: CustomGoogleFontText(
                      text: 'Anything else?',
                      size: SizeConfig.width15,
                      fontWeight: FontWeight.bold,
                    )),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 20),
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40.0),
                        color: Colors.grey.shade300,
                      ),
                      child: TextFormField(
                        controller: notesController,
                        maxLines: 10,
                        decoration: InputDecoration(
                          hintText: "Notes(optional)",
                          fillColor: Colors.grey.shade200,
                          filled: true,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(
                              color: Colors.white,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(
                              color: Colors.white,
                              width: 2.0,
                            ),
                          ),
                        ),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0, left: 20.0),
                  child: CustomGoogleFontText(
                    text: 'Add Some Pictures',
                    size: SizeConfig.width15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 20),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Stack(
                          children: [
                            SizedBox(
                              height: 170.0,
                              child: Container(
                                width: 160.0,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    color: Colors.grey.shade200),
                                child: images.length == 5
                                    ? Image.file(
                                        images[4],
                                        fit: BoxFit.cover,
                                      )
                                    : Center(
                                        child: GestureDetector(
                                          onTap: () {
                                            showBottomSheet(context);
                                          },
                                          child: CircleAvatar(
                                            backgroundColor:
                                                AppColors.primaryColor,
                                            radius: 36.0,
                                            child: const Icon(
                                              Icons.add,
                                              color: Colors.white,
                                              size: 45.0,
                                            ),
                                          ),
                                        ),
                                      ),
                              ),
                            ),
                            Visibility(
                              visible: images.length == 5,
                              child: Positioned(
                                right: -15,
                                top: -15,
                                child: IconButton(
                                  icon: const Icon(Icons.close,
                                      color: Colors.white),
                                  onPressed: () {
                                    setState(() {
                                      images.removeAt(4);
                                    });
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        Column(
                          children: [
                            Stack(
                              children: [
                                Container(
                                    width: 80,
                                    height: 80,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                        color: Colors.grey.shade200),
                                    child: images.length >= 4
                                        ? Image.file(
                                            images[3],
                                            fit: BoxFit.cover,
                                          )
                                        : Container()),
                                Visibility(
                                  visible: images.length >= 4,
                                  child: Positioned(
                                    right: -15,
                                    top: -15,
                                    child: IconButton(
                                      icon: const Icon(Icons.close,
                                          color: Colors.white),
                                      onPressed: () {
                                        setState(() {
                                          images.removeAt(3);
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Stack(
                              children: [
                                Container(
                                    width: 80,
                                    height: 80,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                        color: Colors.grey.shade200),
                                    child: images.length >= 3
                                        ? Image.file(
                                            images[2],
                                            fit: BoxFit.cover,
                                          )
                                        : Container()),
                                Visibility(
                                  visible: images.length >= 3,
                                  child: Positioned(
                                    right: -15,
                                    top: -15,
                                    child: IconButton(
                                      icon: const Icon(Icons.close,
                                          color: Colors.white),
                                      onPressed: () {
                                        setState(() {
                                          images.removeAt(2);
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        Column(
                          children: [
                            Stack(
                              children: [
                                Container(
                                    width: 80,
                                    height: 80,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                        color: Colors.grey.shade200),
                                    child: images.length >= 2
                                        ? Image.file(
                                            images[1],
                                            fit: BoxFit.cover,
                                          )
                                        : Container()),
                                Visibility(
                                  visible: images.length >= 2,
                                  child: Positioned(
                                    right: -15,
                                    top: -15,
                                    child: IconButton(
                                      icon: const Icon(Icons.close,
                                          color: Colors.white),
                                      onPressed: () {
                                        setState(() {
                                          images.removeAt(1);
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Stack(
                              children: [
                                Container(
                                    width: 80,
                                    height: 80,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                        color: Colors.grey.shade200),
                                    child: images.isNotEmpty
                                        ? Image.file(
                                            images[0],
                                            fit: BoxFit.cover,
                                          )
                                        : Container()),
                                Visibility(
                                  visible: images.isNotEmpty,
                                  child: Positioned(
                                    right: -15,
                                    top: -15,
                                    child: IconButton(
                                      icon: const Icon(Icons.close,
                                          color: Colors.white),
                                      onPressed: () {
                                        setState(() {
                                          images.removeAt(0);
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        bottomSheet: Container(
          color: Colors.white,
          padding: EdgeInsets.only(
            right: SizeConfig.width20,
            left: SizeConfig.width20,
            bottom: SizeConfig.height25,
          ),
          child: CustomTextButton(
            onPressed: () async {
              List<String> base64Images = [];
              for (int i = 0; i < images.length; i++) {
                final bytes = await images[i].readAsBytes();
                String result = base64Encode(bytes);
                result = "data:image/jpeg;base64,r''$result";
                base64Images.add(result);
              }
            },
          ),
        ));
  }

  showBottomSheet(BuildContext context) {
    showModalBottomSheet<void>(
      backgroundColor: Colors.white,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadiusDirectional.only(
            topStart: Radius.circular(12.0), topEnd: Radius.circular(12.0)),
      ),
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.only(top: 15.0),
          height: 140.0,
          child: Column(
            children: <Widget>[
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Pick Image',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: "WorkSans",
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  sheetContainerData(
                    "Gallery",
                    () {
                      Navigator.of(context).pop();
                      _pickImageFromGallery(context);
                    },
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  _pickImageFromGallery(BuildContext context) async {
    final List<XFile> image = await imagePicker.pickMultiImage();

    for (var element in image) {
      File newImage = File(element.path);
      setState(() {
        images.add(newImage);
      });
    }
  }

  Widget sheetContainerData(title, callBack) {
    return Container(
      child: InkWell(
        onTap: () {
          callBack();
        },
        child: Column(
          children: <Widget>[
            title == "Camera"
                ? Icon(Icons.photo_camera, color: AppColors.primaryColor)
                : Icon(
                    Icons.image,
                    color: AppColors.primaryColor,
                  ),
            const SizedBox(
              height: 10,
            ),
            CustomGoogleFontText(
              text: title,
              maxline: 2,
              overflow: TextOverflow.ellipsis,
              color: AppColors.primaryColor,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
