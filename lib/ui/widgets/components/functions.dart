import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:magic_plan/main.dart';

Future<void> showAlertDialog({required BuildContext context,required String message, required String confirmMessage,
}) {

 return showCupertinoModalPopup<void>(
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

pickImage(ImageSource source) async{
  final ImagePicker imagePicker = ImagePicker();
  XFile? file = await imagePicker.pickImage(source: source);
  if(file != null){
    return await file.readAsBytes();
  }
 talker.debug ('No Images Selected');
}

List<String> getNameSurnameSplit(String? namSur) {
  namSur ??= ',';
  return namSur.split(',');
}