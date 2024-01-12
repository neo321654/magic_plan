import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ListWrapperSecondTabScreen extends StatelessWidget implements AutoRouteWrapper {
  const ListWrapperSecondTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const EmptyRouterPage();
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return this;
  }
}

class EmptyRouterPage extends AutoRouter {
  const EmptyRouterPage({super.key});
}
