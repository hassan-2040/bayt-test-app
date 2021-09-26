import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';

class FeedbackWidgets {
  final BuildContext context;
  const FeedbackWidgets(this.context);

  void showLoading() {
    showGeneralDialog(
      context: context,
      barrierColor: Theme.of(context).backgroundColor.withOpacity(0.5),
      barrierDismissible: false,
      barrierLabel: '',
      pageBuilder: (ctx, _, __) {
        return Center(
          child: SizedBox(
            height: 30,
            width: 30,
            child: CircularProgressIndicator(
              color: Theme.of(context).primaryColor,
            ),
          ),
        );
      },
    );
  }

  void showSnackBar({
    required String snackBarText,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(snackBarText),
      action: SnackBarAction(
        label: translate('common.snackBarButtonText'),
        onPressed: () {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
        },
      ),
    ));
  }
}
