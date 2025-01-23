// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import '../res/components/CustomGoogleFontText.dart';
// import '../utils/SizeConfig.dart';

// class CouponListingScreenSod extends StatefulWidget {
//   const CouponListingScreenSod({
//     Key? key,
//   }) : super(key: key);

//   @override
//   // ignore: library_private_types_in_public_api
//   _CouponListingScreenSodState createState() => _CouponListingScreenSodState();
// }

// class _CouponListingScreenSodState extends State<CouponListingScreenSod> {
//   var couponListingController = Get.put(CouponsController());

//   @override
//   void initState() {
//     couponListingController.couponsListingMethod();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//           elevation: 0.0,
//           backgroundColor: Colors.white,
//           title: const Text(
//             'Coupons',
//             style: TextStyle(color: Colors.black),
//           ),
//           centerTitle: true,
//           leading: GestureDetector(
//             onTap: () {
//               Navigator.of(context).pop();
//             },
//             child: const Icon(
//               Icons.arrow_back,
//               color: Colors.black,
//             ),
//           )),
//       body: Obx(
//         () => !couponListingController.isLoading.value
//             ? const Center(
//                 child: CircularProgressIndicator(),
//               )
//             : couponListingController.couponListingList.isEmpty
//                 ? const Center(
//                     child: CustomGoogleFontText(
//                       text: 'No Record Found',
//                       size: 15,
//                     ),
//                   )
//                 : SingleChildScrollView(
//                     child: Column(
//                       children: [
//                         ListView.builder(
//                             itemCount: couponListingController
//                                 .couponListingList.length,
//                             shrinkWrap: true,
//                             physics: const NeverScrollableScrollPhysics(),
//                             itemBuilder: (context, index) {
//                               return GestureDetector(
//                                 onTap: () {},
//                                 child: Stack(
//                                   children: [
//                                     Row(
//                                       children: [
//                                         Container(
//                                           margin: const EdgeInsets.only(
//                                               top: 10, left: 20, bottom: 6),
//                                           height: SizeConfig.height90,
//                                           width: SizeConfig.width110,
//                                           decoration: BoxDecoration(
//                                               borderRadius:
//                                                   BorderRadius.circular(7),
//                                               color: Colors.black45),
//                                           child: ClipRRect(
//                                             borderRadius:
//                                                 BorderRadius.circular(12),
//                                             child: CachedNetworkImage(
//                                               fit: BoxFit.fill,
//                                               imageUrl: couponListingController
//                                                   .couponListingList[index]
//                                                   .image!,
//                                               placeholder: (context, url) =>
//                                                   const Center(
//                                                 child: SizedBox(
//                                                     height: 20,
//                                                     width: 20,
//                                                     child:
//                                                         CircularProgressIndicator()),
//                                               ),
//                                               errorWidget:
//                                                   (context, url, error) =>
//                                                       const Icon(Icons.error),
//                                             ),
//                                           ),
//                                         ),
//                                         Expanded(
//                                           child: Container(
//                                             margin: const EdgeInsets.all(6),
//                                             child: Column(
//                                               crossAxisAlignment:
//                                                   CrossAxisAlignment.start,
//                                               children: [
//                                                 CustomGoogleFontText(
//                                                   text: couponListingController
//                                                       .couponListingList[index]
//                                                       .title!,
//                                                   size: SizeConfig.width15,
//                                                   overflow:
//                                                       TextOverflow.ellipsis,
//                                                   fontWeight: FontWeight.bold,
//                                                 ),
//                                                 CustomGoogleFontText(
//                                                   text:
//                                                       'Coupon Code: ${couponListingController.couponListingList[index].couponCode!}',
//                                                   color: Colors.black,
//                                                 ),
//                                                 SizedBox(
//                                                   height: SizeConfig.height2,
//                                                 ),
//                                                 CustomGoogleFontText(
//                                                   text:
//                                                       'Min Order Value: ${couponListingController.couponListingList[index].minOrderValue}',
//                                                 ),
//                                                 SizedBox(
//                                                   height: SizeConfig.height2,
//                                                 ),
//                                                 CustomGoogleFontText(
//                                                   text:
//                                                       'Max discount Value: ${couponListingController.couponListingList[index].maxDiscountValue}',
//                                                 )
//                                               ],
//                                             ),
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ],
//                                 ),
//                               );
//                             }),
//                       ],
//                     ),
//                   ),
//       ),
//     );
//   }
// }
