class AppUrl {
  //static var baseUrl = 'https://reqres.in';
  static var loginEndPoint = baseUrl + emailSignUp;
  static var registerApiEndPoint = baseUrl + '/api/register';

  static String baseUrl = "https://doorway.logic-valley.com/api/";
  // static String baseUrl = "https://mosoda.logic-valley.com/api/";
  static String apiKey = "HY3hAgMk3IMktRDhOHYdZXSk3anBk3UR";
  static String placesApiKey = "AIzaSyAo1tx_kum39FZGBE1lbe1xvl2HdiQKrGI";

  static String requestOtp = "user/request-otp";
  static String verifyOtp = "user/verify-otp";

  static String userLocationListing = "user/listing-location";
  static String createUserLocation = "user/create-location";
  static String setDefaultLocation = "user/default-location";
  static String updateLocation = "user/update-location";
  static String deleteLocation = "user/delete-location";

  static String categoriesListing = "categories/listing";
  static String subCategoriesListing = "subcategories/listing";
  static String subCategoriesByVendor = "vendors/subcategories_of_category";

  static String vendorsListingByCategories = "vendors/listing_by_categories";
  static String vendorsListingBySubCat = "vendors/listing_by_sub_categories";
  static String vendorsListingByService = "vendors/listing_by_services";
  static String vendorsListingAll = "vendors/listing";

  static String vendorsTimings = 'vendors/timings-by-date';
  static String vendorDetails = '/vendors/details';

  static String servicesListing = "services/listing";
  static String servicesByVendorSubCat = "vendors/services_of_sub_category";

  static String subServicesByVendorService = "vendors/sub_services_of_service";

  static String orders = "user/orders";

  static String products = 'products/listing';

  static String servicesHome = 'home/home-listing';

  static String notificationListing = "notification/listing";
  static String userTokenExpire = 'user/token-expire';
  static String emailSignIn = 'user/email-signup-signin';
  static String homeListingUrl = 'classified/home-listing';
  static String subCategoriesFromVendorString =
      "vendors/subcategories_of_category";
  static String servicesFromSubCategoryVendorString =
      "vendors/services_of_sub_category";
  static String homeItemsString = "home/home-items";
  static String orderAPIString = "user/orders";
  static String subServicesFromServicesString =
      "vendors/sub_services_of_service";
  static String subCategoriesFromCategoryString = "subcategories/listing";
  static String servicesFromSubCategoryString = "services/listing";
  static String vendorListingString = "vendors/listing_by_sub_categories";
  static String vendorProductsBySubCategoriesString = "products/listing";
  static String occasionTypesString = "home/occasion-types";
  static String orderCheckString = "user/order-check";

  //......................TODO APIs URLs............................//
  static String toDoListingString = "todo/listing";
  static String toDoCreateString = "todo/create";
  static String toDoDeleteString = "todo/delete";
  static String toDoUpdateString = "todo/update";

  //....................................................................//

  static String ecomOrderUrl = 'ecom/user/order';
  static String ecomNotificationDetailUrl = 'notification/details';
  static String ecomOrderCheckUrl = "ecom/user/order-check";
  static String ecomCheckCouponValidityUrl = "ecom/user/check-coupon-validity";
  static String ecomrewardListingUrl = 'rewards/rewards-listing';
  static String ecomUserRewardListingUrl = 'user/user-rewards-listing';
  static String ecomuserOrderDetailsUrl = 'user/order-details';
  static String ecomUserOrderListingLiveUrl = 'user/order-listing';
  static String ecomUserOrderListinghistoryUrl = 'user/order-listing';
  static String userDetailsString = "user/user-details";
  static String updateUserString = "user/update-user";
  static String appImprovementString = "user/app-improvement";
  static String faqTopicsString = "app/faq-topics";
  static String imageUploadString = "user/upload-photo";
  static String appPageListingString = "app-page/listing";
  static String contactInfoString = "contacts";
  static String submitQueryString = "user/submit-queries";

  //...............User Update Date URLs............................//

  static String updateEmailUrl = 'user/update-email';
  static String verifyEmailOtpUrl = 'user/verify-email-otp';
  static String updatePhoneUrl = 'user/update-phone';
  static String verifyPhoneOtpUrl = 'user/verify-phone-otp';
  static String confirmPasswordUrl = 'user/confirm-password';
  static String verifyOldPhoneUrl = 'user/verify-old-phone';
  static String verifyOldPhoneOTPUrl = 'user/verify-old-phone-otp';
  static String couponsListingUrl = 'user/coupons';
  static String checkCouponsValidityUrl = 'user/check-coupon-validity';

//.........................User Credential APIs URLs......................//

  static String emailSignUp = "user/email-signup";
  static String phoneSignUp = "user/phone-signup";
  static String signUpVerifyOTP = "user/verify-otp";
  static String emailLogin = "user/login-email";
  static String phoneLoginOTP = "user/phone-otp";
  static String phoneLogin = "user/login-phone";
  static String logout = "user/token-expire";
  static String checkToken = "user/token-validate";

//.........................Order Confirm......................//

  static String sodOderConfirm = "user/confirm-order";
  static String ecomOderConfirm = "ecom/user/confirm-order";
  static String caOderConfirm = "classified/user/featured-add";
}
