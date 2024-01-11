import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class MainScreenWidgetPage extends StatelessWidget {
  const MainScreenWidgetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      children: [
        const SizedBox(
          height: 8.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.add,
                  size: 21.0,
                )),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.add,
                  size: 21.0,
                )),
          ],
        ),


      ],
    ));
  }
}
