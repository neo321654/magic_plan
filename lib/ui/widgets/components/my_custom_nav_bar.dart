import 'package:flutter/cupertino.dart';
import 'package:magic_plan/resources/resources.dart';


class MyNavBar extends SliverPersistentHeaderDelegate {

  MyNavBar({required this.title,this.prevTitle=''});

  final String title;
  final String prevTitle;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return CupertinoNavigationBar(
      previousPageTitle:prevTitle,
      border: Border.all(color: AppColors.primaryIcons),
      backgroundColor: AppColors.primaryMainBackground,
      middle: Text(
        title,
        style: AppTextStyles.bodyBold,
      ),
    );
  }
  //todo на айфонах есть проблемма с отображением
  @override
  double get maxExtent => 68.0;

  @override
  double get minExtent => 68.0;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}