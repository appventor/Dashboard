import 'services.dart';

bool isAuthenticated = false;

class AuthGuard extends AutoRouteGuard {
  @override
  Future<bool> canNavigate(
      List<PageRouteInfo> pendingRoutes, StackRouter router) async {
    if (!isAuthenticated) {
      router.root.push(LoginRoute(onLoginResult: (success) {
        if (success) {
          isAuthenticated = true;
          router.root.replaceAll(pendingRoutes);
        }
      }));
      return false;
    }
    return true;
  }
}
