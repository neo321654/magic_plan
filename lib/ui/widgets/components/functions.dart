import 'package:flutter/cupertino.dart';

void showAlertDialog({required BuildContext context,required String message, required String confirmMessage,
}) {

  showCupertinoModalPopup<void>(
    context: context,
    builder: (BuildContext context) => CupertinoAlertDialog(
      // title: const Text('Alert'),
      content: Text(message),
      actions: <CupertinoDialogAction>[
        CupertinoDialogAction(
          isDestructiveAction: false,
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(confirmMessage),
        ),
      ],
    ),
  );
}