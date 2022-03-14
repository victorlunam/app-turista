import 'package:appturista/components/media_picker/album_page_view.dart';
import 'package:appturista/models/user.dart';
import 'package:appturista/pages/about.dart';
import 'package:appturista/pages/camera.dart';
import 'package:appturista/pages/camera_view.dart';
import 'package:appturista/pages/chat.dart';
import 'package:appturista/pages/comments.dart';
import 'package:appturista/pages/home.dart';
import 'package:appturista/pages/likes.dart';
import 'package:appturista/pages/moment_create.dart';
import 'package:appturista/pages/moment_visibility.dart';
import 'package:appturista/pages/notifications.dart';
import 'package:appturista/pages/notifications_liked.dart';
import 'package:appturista/pages/profile.dart';
import 'package:appturista/pages/profile_edit.dart';
import 'package:appturista/pages/profile_followers_and_followings.dart';
import 'package:appturista/pages/profile_moments_full.dart';
import 'package:appturista/pages/profile_reels_full.dart';
import 'package:appturista/pages/profile_settings_account_data.dart';
import 'package:appturista/pages/profile_settings_personal_information.dart';
import 'package:appturista/pages/recover.dart';
import 'package:appturista/pages/recover_enter_code.dart';
import 'package:appturista/pages/recover_shipping_notification.dart';
import 'package:appturista/pages/profile_settings.dart';
import 'package:appturista/pages/search.dart';
import 'package:appturista/pages/search_hashtag.dart';
import 'package:appturista/pages/search_location.dart';
import 'package:appturista/pages/search_view.dart';
import 'package:appturista/pages/settings_frequent_questions.dart';
import 'package:appturista/pages/settings_notifications.dart';
import 'package:appturista/pages/sign_in.dart';
import 'package:appturista/pages/sign_up.dart';
import 'package:appturista/pages/sign_up_data.dart';
import 'package:appturista/pages/sign_up_preferences.dart';
import 'package:appturista/pages/recover_update_password.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:appturista/pages/root.dart';
import 'package:provider/provider.dart';

import 'components/media_picker/photo_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(const MyApp());
}

PhotoProvider providerValue = PhotoProvider();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: providerValue,
      child: MaterialApp(
        title: 'App Turista',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.green,
          scaffoldBackgroundColor: Colors.white,
          dividerColor: const Color(0xFF939393),
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
            iconTheme: IconThemeData(
              color: Colors.black,
            ),
            elevation: 0,
            titleTextStyle: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 20,
            ),
          ),
          fontFamily: 'Proxima Nova',
          textTheme: const TextTheme(
            subtitle1: TextStyle(
              color: Color(0xFF222423),
              fontWeight: FontWeight.w600,
            ),
            subtitle2: TextStyle(
              color: Color(0xFF939393),
            ),
          ),
        ),
        initialRoute: '/',
        onGenerateRoute: (settings) {
          var routes = <String, WidgetBuilder>{
            '/': (context) => const RootPage(),
            '/signIn': (context) => const SignInPage(),
            '/signUp': (context) => const SignUpPage(),
            '/signUp/data': (context) => const SignUpDataPage(),
            '/signUp/preferences': (context) => const SignUpPreferencesPage(),
            '/recover': (context) => const RecoverPage(),
            '/recover/shippingNotification': (context) =>
                const RecoverShippingNotificationPage(),
            '/recover/enterCode': (context) => const RecoverEnterCode(),
            '/recover/updatePassword': (context) =>
                const RecoverUpdatePasswordPage(),
            '/home': (context) {
              final arg = settings.arguments;
              return HomePage(indexBottom: arg as int);
            },
            '/search': (context) => const SearchPage(),
            '/search/view': (context) {
              final title = settings.arguments;
              return SearchViewPage(title: title as String);
            },
            '/search/hashtag': (context) => const SearchHashtagPage(),
            '/search/location': (context) => const SearchLocationPage(),
            '/notifications': (context) => const NotificationsPage(),
            '/notifications/liked': (context) => const NotificationsLikedPage(),
            '/comments': (context) => const CommentsPage(),
            '/likes': (context) => const LikesPage(),
            '/chat': (context) {
              final user = settings.arguments;
              return ChatPage(user as User);
            },
            '/profile': (context) {
              final args = settings.arguments;
              return ProfilePage(
                isOwner: (args as ProfilePageArguments).isOwner,
              );
            },
            '/profile/edit': (context) {
              final user = settings.arguments;
              return ProfileEdit(user: user as User);
            },
            '/profile/settings': (context) => const ProfileSettingsPage(),
            '/profile/settings/accountData': (context) =>
                const ProfileSettingsAccountData(),
            '/profile/settings/personalInformation': (context) =>
                const ProfileSettingsPersonalInformation(),
            '/profile/followersAndFollowings': (context) {
              final indexTab = settings.arguments;
              return ProfileFollowersAndFollowingsPage(
                  indexTab: indexTab as int);
            },
            '/profile/view/moments': (context) => const ProfileMomentsFull(),
            '/profile/view/reels': (context) => const ProfileReelsFull(),
            '/about': (context) => const AboutPage(),
            '/settings/frequentQuestions': (context) =>
                const SettingsFrequentQuestionsPage(),
            '/settings/notifications': (context) =>
                const SettingsNotificationsPage(),
            '/camera': (context) => const CameraPage(),
            '/camera/view': (context) {
              final path = settings.arguments;
              return CameraViewPage(path: path as String);
            },
            '/picker': (context) => const AlbumPageView(),
            '/moment/create': (context) {
              final path = settings.arguments;
              return MomentCreate(path: path as String);
            },
            '/moment/visibility': (context) => const MomentVisibilityPage(),
          };
          WidgetBuilder? builder = routes[settings.name];
          return MaterialPageRoute(builder: (ctx) => builder!(ctx));
        },
      ),
    );
  }
}
