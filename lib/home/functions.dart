import 'package:flutter/material.dart';

Widget appicTextField(String hintText, Function(String?)? onSave, double radius,
    String initialValue) {
  return TextFormField(
    onSaved: onSave,
    initialValue: initialValue,
    style: const TextStyle(
        color: Colors.white, fontWeight: FontWeight.w600, fontSize: 16),
    cursorColor: Colors.white,
    decoration: InputDecoration(
      hintText: hintText,
      prefixIcon: const Icon(
        Icons.person,
        color: Colors.white,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(radius),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(radius),
      ),
    ),
  );
}

Container appicSaveButton(
    BuildContext context, double radius, Function() onPress, String title) {
  return Container(
    decoration: BoxDecoration(
        color: Colors.cyan[900], borderRadius: BorderRadius.circular(radius)),
    width: double.infinity,
    child: TextButton(
        onPressed: onPress,
        child: Text(
          title,
          style: const TextStyle(color: Colors.white, fontSize: 16),
        )),
  );
}

TextFormField appicPasswordField(bool visible, Function(String?)? onSave,
    String hintText, Function onTapVisible) {
  return TextFormField(
    obscuringCharacter: '*',
    style: const TextStyle(
        color: Colors.white, fontWeight: FontWeight.w600, fontSize: 16),
    cursorColor: Colors.white,
    obscureText: visible,
    onSaved: onSave,
    decoration: InputDecoration(
      hintText: hintText,
      prefixIcon: const Icon(
        Icons.password,
        color: Colors.white,
      ),
      suffixIcon: IconButton(
          onPressed: () {
            onTapVisible();
          },
          icon: visible
              ? const Icon(
                  Icons.visibility_off,
                  color: Colors.white,
                )
              : const Icon(Icons.visibility, color: Colors.white)),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(50),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(50),
      ),
    ),
  );
}
