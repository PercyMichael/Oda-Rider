import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/route_manager.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:oda_rider/constants.dart';
import 'package:oda_rider/widgets/button.dart';
// import 'package:intl_phone_field/intl_phone_field.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController controller = TextEditingController();
  String initialCountry = 'UG';
  PhoneNumber number = PhoneNumber(isoCode: 'UG');

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
              Image.asset('assets/branding/driver_icon.png', width: 150),
              const SizedBox(height: 40),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                child: InternationalPhoneNumberInput(
                  onInputChanged: (PhoneNumber number) {
                    print(number.phoneNumber);
                  },
                  onInputValidated: (bool value) {
                    print(value);
                  },
                  selectorConfig: const SelectorConfig(
                    selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                    useBottomSheetSafeArea: true,
                  ),
                  ignoreBlank: false,
                  autoValidateMode: AutovalidateMode.disabled,
                  selectorTextStyle: const TextStyle(color: Colors.black),
                  initialValue: number,
                  textFieldController: controller,
                  formatInput: true,
                  keyboardType: const TextInputType.numberWithOptions(
                      signed: true, decimal: true),
                  // inputBorder: OutlineInputBorder(borderSide: BorderSide()),
                  onSaved: (PhoneNumber number) {
                    print('On Saved: $number');
                  },
                ),
              ),
              // IntlPhoneField(
              //   decoration: const InputDecoration(
              //     labelText: 'Phone Number',
              //     border: UnderlineInputBorder(), // Default bottom border
              //     enabledBorder: UnderlineInputBorder(
              //       borderSide: BorderSide(
              //           color:
              //               Colors.grey), // Grey bottom border when not focused
              //     ),
              //     focusedBorder: UnderlineInputBorder(
              //       borderSide: BorderSide(
              //           color: AppColors.grey,
              //           width: 0.5), // Blue bottom border when focused
              //     ),
              //     // border: OutlineInputBorder(
              //     //   borderSide: BorderSide(),
              //     // ),
              //   ),
              //   initialCountryCode: 'UG',
              //   onChanged: (phone) {
              //     print(phone.completeNumber);
              //   },
              // ),
              Button(
                text: 'Next',
                onPressed: () {
                  if (kDebugMode) {
                    print("Login Pressed!");
                  }
                  Get.toNamed('/otp');
                },
              ),
              const Row(
                children: [
                  Expanded(
                    child: Divider(
                      height: 60,
                      color: AppColors.grey,
                      thickness: 0.2,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text('Or', style: AppTextStyles.body),
                  ),
                  Expanded(
                    child: Divider(
                      height: 60,
                      color: AppColors.grey,
                      thickness: 0.2,
                    ),
                  ),
                ],
              ),
              Button(
                text: 'Continue with Google',
                icon: Image.asset(
                  'assets/branding/google-icon.png',
                  width: 20,
                ),
                color: AppColors.white,
                textColor: AppColors.textPrimary,
                borderWidth: 0.2,
                borderColor: AppColors.textPrimary,
                elevation: 0,
                onPressed: () {
                  if (kDebugMode) {
                    print("Google Pressed!");
                  }
                },
              ),
              const SizedBox(height: 20),
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
