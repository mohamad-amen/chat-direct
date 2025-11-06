import "package:chat_direct/models/phone_code_model.dart";
import "package:chat_direct/providers/phone_code_provider.dart";
import "package:chat_direct/theme/app_theme.dart";
import "package:chat_direct/widgets/phone_code_dialogue.dart";
import "package:country_flags/country_flags.dart";
import "package:flutter/material.dart";
import "package:provider/provider.dart";

class PhoneCodeButton extends StatefulWidget {
  const PhoneCodeButton({super.key});

  @override
  State<PhoneCodeButton> createState() => _PhoneCodeButtonState();
}

class _PhoneCodeButtonState extends State<PhoneCodeButton> {
  @override
  Widget build(BuildContext context) {
    PhoneCodeModel? selectedPhoneCode = Provider.of<PhoneCodeProvider>(context).selectedPhoneCode;

    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton(
        onPressed: () {
          showGeneralDialog(
            context: context,
            barrierDismissible: true,
            barrierLabel: "",
            pageBuilder: (context, animation, secondaryAnimation) {
              return const PhoneCodeDialogue();
            },
            transitionBuilder: (context, animation, secondaryAnimation, child) {
              return ScaleTransition(
                scale: animation,
                child: FadeTransition(
                  opacity: animation,
                  child: child,
                ),
              );
            },
          );
        },
        style: ButtonStyle(
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
              side: BorderSide(color: AppTheme.colorPalette.border),
            ),
          ),
          textStyle: WidgetStateProperty.all(
            const TextStyle(
              fontSize: 15,
            ),
          ),
        ),
        child: selectedPhoneCode == null
            ? const Text("إختر رمز الدولة")
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CountryFlag.fromCountryCode(
                    selectedPhoneCode.countryCode,
                    theme: ImageTheme(
                      shape: RoundedRectangle(5),
                      height: 30,
                      width: 40,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        selectedPhoneCode.englishName,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      Text(
                        selectedPhoneCode.arabicName,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ],
                  ),
                  const Icon(Icons.arrow_drop_down_rounded, size: 30)
                ],
              ),
      ),
    );
  }
}
