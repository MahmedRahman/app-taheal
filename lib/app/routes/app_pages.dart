import 'package:eradah/app/modules/activities/views/activites_list_video_view.dart';
import 'package:eradah/app/modules/authiocation/views/forgetpassword_view.dart';
import 'package:eradah/app/modules/authiocation/views/profile_kids_motor_view.dart';
import 'package:eradah/app/modules/authiocation/views/signup_view.dart';
import 'package:eradah/app/modules/category/views/category_detailes_view.dart';
import 'package:eradah/app/modules/category/views/category_view.dart';
import 'package:eradah/app/modules/category/bindings/category_binding.dart';
import 'package:eradah/app/modules/acount/views/acount_view.dart';
import 'package:eradah/app/modules/acount/bindings/acount_binding.dart';
import 'package:eradah/app/modules/levels/views/levels_view.dart';
import 'package:eradah/app/modules/levels/bindings/levels_binding.dart';
import 'package:eradah/app/modules/plan/views/plan_video_detailes_view.dart';
import 'package:eradah/app/modules/plan/views/plan_view.dart';
import 'package:eradah/app/modules/plan/bindings/plan_binding.dart';
import 'package:eradah/app/modules/activities/views/activities_view.dart';
import 'package:eradah/app/modules/activities/bindings/activities_binding.dart';
import 'package:eradah/app/modules/authiocation/views/authiocation_view.dart';
import 'package:eradah/app/modules/authiocation/bindings/authiocation_binding.dart';
import 'package:eradah/app/modules/authiocation/views/intro_view.dart';
import 'package:eradah/app/modules/authiocation/views/profile_create_view.dart';
import 'package:eradah/app/modules/authiocation/views/profile_kids_view.dart';
import 'package:eradah/app/modules/authiocation/views/profile_user_view.dart';
import 'package:eradah/app/modules/authiocation/views/signin_view.dart';
import 'package:eradah/app/modules/authiocation/views/splash_view.dart';
import 'package:eradah/app/modules/home/views/home_view.dart';
import 'package:eradah/app/modules/home/bindings/home_binding.dart';
import 'package:get/get.dart';
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
      name: Routes.PLAN,
      page: () => PlanView(),
      binding: PlanBinding(),
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
      name: Routes.PlanVideoDetailesView,
      page: () => PlanVideoDetailesView(),
      binding: AuthiocationBinding(),
    ),
  ];
}
