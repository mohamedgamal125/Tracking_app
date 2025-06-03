import 'dart:async';
import 'package:flutter/material.dart';

import '../../../../../generated/l10n.dart';

class ResendOTPButton extends StatefulWidget {
  final Function onResend;

  const ResendOTPButton({super.key, required this.onResend});

  @override
  _ResendOTPButtonState createState() => _ResendOTPButtonState();
}

class _ResendOTPButtonState extends State<ResendOTPButton> {
  int _timerSeconds = 60;
  Timer? _timer;
  bool _canResend = false;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    setState(() {
      _canResend = false;
      _timerSeconds = 60;
    });

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_timerSeconds > 0) {
        setState(() {
          _timerSeconds--;
        });
      } else {
        timer.cancel();
        setState(() {
          _canResend = true;
        });
      }
    });
  }

  void handleResend() {
    if (!_canResend) return;
    widget.onResend();
    startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed:
          _canResend ? handleResend : null,
      child: Text(_canResend ? S.of(context).resend : "${S.of(context).resendIn} $_timerSeconds "),
    );
  }
}
