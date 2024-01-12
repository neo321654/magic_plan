import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ListWrapperFirstTabScreen extends StatelessWidget implements AutoRouteWrapper {
  const ListWrapperFirstTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const EmptyFirstRouterPage();
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return this;
  }
}

class EmptyFirstRouterPage extends AutoRouter {
  const EmptyFirstRouterPage({super.key});
}
