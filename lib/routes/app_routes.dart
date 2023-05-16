import 'package:onjobb/presentation/splash_screen/splash_screen.dart';
import 'package:onjobb/presentation/splash_screen/binding/splash_binding.dart';
import 'package:onjobb/presentation/onboarding_one_screen/onboarding_one_screen.dart';
import 'package:onjobb/presentation/onboarding_one_screen/binding/onboarding_one_binding.dart';
import 'package:onjobb/presentation/onboarding_two_screen/onboarding_two_screen.dart';
import 'package:onjobb/presentation/onboarding_two_screen/binding/onboarding_two_binding.dart';
import 'package:onjobb/presentation/onboarding_three_screen/onboarding_three_screen.dart';
import 'package:onjobb/presentation/onboarding_three_screen/binding/onboarding_three_binding.dart';
import 'package:onjobb/presentation/sign_up_create_acount_screen/sign_up_create_acount_screen.dart';
import 'package:onjobb/presentation/sign_up_create_acount_screen/binding/sign_up_create_acount_binding.dart';
import 'package:onjobb/presentation/sign_up_complete_account_screen/sign_up_complete_account_screen.dart';
import 'package:onjobb/presentation/sign_up_complete_account_screen/binding/sign_up_complete_account_binding.dart';
import 'package:onjobb/presentation/job_type_screen/job_type_screen.dart';
import 'package:onjobb/presentation/job_type_screen/binding/job_type_binding.dart';
import 'package:onjobb/presentation/speciallization_screen/speciallization_screen.dart';
import 'package:onjobb/presentation/speciallization_screen/binding/speciallization_binding.dart';
import 'package:onjobb/presentation/select_a_country_screen/select_a_country_screen.dart';
import 'package:onjobb/presentation/select_a_country_screen/binding/select_a_country_binding.dart';
import 'package:onjobb/presentation/login_screen/login_screen.dart';
import 'package:onjobb/presentation/login_screen/binding/login_binding.dart';
import 'package:onjobb/presentation/enter_otp_screen/enter_otp_screen.dart';
import 'package:onjobb/presentation/enter_otp_screen/binding/enter_otp_binding.dart';
import 'package:onjobb/presentation/home_container_screen/home_container_screen.dart';
import 'package:onjobb/presentation/home_container_screen/binding/home_container_binding.dart';
import 'package:onjobb/presentation/search_screen/search_screen.dart';
import 'package:onjobb/presentation/search_screen/binding/search_binding.dart';
import 'package:onjobb/presentation/job_details_screen/job_details_screen.dart';
import 'package:onjobb/presentation/job_details_screen/binding/job_details_binding.dart';
import 'package:onjobb/presentation/message_action_screen/message_action_screen.dart';
import 'package:onjobb/presentation/message_action_screen/binding/message_action_binding.dart';
import 'package:onjobb/presentation/chat_screen/chat_screen.dart';
import 'package:onjobb/presentation/chat_screen/binding/chat_binding.dart';
import 'package:onjobb/presentation/saved_detail_job_screen/saved_detail_job_screen.dart';
import 'package:onjobb/presentation/saved_detail_job_screen/binding/saved_detail_job_binding.dart';
import 'package:onjobb/presentation/apply_job_screen/apply_job_screen.dart';
import 'package:onjobb/presentation/apply_job_screen/binding/apply_job_binding.dart';
import 'package:onjobb/presentation/applied_job_screen/applied_job_screen.dart';
import 'package:onjobb/presentation/applied_job_screen/binding/applied_job_binding.dart';
import 'package:onjobb/presentation/notifications_general_screen/notifications_general_screen.dart';
import 'package:onjobb/presentation/notifications_general_screen/binding/notifications_general_binding.dart';
import 'package:onjobb/presentation/notifications_my_proposals_screen/notifications_my_proposals_screen.dart';
import 'package:onjobb/presentation/notifications_my_proposals_screen/binding/notifications_my_proposals_binding.dart';
import 'package:onjobb/presentation/settings_screen/settings_screen.dart';
import 'package:onjobb/presentation/settings_screen/binding/settings_binding.dart';
import 'package:onjobb/presentation/personal_info_screen/personal_info_screen.dart';
import 'package:onjobb/presentation/personal_info_screen/binding/personal_info_binding.dart';
import 'package:onjobb/presentation/experience_setting_screen/experience_setting_screen.dart';
import 'package:onjobb/presentation/experience_setting_screen/binding/experience_setting_binding.dart';
import 'package:onjobb/presentation/new_position_screen/new_position_screen.dart';
import 'package:onjobb/presentation/new_position_screen/binding/new_position_binding.dart';
import 'package:onjobb/presentation/add_new_education_screen/add_new_education_screen.dart';
import 'package:onjobb/presentation/add_new_education_screen/binding/add_new_education_binding.dart';
import 'package:onjobb/presentation/privacy_screen/privacy_screen.dart';
import 'package:onjobb/presentation/privacy_screen/binding/privacy_binding.dart';
import 'package:onjobb/presentation/language_screen/language_screen.dart';
import 'package:onjobb/presentation/language_screen/binding/language_binding.dart';
import 'package:onjobb/presentation/notifications_screen/notifications_screen.dart';
import 'package:onjobb/presentation/notifications_screen/binding/notifications_binding.dart';
import 'package:onjobb/presentation/app_navigation_screen/app_navigation_screen.dart';
import 'package:onjobb/presentation/app_navigation_screen/binding/app_navigation_binding.dart';
import 'package:get/get.dart';

import '../presentation/publish_job_screen/binding/publish_job_binding.dart';
import '../presentation/publish_job_screen/publish_job_screen.dart';

class AppRoutes {
  static const String splashScreen = '/splash_screen';

  static const String onboardingOneScreen = '/onboarding_one_screen';

  static const String onboardingTwoScreen = '/onboarding_two_screen';

  static const String onboardingThreeScreen = '/onboarding_three_screen';

  static const String signUpCreateAcountScreen =
      '/sign_up_create_acount_screen';

  static const String signUpCompleteAccountScreen =
      '/sign_up_complete_account_screen';

  static const String jobTypeScreen = '/job_type_screen';


  static const String speciallizationScreen = '/speciallization_screen';

  static const String selectACountryScreen = '/select_a_country_screen';

  static const String loginScreen = '/login_screen';

  static const String enterOtpScreen = '/enter_otp_screen';

  static const String homePage = '/home_page';

  static const String homeContainerScreen = '/home_container_screen';

  static const String searchScreen = '/search_screen';

  static const String jobDetailsScreen = '/job_details_screen';

  static const String messagePage = '/message_page';

  static const String messageActionScreen = '/message_action_screen';

  static const String chatScreen = '/chat_screen';

  static const String savedPage = '/saved_page';

  static const String savedDetailJobScreen = '/saved_detail_job_screen';

  static const String applyJobScreen = '/apply_job_screen';

  static const String appliedJobScreen = '/applied_job_screen';

  static const String publishJobScreen = '/publish_job_screen';

  static const String notificationsGeneralScreen =
      '/notifications_general_screen';

  static const String notificationsMyProposalsScreen =
      '/notifications_my_proposals_screen';

  static const String profilePage = '/profile_page';

  static const String settingsScreen = '/settings_screen';

  static const String personalInfoScreen = '/personal_info_screen';

  static const String experienceSettingScreen = '/experience_setting_screen';

  static const String newPositionScreen = '/new_position_screen';

  static const String addNewEducationScreen = '/add_new_education_screen';

  static const String privacyScreen = '/privacy_screen';

  static const String languageScreen = '/language_screen';

  static const String notificationsScreen = '/notifications_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static const String initialRoute = '/initialRoute';

  static List<GetPage> pages = [
    GetPage(
      name: splashScreen,
      page: () => SplashScreen(),
      bindings: [
        SplashBinding(),
      ],
    ),
    GetPage(
      name: onboardingOneScreen,
      page: () => OnboardingOneScreen(),
      bindings: [
        OnboardingOneBinding(),
      ],
    ),
    GetPage(
      name: onboardingTwoScreen,
      page: () => OnboardingTwoScreen(),
      bindings: [
        OnboardingTwoBinding(),
      ],
    ),
    GetPage(
      name: onboardingThreeScreen,
      page: () => OnboardingThreeScreen(),
      bindings: [
        OnboardingThreeBinding(),
      ],
    ),
    GetPage(
      name: signUpCreateAcountScreen,
      page: () => SignUpCreateAcountScreen(),
      bindings: [
        SignUpCreateAcountBinding(),
      ],
    ),
    GetPage(
      name: signUpCompleteAccountScreen,
      page: () => SignUpCompleteAccountScreen(),
      bindings: [
        SignUpCompleteAccountBinding(),
      ],
    ),
    GetPage(
      name: jobTypeScreen,
      page: () => JobTypeScreen(),
      bindings: [
        JobTypeBinding(),
      ],
    ),
    GetPage(
      name: speciallizationScreen,
      page: () => SpeciallizationScreen(),
      bindings: [
        SpeciallizationBinding(),
      ],
    ),
    GetPage(
      name: selectACountryScreen,
      page: () => SelectACountryScreen(),
      bindings: [
        SelectACountryBinding(),
      ],
    ),
    GetPage(
      name: loginScreen,
      page: () => LoginScreen(),
      bindings: [
        LoginBinding(),
      ],
    ),
    GetPage(
      name: enterOtpScreen,
      page: () => EnterOtpScreen(),
      bindings: [
        EnterOtpBinding(),
      ],
    ),
    GetPage(
      name: homeContainerScreen,
      page: () => HomeContainerScreen(),
      bindings: [
        HomeContainerBinding(),
      ],
    ),
    GetPage(
      name: searchScreen,
      page: () => SearchScreen(),
      bindings: [
        SearchBinding(),
      ],
    ),
    GetPage(
      name: jobDetailsScreen,
      page: () => JobDetailsScreen(),
      bindings: [
        JobDetailsBinding(),
      ],
    ),
    GetPage(
      name: messageActionScreen,
      page: () => MessageActionScreen(),
      bindings: [
        MessageActionBinding(),
      ],
    ),
    GetPage(
      name: chatScreen,
      page: () => ChatScreen(),
      bindings: [
        ChatBinding(),
      ],
    ),
    GetPage(
      name: savedDetailJobScreen,
      page: () => SavedDetailJobScreen(),
      bindings: [
        SavedDetailJobBinding(),
      ],
    ),
    GetPage(
      name: applyJobScreen,
      page: () => ApplyJobScreen(),
      bindings: [
        ApplyJobBinding(),
      ],
    ),
    GetPage(
      name: appliedJobScreen,
      page: () => AppliedJobScreen(),
      bindings: [
        AppliedJobBinding(),
      ],
    ),
    GetPage(
      name: publishJobScreen,
      page: () => PublishJobScreen(),
      bindings: [
        PublishJobBinding(),
      ],
    ),
    GetPage(
      name: notificationsGeneralScreen,
      page: () => NotificationsGeneralScreen(),
      bindings: [
        NotificationsGeneralBinding(),
      ],
    ),
    GetPage(
      name: notificationsMyProposalsScreen,
      page: () => NotificationsMyProposalsScreen(),
      bindings: [
        NotificationsMyProposalsBinding(),
      ],
    ),
    GetPage(
      name: settingsScreen,
      page: () => SettingsScreen(),
      bindings: [
        SettingsBinding(),
      ],
    ),
    GetPage(
      name: personalInfoScreen,
      page: () => PersonalInfoScreen(),
      bindings: [
        PersonalInfoBinding(),
      ],
    ),
    GetPage(
      name: experienceSettingScreen,
      page: () => ExperienceSettingScreen(),
      bindings: [
        ExperienceSettingBinding(),
      ],
    ),
    GetPage(
      name: newPositionScreen,
      page: () => NewPositionScreen(),
      bindings: [
        NewPositionBinding(),
      ],
    ),
    GetPage(
      name: addNewEducationScreen,
      page: () => AddNewEducationScreen(),
      bindings: [
        AddNewEducationBinding(),
      ],
    ),
    GetPage(
      name: privacyScreen,
      page: () => PrivacyScreen(),
      bindings: [
        PrivacyBinding(),
      ],
    ),
    GetPage(
      name: languageScreen,
      page: () => LanguageScreen(),
      bindings: [
        LanguageBinding(),
      ],
    ),
    GetPage(
      name: notificationsScreen,
      page: () => NotificationsScreen(),
      bindings: [
        NotificationsBinding(),
      ],
    ),
    GetPage(
      name: appNavigationScreen,
      page: () => AppNavigationScreen(),
      bindings: [
        AppNavigationBinding(),
      ],
    ),
    GetPage(
      name: initialRoute,
      page: () => SplashScreen(),
      bindings: [
        SplashBinding(),
      ],
    )
  ];
}
