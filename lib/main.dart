import 'package:appturista/presentation/home/moments.dart';
import 'package:appturista/presentation/widgets/media_picker/album_page_view.dart';
import 'package:appturista/models/user.dart';
import 'package:appturista/presentation/about.dart';
import 'package:appturista/presentation/camera/camera.dart';
import 'package:appturista/presentation/camera/camera_view.dart';
import 'package:appturista/presentation/chat.dart';
import 'package:appturista/presentation/comments.dart';
import 'package:appturista/presentation/home/page.dart';
import 'package:appturista/presentation/likes.dart';
import 'package:appturista/presentation/moment/moment_create.dart';
import 'package:appturista/presentation/moment/moment_visibility.dart';
import 'package:appturista/presentation/notifications.dart';
import 'package:appturista/presentation/notifications_liked.dart';
import 'package:appturista/presentation/profile/page.dart';
import 'package:appturista/presentation/profile/profile_edit.dart';
import 'package:appturista/presentation/profile/profile_followers_and_followings.dart';
import 'package:appturista/presentation/profile/profile_moments_full.dart';
import 'package:appturista/presentation/profile/profile_reels_full.dart';
import 'package:appturista/presentation/profile/profile_settings_account_data.dart';
import 'package:appturista/presentation/profile/profile_settings_personal_information.dart';
import 'package:appturista/presentation/profile/profile_settings.dart';
import 'package:appturista/presentation/recover/page.dart';
import 'package:appturista/presentation/recover/recover_enter_code.dart';
import 'package:appturista/presentation/recover/recover_shipping_notification.dart';
import 'package:appturista/presentation/search/search.dart';
import 'package:appturista/presentation/search/search_hashtag.dart';
import 'package:appturista/presentation/search/search_location.dart';
import 'package:appturista/presentation/search/search_view.dart';
import 'package:appturista/presentation/settings_frequent_questions.dart';
import 'package:appturista/presentation/settings_notifications.dart';
import 'package:appturista/presentation/home/messages.dart';
import 'package:appturista/presentation/home/reels.dart';
import 'package:appturista/presentation/login/page.dart';
import 'package:appturista/presentation/moments/detail.dart';
import 'package:appturista/presentation/moments/friends.dart';
import 'package:appturista/presentation/register/page.dart';
import 'package:appturista/presentation/register/data.dart';
import 'package:appturista/presentation/register/preferences.dart';
import 'package:appturista/presentation/recover/recover_update_password.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:appturista/presentation/root.dart';
import 'package:provider/provider.dart';

import 'presentation/widgets/media_picker/photo_provider.dart';

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
            '/login': (context) => const SignInPage(),
            '/register': (context) => const SignUpPage(),
            '/register/data': (context) => const SignUpDataPage(),
            '/register/preferences': (context) => const SignUpPreferencesPage(),
            '/recover': (context) => const RecoverPage(),
            '/recover/shippingNotification': (context) =>
                const RecoverShippingNotificationPage(),
            '/recover/enterCode': (context) => const RecoverEnterCode(),
            '/recover/updatePassword': (context) =>
                const RecoverUpdatePasswordPage(),
            '/home': (context) => const HomePage(),
            '/home/moments': (context) => const HomeMomentsPage(),
            '/home/reels': (context) => const HomeReelsPage(),
            '/home/messages': (context) => const HomeMessagesPage(),
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
            '/camera': (context) {
              final arg = settings.arguments;
              return CameraPage(
                user: arg as User?,
              );
            },
            '/camera/view': (context) {
              final arg = settings.arguments;
              return CameraViewPage(
                path: (arg as CameraPageViewArguments).path,
                user: arg.user,
              );
            },
            '/picker': (context) => const AlbumPageView(),
            '/moment/create': (context) {
              final path = settings.arguments;
              return MomentCreate(path: path as String);
            },
            '/moment/visibility': (context) => const MomentVisibilityPage(),
            '/moment/detail': (context) => const MomentsDetailPage(),
            '/moment/friends': (context) => const MomentsFriendsPage(),
          };
          WidgetBuilder? builder = routes[settings.name];
          return MaterialPageRoute(builder: (ctx) => builder!(ctx));
        },
      ),
    );
  }
}
