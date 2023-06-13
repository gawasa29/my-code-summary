import 'package:flutter/material.dart';

void loaderPopup(BuildContext context) {
  showDialog<void>(
    barrierColor: Colors.transparent,
    context: context,
    builder: (_) {
      return const FractionallySizedBox(
        heightFactor: 0.2,
        widthFactor: 0.5,
        child: Card(
          color: Colors.transparent,
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      );
    },
  );
}
