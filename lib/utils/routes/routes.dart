import 'package:doorway/utils/routes/routes_name.dart';
import 'package:doorway/view/auth/accountCreation_success_screen.dart';
import 'package:doorway/view/auth/createAccountEmail_screen.dart';
import 'package:doorway/view/auth/createAccountPhone_screen.dart';
import 'package:doorway/view/auth/otp_verfication_screen.dart';
import 'package:doorway/view/auth/signinEmail_screen.dart';
import 'package:doorway/view/auth/signinPhone_screen.dart';
import 'package:doorway/view/handyman_pathway_services/googleMap_testing.dart/googlePlacesAPI_screen.dart';
import 'package:doorway/view/myBookings_screen.dart';
import 'package:doorway/view/categories_screen.dart';
import 'package:doorway/view/handyman_pathway_services/JobSchedule_view.dart';
import 'package:doorway/view/handyman_pathway_services/JobSummary_view.dart';
import 'package:doorway/view/handyman_pathway_services/ac_house_type_view.dart';
import 'package:doorway/view/handyman_pathway_services/handyMan_payment_view.dart';
import 'package:doorway/view/handyman_pathway_services/handyMan_view.dart';
import 'package:doorway/view/handyman_pathway_services/job_brands_repair_ep_view.dart';
import 'package:doorway/view/handyman_pathway_services/job_details_ac_view.dart';
import 'package:doorway/view/handyman_pathway_services/main_screen.dart';
import 'package:doorway/view/home_screen.dart';
import 'package:doorway/view/myAccount_screen.dart';
import 'package:doorway/view/myDetails_screen.dart';
import 'package:doorway/view/newPayment_screen.dart';
import 'package:doorway/view/orderDetails_screen.dart';
import 'package:doorway/view/picCode_verfication_screen.dart';
import 'package:doorway/view/reward_screen.dart';
import 'package:doorway/view/splash_screen.dart';
import 'package:flutter/material.dart';
import '../../view/handyman_pathway_services/JobDetailsOtherInfo_view.dart';
import '../../view/handyman_pathway_services/jobDetails__view.dart';
import '../../view/handyman_pathway_services/SavedAddresses_view.dart';
import '../../view/handyman_pathway_services/SelectLocation_view.dart';
import '../../view/handyman_pathway_services/VendorSelection_view.dart';
import '../../view/handyman_pathway_services/jobDetails_electrical_plumb_view.dart';
import '../../view/handyman_pathway_services/job_details_repair_ep_view.dart';
import '../../view/handyman_pathway_services/job_details_water_tank_view.dart';
import '../../view/handyman_pathway_services/maintenanceInfo_view.dart';
import '../../view/handyman_pathway_services/maintenance_view.dart';
import '../../view/handyman_pathway_services/other_info_repair_ep_view.dart';
import '../../view/handyman_pathway_services/schedule_repair_ep_view.dart';
import '../../view/handyman_pathway_services/summary_repair_ep_view.dart';
import '../../view/mainOnBoarding_screen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.splash_screen:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SplashScreen());

      case RoutesName.mainOnBoarding_screen:
        return MaterialPageRoute(
            builder: (BuildContext context) => const MainOnBoardingScreen());

      case RoutesName.abcd:
        return MaterialPageRoute(
            builder: (BuildContext context) => const GooglePlacesApiScreen());

      case RoutesName.signinEmail_screen:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SignInEmailScreen());

      case RoutesName.signinPhone_screen:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SignInPhoneScreen());

      case RoutesName.categories_screen:
        return MaterialPageRoute(
            builder: (BuildContext context) => const CategoriesScreen());

      case RoutesName.home_screen:
        return MaterialPageRoute(
            builder: (BuildContext context) => const HomeScreen());

      case RoutesName.myBookings_screen:
        return MaterialPageRoute(
            builder: (BuildContext context) => const MyBookingsScreen());

      case RoutesName.newPayment_screen:
        return MaterialPageRoute(
            builder: (BuildContext context) => const NewPaymentScreen());

      case RoutesName.reward_screen:
        return MaterialPageRoute(
            builder: (BuildContext context) => const RewardScreen());

      case RoutesName.ac_house_type_view:
        return MaterialPageRoute(
            builder: (BuildContext context) => const AcHouseType());

      case RoutesName.job_brands_repair_ep_view:
        return MaterialPageRoute(
            builder: (BuildContext context) => JobBrandsRepairEP());

      case RoutesName.myAccount_screen:
        return MaterialPageRoute(
            builder: (BuildContext context) => MyAccountScreen());

      case RoutesName.jobDetails_electrical_plumb_view:
        return MaterialPageRoute(
            builder: (BuildContext context) =>
                const JobDetailsElectricalPlumb());

      case RoutesName.job_details_ac_view:
        return MaterialPageRoute(
            builder: (BuildContext context) => JobDetailsAC());

      case RoutesName.job_details_repair_ep_view:
        return MaterialPageRoute(
            builder: (BuildContext context) => JobDetailsRepairEP());

      case RoutesName.job_details_water_tank_view:
        return MaterialPageRoute(
            builder: (BuildContext context) => JobDetailsWaterTank());

      case RoutesName.main_screen:
        return MaterialPageRoute(
            builder: (BuildContext context) => ServiceMain());

      case RoutesName.maintenanceInfo_view:
        return MaterialPageRoute(
            builder: (BuildContext context) => const MaintenanceInfo());

      case RoutesName.other_info_repair_ep_view:
        return MaterialPageRoute(
            builder: (BuildContext context) => const OtherInfoRepairEP());

      case RoutesName.schedule_repair_ep_view:
        return MaterialPageRoute(
            builder: (BuildContext context) => const ScheduleRepairEP());

      case RoutesName.SelectLocation_view:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SelectLocationScreen());

      case RoutesName.summary_repair_ep_view:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SummaryRepairEP());

      case RoutesName.VendorSelection_view:
        return MaterialPageRoute(
            builder: (BuildContext context) => const HandyManVendorSelection());

      case RoutesName.handyMan_view:
        ;
        return MaterialPageRoute(
            builder: (BuildContext context) => const HandyManScreen());

      case RoutesName.maintenance_view:
        return MaterialPageRoute(
            builder: (BuildContext context) =>
                const HandyManMaintenanceScreen());

      case RoutesName.accountCreation_success_screen:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SuccessScreen());

      case RoutesName.createAccountEmail_screen:
        return MaterialPageRoute(
            builder: (BuildContext context) => CreateAccountEmailScreen());

      case RoutesName.createAccountPhone_screen:
        return MaterialPageRoute(
            builder: (BuildContext context) => CreateAccountPhoneScreen());

      case RoutesName.jobDetails_view:
        return MaterialPageRoute(
            builder: (BuildContext context) => const HandyManJobDetails());

      case RoutesName.JobDetailsOtherInfo_view:
        return MaterialPageRoute(
            builder: (BuildContext context) => HandyManJobDetailsOtherInfo());

      case RoutesName.JobSchedule_view:
        return MaterialPageRoute(
            builder: (BuildContext context) => const HandyManJobSchedule());

      case RoutesName.JobSummary_view:
        return MaterialPageRoute(
            builder: (BuildContext context) => const HandyManJobSummary());

      case RoutesName.SavedAddresses_view:
        final arguments = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
            builder: (BuildContext context) => HandyManSavedAddresses(
                  wannaPlaceOrder: arguments['wannaPlaceOrder']!,
                ));

      case RoutesName.orderDetails_screen:
        final arguments = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
            builder: (BuildContext context) =>
                OrderDetailScreenPage(orderId: arguments['orderId']!));

      case RoutesName.pinCode_verification_screen:
        final arguments = settings.arguments as Map<String, dynamic>;
        final emailPhone = arguments['emailPhone']!;
        final isEmail = arguments['isEmail']!;
        final showSuccess = arguments['showSuccess']!;
        return MaterialPageRoute(
            builder: (BuildContext context) => PinCodeVerificationScreen(
                emailPhone: emailPhone,
                isEmail: isEmail,
                showSuccess: showSuccess));

      case RoutesName.handyMan_payment_view:
        final arguments = settings.arguments as Map<String, dynamic>;
        final summaryType = arguments['summaryType']!;
        return MaterialPageRoute(
            builder: (BuildContext context) => HandyManPayment(
                  summaryType: summaryType,
                ));

      case RoutesName.myDetails_screen:
        return MaterialPageRoute(
            builder: (BuildContext context) => const ShopMyDetailsScreen());

      case RoutesName.otp_verification_screen:
        final arguments = settings.arguments as Map<String, dynamic>;
        final emailPhone = arguments['emailPhone']!;
        final isEmail = arguments['isEmail']!;
        return MaterialPageRoute(
            builder: (BuildContext context) => OtpVerificationScreen(
                  emailPhone: emailPhone,
                  isEmail: isEmail,
                ));

      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(
              child: Text('No Route defined'),
            ),
          );
        });
    }
  }
}
