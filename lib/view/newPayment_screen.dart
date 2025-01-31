import 'package:cached_network_image/cached_network_image.dart';
import 'package:doorway/res/color.dart';
import 'package:doorway/res/components/CustomGoogleFontText.dart';
import 'package:doorway/view_model/order_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/SizeConfig.dart';
import '../utils/constants.dart';

class NewPaymentScreen extends StatefulWidget {
  const NewPaymentScreen({Key? key}) : super(key: key);

  @override
  _NewPaymentScreenState createState() => _NewPaymentScreenState();
}

class _NewPaymentScreenState extends State<NewPaymentScreen> {
  //int? radioSelected = 1;
  bool voucherCheck = false;

  var cartController = null; // Get.put(OrderController());

  // var ecomProductDetailController = Get.find<EcomProductDetailController>();
  RxDouble itemsTotal = 0.0.obs;

  /*var subtotal = 0.obs;
  var totalshipping = 0.obs;
  var total = 0.obs;*/
  TextEditingController voucherController = TextEditingController();
  bool? agreedTerms = false;

  @override
  void initState() {
    //cartController.isLoading.value = false;
    getPrices();
    calculateItemsTotal();
    /*calculateSubTotal();
    calculateShippingFee();
    total.value = subtotal.value + totalshipping.value;*/
    super.initState();
  }

  Future<void> getPrices() async {
    await cartController.ecomOrderCheck();
    setState(() {});
  }

  void calculateItemsTotal() {
    itemsTotal.value = 0;
    for (int i = 0; i < cartController.cartList.length; i++) {
      if (cartController.cartList[i].isSelected.value == 1) {
        int attributePrice = 0;
        if (cartController.cartList[i].attributes != null) {
          for (int c = 0;
              c < cartController.cartList[i].attributes!.length;
              c++) {
            // attributePrice +=
            //     cartController.cartList[i].attributes![c].price ?? 0;
          }
        }
        itemsTotal.value +=
            (cartController.cartList[i].price! + attributePrice) *
                cartController.cartList[i].quantity.value;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0.5,
        title: const CustomGoogleFontText(
          text: 'Summary',
          // style: TextStyle(color: Colors.black, fontSize: 16),
          size: 16,
          color: Colors.black,
          fontWeight: FontWeight.w600,
        ),
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
      ),
      body: Obx(
        () => !cartController.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: SizeConfig.width12),
                  child: Column(
                    children: [
                      SizedBox(
                        height: SizeConfig.height10,
                      ),

                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
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
                            Container(
                              margin: const EdgeInsets.all(15),
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.primaryColor),
                              child: Image.asset(
                                'assets/images/home_marker.png',
                                width: 25,
                                height: 25,
                                color: Colors.white,
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Flat {LocationManager.location.flat!}, {LocationManager.location.building!}',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color: Colors.black),
                                  ),
                                  Text(
                                    'LocationManager.location.address!',
                                    style: const TextStyle(
                                        fontSize: 14, color: Colors.grey),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.all(10),
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.primaryColor),
                              child: const Icon(
                                Icons.done,
                                color: Colors.white,
                                size: 10,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.height10,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: SizeConfig.width20),
                        child: const Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // ),
                            CustomGoogleFontText(
                              text: 'Summary',
                              size: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ],
                        ),
                      ),
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: cartController.cartList.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Container(
                                padding:
                                    const EdgeInsets.fromLTRB(20, 5, 5, 10),
                                child: Column(
                                  //crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: SizeConfig.width80,
                                          height: SizeConfig.height75,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(9),
                                            child: CachedNetworkImage(
                                              fit: BoxFit.fill,
                                              imageUrl: cartController
                                                          .cartList[index]
                                                          .image !=
                                                      null
                                                  ? cartController
                                                      .cartList[index].image!
                                                  : '',
                                              placeholder: (context, url) =>
                                                  const Center(
                                                child: SizedBox(
                                                    height: 20,
                                                    width: 20,
                                                    child:
                                                        CircularProgressIndicator()),
                                              ),
                                              errorWidget:
                                                  (context, url, error) =>
                                                      const Icon(Icons.error),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: SizedBox(
                                            width: SizeConfig.screenWidth,
                                            child: Padding(
                                              padding: EdgeInsets.only(
                                                  left: SizeConfig.width15),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  CustomGoogleFontText(
                                                    text: cartController
                                                        .cartList[index].name!,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    size: 14,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                  SizedBox(
                                                    height: SizeConfig.height35,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      CustomGoogleFontText(
                                                        text:
                                                            '$currency ${cartController.cartList[index].price!.toString()}',
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                      Padding(
                                                        padding: EdgeInsets.only(
                                                            right: SizeConfig
                                                                .width20),
                                                        child:
                                                            CustomGoogleFontText(
                                                          text:
                                                              'Qty:${cartController.cartList[index].quantity}',
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: SizeConfig.height22),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                      //..................

                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: width * 0.050,
                            vertical: SizeConfig.height5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomGoogleFontText(
                              text: 'Items Total',
                              size: SizeConfig.width15,
                              color: Colors.black45,
                            ),
                            CustomGoogleFontText(
                              text: '${itemsTotal.value} $currency',
                              size: SizeConfig.width15,
                              color: Colors.black45,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: width * 0.050,
                            vertical: SizeConfig.height5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomGoogleFontText(
                              text: 'Shipping Fee',
                              size: SizeConfig.width15,
                              color: Colors.black45,
                            ),
                            CustomGoogleFontText(
                              text: '${cartController.shippingFee} $currency',
                              size: SizeConfig.width15,
                              color: Colors.black45,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: width * 0.050,
                            vertical: SizeConfig.height5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomGoogleFontText(
                              text: 'Discount',
                              size: SizeConfig.width15,
                              color: Colors.black45,
                            ),
                            CustomGoogleFontText(
                              text: '${cartController.discount} $currency',
                              size: SizeConfig.width15,
                              color: Colors.black45,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: width * 0.050,
                            vertical: SizeConfig.height5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomGoogleFontText(
                              text: 'Sub Total',
                              size: SizeConfig.width15,
                              color: Colors.black45,
                            ),
                            CustomGoogleFontText(
                              text: '${cartController.subTotal} $currency',
                              size: SizeConfig.width15,
                              color: Colors.black45,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: width * 0.050,
                            vertical: SizeConfig.height5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomGoogleFontText(
                              text: 'VAT',
                              size: SizeConfig.width15,
                              color: Colors.black45,
                            ),
                            CustomGoogleFontText(
                              text: '${cartController.vat} $currency',
                              size: SizeConfig.width15,
                              color: Colors.black45,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.height10,
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: width * 0.050),
                        child: const Divider(
                          height: 3,
                          color: Colors.black,
                          thickness: 1,
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.height10,
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: width * 0.050),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Total (All inclusive)',
                              style: TextStyle(
                                  fontSize: SizeConfig.width15,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '${cartController.total} $currency',
                              style: TextStyle(
                                  fontSize: SizeConfig.width15,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.height10,
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: width * 0.050),
                        child: Row(
                          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.warning_amber,
                              size: SizeConfig.width16,
                            ),
                            SizedBox(
                              width: width * 0.010,
                            ),
                            Text(
                              'Duties may apply',
                              style: TextStyle(
                                  fontSize: SizeConfig.width12,
                                  color: Colors.black87),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.height15,
                      ),

                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                voucherCheck = !voucherCheck;
                              });
                            },
                            child: Container(
                              margin: EdgeInsets.only(left: SizeConfig.width20),
                              padding: EdgeInsets.all(SizeConfig.height5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: voucherCheck
                                    ? AppColors.primaryColor
                                    : Colors.grey.shade200,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: SizeConfig.height15,
                                    child: Image.asset(
                                      voucherCheck
                                          ? "images/voucherWhite.png"
                                          : "images/voucherBlack.png",
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  Text(
                                    '   Add voucher code',
                                    style: TextStyle(
                                      fontSize: SizeConfig.width12,
                                      color: voucherCheck
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      voucherCheck
                          ? SizedBox(
                              height: SizeConfig.height10,
                            )
                          : const SizedBox.shrink(),
                      voucherCheck
                          ? Container(
                              height: height * 0.060,
                              width: width * 0.75,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                border: Border.all(color: Colors.black54),
                              ),
                              child: TextFormField(
                                controller: voucherController,
                                decoration: InputDecoration(
                                    hintText: 'Enter voucher code',
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    hintStyle: const TextStyle(fontSize: 13),
                                    prefixIcon: Container(
                                      padding:
                                          EdgeInsets.all(SizeConfig.width10),
                                      height: SizeConfig.height15,
                                      width: SizeConfig.width15,
                                      child: Image.asset(
                                        "images/voucherBlack.png",
                                        fit: BoxFit.contain,
                                        height: SizeConfig.height15,
                                        width: SizeConfig.width15,
                                      ),
                                    ),
                                    suffixIcon: SizedBox(
                                      width: SizeConfig.width70,
                                      child: GestureDetector(
                                        onTap: () async {
                                          await cartController.ecomOrderCheck(
                                              coupon: voucherController.text
                                                  .trim());
                                        },
                                        child: const Align(
                                          alignment: Alignment.centerRight,
                                          child: Center(
                                            child: Text(
                                              'Verify',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.black54),
                                            ),
                                          ),
                                        ),
                                      ),
                                    )),
                              ),
                            )
                          : const SizedBox.shrink(),
                      SizedBox(
                        height: SizeConfig.height20,
                      ),
                      GestureDetector(
                        onTap: () async {
                          bool check = false;
                          // cartController.isLoading.value = false;
                          if (voucherController.text.trim().isNotEmpty) {
                            check = await cartController.ecomOrderMethod(
                                coupon: voucherController.text.trim());
                          } else {
                            check = await cartController.ecomOrderMethod();
                          }
                          if (check) {}
                        },
                        child: Container(
                            height: SizeConfig.height30,
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.only(
                                right: SizeConfig.width20,
                                left: SizeConfig.width20),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: AppColors.primaryColor),
                            child: Center(
                                child: Text(
                              'Place Order',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: SizeConfig.width16,
                              ),
                            ))),
                      ),
                      SizedBox(
                        height: SizeConfig.height20,
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
