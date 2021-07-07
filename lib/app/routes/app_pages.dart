import 'package:get/get.dart';

import 'package:eradah/app/modules/acount/bindings/acount_binding.dart';
import 'package:eradah/app/modules/acount/views/acount_view.dart';
import 'package:eradah/app/modules/activities/detail/bindings/activities_detail_binding.dart';
import 'package:eradah/app/modules/activities/detail/views/activities_detail_view.dart';
import 'package:eradah/app/modules/activities/list/bindings/activities_list_binding.dart';
import 'package:eradah/app/modules/activities/list/views/activities_list_view.dart';
import 'package:eradah/app/modules/authiocation/bindings/authiocation_binding.dart';
import 'package:eradah/app/modules/authiocation/views/authiocation_view.dart';
import 'package:eradah/app/modules/authiocation/views/forgetpassword_view.dart';
import 'package:eradah/app/modules/authiocation/views/intro_view.dart';
import 'package:eradah/app/modules/authiocation/views/profile_create_view.dart';
import 'package:eradah/app/modules/authiocation/views/profile_kids_motor_view.dart';
import 'package:eradah/app/modules/authiocation/views/profile_kids_view.dart';
import 'package:eradah/app/modules/authiocation/views/profile_user_view.dart';
import 'package:eradah/app/modules/authiocation/views/signin_view.dart';
import 'package:eradah/app/modules/authiocation/views/signup_view.dart';
import 'package:eradah/app/modules/authiocation/views/splash_view.dart';
import 'package:eradah/app/modules/home/bindings/home_binding.dart';
import 'package:eradah/app/modules/home/views/home_view.dart';
import 'package:eradah/app/modules/levels/detail/bindings/levels_detail_binding.dart';
import 'package:eradah/app/modules/levels/detail/views/levels_detail_view.dart';
import 'package:eradah/app/modules/levels/list/bindings/levels_list_binding.dart';
import 'package:eradah/app/modules/levels/list/views/levels_list_view.dart';
import 'package:eradah/app/modules/plan/list/bindings/plan_list_binding.dart';
import 'package:eradah/app/modules/plan/list/views/plan_list_view.dart';
import 'package:eradah/app/modules/subscripation_page/bindings/subscripation_page_binding.dart';
import 'package:eradah/app/modules/subscripation_page/views/subscripation_page_view.dart';
import 'package:eradah/app/modules/subscription/bindings/subscription_binding.dart';
import 'package:eradah/app/modules/subscription/views/subscription_view.dart';
import 'package:eradah/app/modules/trial/bindings/trial_binding.dart';
import 'package:eradah/app/modules/trial/views/trial_view.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.SplashView;

  static final routes = [
    GetPage(
      name: Routes.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.AUTHIOCATION,
      page: () => AuthiocationView(),
      binding: AuthiocationBinding(),
    ),
    GetPage(
      name: Routes.SplashView,
      page: () => SplashView(),
      binding: AuthiocationBinding(),
    ),
    GetPage(
      name: Routes.IntroView,
      page: () => IntroView(),
      binding: AuthiocationBinding(),
    ),
    GetPage(
      name: Routes.SigninView,
      page: () => SigninView(),
      binding: AuthiocationBinding(),
    ),
    GetPage(
      name: Routes.ProfileUserView,
      page: () => ProfileUserView(),
      binding: AuthiocationBinding(),
    ),
    GetPage(
      name: Routes.ProfileKidsView,
      page: () => ProfileKidsView(),
      binding: AuthiocationBinding(),
    ),
    GetPage(
      name: Routes.ProfileCreateView,
      page: () => ProfileCreateView(),
      binding: AuthiocationBinding(),
    ),
    GetPage(
      name: Routes.ACOUNT,
      page: () => AcountView(),
      binding: AcountBinding(),
    ),
    GetPage(
      name: Routes.ForgetpasswordView,
      page: () => ForgetpasswordView(),
      binding: AuthiocationBinding(),
    ),
    GetPage(
      name: Routes.SignupView,
      page: () => SignupView(),
      binding: AuthiocationBinding(),
    ),
    GetPage(
      name: Routes.ProfilekidsMotorView,
      page: () => ProfilekidsMotorView(),
      binding: AuthiocationBinding(),
    ),
    GetPage(
      name: Routes.SUBSCRIPTION,
      page: () => SubscriptionView(),
      binding: SubscriptionBinding(),
    ),
    GetPage(
      name: Routes.PLAN_LIST,
      page: () => PlanListView(),
      binding: PlanListBinding(),
    ),
    GetPage(
      name: Routes.LEVELS_LIST,
      page: () => LevelsListView(),
      binding: LevelsListBinding(),
    ),
    GetPage(
      name: Routes.LEVELS_DETAIL,
      page: () => LevelsDetailView(),
      binding: LevelsDetailBinding(),
    ),
    GetPage(
      name: Routes.ACTIVITIES_LIST,
      page: () => ActivitiesListView(),
      binding: ActivitiesListBinding(),
    ),
    GetPage(
      name: Routes.ACTIVITIES_DETAIL,
      page: () => ActivitiesDetailView(),
      binding: ActivitiesDetailBinding(),
    ),
    GetPage(
      name: Routes.TRIAL,
      page: () => TrialView(),
      binding: TrialBinding(),
    ),
    GetPage(
      name: Routes.SUBSCRIPATION_PAGE,
      page: () => SubscripationPageView(),
      binding: SubscripationPageBinding(),
    ),
  ];
}
