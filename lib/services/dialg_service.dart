import 'dart:async';

import 'package:flutter_dialog_manager/datamodels/alert_request.dart';
import 'package:flutter_dialog_manager/datamodels/alert_response.dart';

class DialogService {
  Function(AlertRequest) _showDialgListener;
  Completer<AlertResponse> _dialogCompleter;

  void registerDialogListener(Function(AlertRequest) showDialogListener) {
    _showDialgListener = showDialogListener;
  }

  Future<AlertResponse> showDialog({
    String title,
    String description,
    String buttonTitle = 'OK',
  }) {
    _dialogCompleter = Completer<AlertResponse>();
    _showDialgListener(AlertRequest(
      title: title,
      description: description,
      buttonTitle: buttonTitle,
    ));

    return _dialogCompleter.future;
  }

  void dialogComplete(AlertResponse response) {
    _dialogCompleter.complete(response);
    _dialogCompleter = null;
  }
}
