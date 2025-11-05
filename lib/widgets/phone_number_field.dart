import "package:chat_direct/theme/app_theme.dart";
import "package:flutter/material.dart";
import "package:flutter/services.dart";

class PhoneNumberField extends StatelessWidget {
  const PhoneNumberField({super.key, required this.fieldNode, required this.fieldController});
  final FocusNode fieldNode;
  final TextEditingController fieldController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: fieldController,
      focusNode: fieldNode,
      // onSubmitted: (text) => gotoWhatsapp(),
      onTapOutside: (event) => fieldNode.unfocus(),
      textAlign: TextAlign.left,
      textDirection: TextDirection.ltr,
      keyboardType: TextInputType.phone,
      maxLength: 15,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
      ],
      decoration: InputDecoration(
        label: const Center(child: Text("رقم الهاتف")),
        counterText: "",
        floatingLabelAlignment: FloatingLabelAlignment.center,
        labelStyle: TextStyle(
          color: fieldNode.hasFocus ? AppTheme.colorPalette.primary : AppTheme.colorPalette.border,
        ),
      ),
    );
  }
}
