import 'package:flutter/foundation.dart';
import 'package:flutter_dialog_manager/locator.dart';
import 'package:flutter_dialog_manager/services/dialg_service.dart';

class HomeViewModel extends ChangeNotifier {
  final DialogService _dialogService = locator<DialogService>();

  Future doThings() async {
    var dialogResult = await _dialogService.showDialog(
      title: 'Dialog Manager',
      description: 'Architecture is always awesome',
    );

    if (dialogResult.confirmed) {
      print('User has confirmed');
    } else {
      print('User cancelled the dialog');
    }
  }
}
