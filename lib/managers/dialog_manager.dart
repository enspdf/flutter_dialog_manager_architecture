import 'package:flutter/material.dart';
import 'package:flutter_dialog_manager/datamodels/alert_request.dart';
import 'package:flutter_dialog_manager/datamodels/alert_response.dart';
import 'package:flutter_dialog_manager/locator.dart';
import 'package:flutter_dialog_manager/services/dialg_service.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class DialogManager extends StatefulWidget {
  final Widget child;

  const DialogManager({Key key, this.child}) : super(key: key);

  @override
  _DialogManagerState createState() => _DialogManagerState();
}

class _DialogManagerState extends State<DialogManager> {
  DialogService _dialogService = locator<DialogService>();

  @override
  void initState() {
    super.initState();
    _dialogService.registerDialogListener(_showDialog);
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  void _showDialog(AlertRequest request) {
    Alert(
      context: context,
      title: request.title,
      desc: request.description,
      closeFunction: () =>
          _dialogService.dialogComplete(AlertResponse(confirmed: false)),
      buttons: [
        DialogButton(
          child: Text(request.buttonTitle),
          onPressed: () {
            _dialogService.dialogComplete(AlertResponse(confirmed: true));
            Navigator.of(context).pop();
          },
        ),
      ],
    ).show();
  }
}
