import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:oda_rider/constants.dart';
import 'package:oda_rider/widgets/button.dart';

class Otp extends StatefulWidget {
  const Otp({super.key});

  @override
  State<Otp> createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Button(
                text: 'Next',
                onPressed: () {
                  if (kDebugMode) {
                    print("Login Pressed!");
                  }
                },
              ),
              Text(
                textAlign: TextAlign.center,
                'By signing up you automactically accept out terms & conditions, privacy policy and cookie policy',
                style: AppTextStyles.body.copyWith(fontSize: 14),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
