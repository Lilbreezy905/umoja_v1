import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:umoja_v1/colors.dart';
import 'package:umoja_v1/common/utils/utils.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});
  static const routeName = '/login_screen';
  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final phoneController = TextEditingController();
  Country? country;

  void pickCountry() {
    showCountryPicker(
        context: context,
        onSelect: (Country country2) {
          setState(() {
            country = country2;
          });
        });
  }

  void sendNumber() {
    String phoneNumber = phoneController.text.trim();
    if (country != null && phoneNumber.isNotEmpty) {
    } else {
      showSnackBar(context: context, content: "Fill out all the fields");
    }
  }

  @override
  void dispose() {
    super.dispose();
    phoneController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
          title: const Text("Enter your phone number"),
          backgroundColor: backgroundColor),
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("verify the message sending by umoja chat"),
            const SizedBox(
              height: 3,
            ),
            TextButton(
                onPressed: pickCountry,
                child: const Text("Choose your country")),
            const SizedBox(
              height: 3,
            ),
            Row(
              children: [
                if (country != null) Text("+${country!.phoneCode}"),
                const SizedBox(
                  width: 5,
                ),
                SizedBox(
                  width: size.width * 0.7,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: phoneController,
                    decoration:
                        const InputDecoration(hintText: "enter your number"),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 15,
            ),
            SizedBox(
              width: 90,
              child: ElevatedButton(onPressed: sendNumber, child: Text("Next")),
            )
          ],
        ),
      ),
    );
  }
}
