import 'package:get/get.dart';

import 'package:eradah/app/modules/acount/bindings/acount_binding.dart';
import 'package:eradah/app/modules/acount/views/acount_view.dart';
import 'package:eradah/app/modules/activities/bindings/activities_binding.dart';
import 'package:eradah/app/modules/activities/views/activites_list_video_view.dart';
import 'package:eradah/app/modules/activities/views/activities_view.dart';
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
import 'package:eradah/app/modules/category/bindings/category_binding.dart';
import 'package:eradah/app/modules/category/views/category_detailes_view.dart';
import 'package:eradah/app/modules/category/views/category_view.dart';
import 'package:eradah/app/modules/home/bindings/home_binding.dart';
import 'package:eradah/app/modules/home/views/home_view.dart';
import 'package:eradah/app/modules/levels/bindings/levels_binding.dart';
import 'package:eradah/app/modules/levels/detail/bindings/levels_detail_binding.dart';
import 'package:eradah/app/modules/levels/detail/views/levels_detail_view.dart';
import 'package:eradah/app/modules/levels/list/bindings/levels_list_binding.dart';
import 'package:eradah/app/modules/levels/list/views/levels_list_view.dart';
import 'package:eradah/app/modules/levels/views/levels_detaile_view.dart';
import 'package:eradah/app/modules/levels/views/levels_view.dart';
import 'package:eradah/app/modules/notifaction/bindings/notifaction_binding.dart';
import 'package:eradah/app/modules/notifaction/views/notifaction_view.dart';
import 'package:eradah/app/modules/plan/detail/bindings/plan_detail_binding.dart';
import 'package:eradah/app/modules/plan/detail/views/plan_detail_view.dart';
import 'package:eradah/app/modules/plan/list/bindings/plan_list_binding.dart';
import 'package:eradah/app/modules/plan/list/views/plan_list_view.dart';
import 'package:eradah/app/modules/setting/bindings/setting_binding.dart';
import 'package:eradah/app/modules/setting/views/setting_view.dart';
import 'package:eradah/app/modules/subscription/bindings/subscription_binding.dart';
import 'package:eradah/app/modules/subscription/views/subscription_view.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.SplashView;

  static final routes = [
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
      name: Routes.ACTIVITIES,
      page: () => ActivitiesView(),
      binding: ActivitiesBinding(),
    ),
    GetPage(
      name: Routes.ActivitesListVideoView,
      page: () => ActivitesListVideoView(),
      binding: ActivitiesBinding(),
    ),
    GetPage(
      name: Routes.LevelsDetaileView,
      page: () => LevelsDetaileView(),
      binding: LevelsBinding(),
    ),
    GetPage(
      name: Routes.LEVELS,
      page: () => LevelsView(),
      binding: LevelsBinding(),
    ),
    GetPage(
      name: Routes.ACOUNT,
      page: () => AcountView(),
      binding: AcountBinding(),
    ),
    GetPage(
      name: Routes.CATEGORY,
      page: () => CategoryView(),
      binding: CategoryBinding(),
    ),
    GetPage(
      name: Routes.CategoryDetailesView,
      page: () => CategoryDetailesView(),
      binding: CategoryBinding(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => HomeView(),
      binding: CategoryBinding(),
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
      name: Routes.SETTING,
      page: () => SettingView(),
      binding: SettingBinding(),
    ),
    GetPage(
      name: Routes.NOTIFACTION,
      page: () => NotifactionView(),
      binding: NotifactionBinding(),
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
  ];
}
