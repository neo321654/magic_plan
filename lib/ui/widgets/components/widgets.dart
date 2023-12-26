import 'package:flutter/cupertino.dart';

class RightArrowWidget extends StatelessWidget {
  const RightArrowWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Icon(
      CupertinoIcons.right_chevron,
      size: 26,
      color: CupertinoColors.systemGrey2.resolveFrom(context),
    );
  }
}
