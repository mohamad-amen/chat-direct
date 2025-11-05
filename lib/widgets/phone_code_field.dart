import "package:chat_direct/models/phone_code_model.dart";
import "package:chat_direct/providers/phone_code_provider.dart";
import "package:chat_direct/theme/app_theme.dart";
import "package:flutter/material.dart";
import "package:provider/provider.dart";

class PhoneCodeField extends StatefulWidget {
  const PhoneCodeField({super.key, required this.fieldNode, required this.fieldController});
  final FocusNode fieldNode;
  final TextEditingController fieldController;

  @override
  State<PhoneCodeField> createState() => _PhoneCodeFieldState();
}

class _PhoneCodeFieldState extends State<PhoneCodeField> {
  late PhoneCodeProvider phoneCodeProvider;
  Color? labelColor;

  void trySelectPhoneCode(String value) async {
    if (value.isEmpty) return setState(() {});

    List searchResults = phoneCodeProvider.searchPhoneCodes(value);
    if (searchResults.length == 1) {
      await phoneCodeProvider.selectNewPhoneCode(searchResults[0]);
    } else {
      await phoneCodeProvider.selectNewPhoneCode(null);
    }
  }

  void setLabelColor() {
    if (phoneCodeProvider.selectedPhoneCode == null && widget.fieldController.text != "") {
      labelColor = AppTheme.colorPalette.error;
      return;
    }

    if (widget.fieldNode.hasFocus) {
      labelColor = AppTheme.colorPalette.primary;
    } else {
      labelColor = AppTheme.colorPalette.border;
    }
  }

  @override
  Widget build(BuildContext context) {
    phoneCodeProvider = Provider.of<PhoneCodeProvider>(context);
    PhoneCodeModel? selectedPhoneCode = phoneCodeProvider.selectedPhoneCode;

    if (selectedPhoneCode != null) {
      widget.fieldController.text = selectedPhoneCode.phoneCode;
    }

    setLabelColor();

    return SizedBox(
      width: 50,
      child: TextFormField(
        autovalidateMode: AutovalidateMode.always,
        controller: widget.fieldController,
        focusNode: widget.fieldNode,
        onTapOutside: (event) => widget.fieldNode.unfocus(),
        keyboardType: TextInputType.phone,
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr,
        onChanged: (value) => trySelectPhoneCode(value),
        validator: (value) {
          if (selectedPhoneCode == null && value != "") return "";

          return null;
        },
        maxLength: 5,
        decoration: InputDecoration(
          labelText: "رمز الدولة",
          counterText: "",
          floatingLabelAlignment: FloatingLabelAlignment.center,
          labelStyle: TextStyle(
            color: labelColor,
          ),
        ),
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
