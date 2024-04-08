// ignore: file_names
import 'package:firebasejourney1/theTechBrotherFirebase/utils/constant.dart';
import 'package:flutter/material.dart';

class ReuseTextFormField extends StatelessWidget {
  ReuseTextFormField(
      {super.key,
      this.controller,
      this.keyboardType,
      this.hintText,
      this.prefixIcon,
      this.validator,
      this.onSaved,
      this.maxline,
        this.maxlength,
        this.onChange,
      });
  TextEditingController? controller;
  TextInputType? keyboardType;
  String? hintText;
  Widget? prefixIcon;
  String? Function(String?)? validator;
   Function(String?)? onSaved;
   int? maxline;
  int? maxlength;
  Function(String?)? onChange;


  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 56,
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 3, color: Utils.colorPrimary)),
      child: Center(
        child: TextFormField(
          onChanged:onChange,
          maxLines: maxline,
          maxLength: maxlength,

          controller: controller,
          keyboardType: keyboardType,
          validator: validator,
          onSaved: onSaved,
          decoration: InputDecoration(

            hintText: hintText,
            hintStyle: Utils.textStyle(color: Colors.purple),
            prefixIcon: prefixIcon,
            prefixIconColor: Utils.colorPrimary,
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          ),
        ),
      ),
    );
  }
}
