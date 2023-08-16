import 'package:go_router/go_router.dart';
import 'package:marlo/app/modules/auth/views/auth_view.dart';
import 'package:marlo/app/modules/frame/views/frame_view.dart';
import 'package:marlo/app/modules/home/views/home_view.dart';

GoRouter routes = GoRouter(routes: [
  GoRoute(path: '/', builder: (context, state) => AuthView()),
  GoRoute(path: '/main', builder: (context, state) => FrameView()),
  GoRoute(
    path: '/home',
    builder: (context, state) => HomeView(),
  ),
]);
