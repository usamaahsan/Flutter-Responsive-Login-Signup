import 'package:flutter/material.dart';
import 'package:materialloginsignup/Widgets/TextFieldWithIcon.dart';
import 'package:materialloginsignup/styles/colors.dart';
import 'package:materialloginsignup/styles/constants.dart';
import 'package:materialloginsignup/styles/textStyles.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController retypePassword = TextEditingController();
  TextEditingController phone = TextEditingController();

  bool isPasswordHidden = true;
  bool isRetypePasswordHidden = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        padding: const EdgeInsets.fromLTRB(margin, 0, margin, margin),
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        children: [
          nameField(),
          const SizedBox(
            height: 12,
          ),
          emailField(),
          const SizedBox(
            height: 12,
          ),
          passwordField(),
          const SizedBox(
            height: 12,
          ),
          retypePasswordField(),
          const SizedBox(
            height: 12,
          ),
          phoneField(),
          const SizedBox(
            height: 12,
          ),
          loginButton(),
        ],
      ),
    );
  }

  Widget nameField() {
    return TextFieldWithIcon(
        controller: name,
        hint: "Full Name",
        icon: const Icon(
          Icons.person_outline,
          color: primaryColor,
          size: 18,
        ),
        inputType: TextInputType.text,
        validator: (String value) {
          if (value.isEmpty) {
            return "Name cannot be empty";
          }
          return null;
        });
  }

  Widget emailField() {
    return TextFieldWithIcon(
        controller: email,
        hint: "Email Id",
        icon: const Icon(
          Icons.email_outlined,
          color: primaryColor,
          size: 18,
        ),
        inputType: TextInputType.emailAddress,
        validator: (String value) {
          if (value.isEmpty) {
            return "Email cannot be empty";
          }
          if (!value.contains("@")) {
            return "Email not valid";
          }
          return null;
        });
  }

  Widget passwordField() {
    return TextFieldWithIcon(
        controller: password,
        hint: "Password",
        icon: const Icon(
          Icons.password_outlined,
          color: primaryColor,
          size: 18,
        ),
        inputType: TextInputType.visiblePassword,
        obscureText: isPasswordHidden,
        suffix: IconButton(
            onPressed: () {
              setState(() {
                isPasswordHidden = !isPasswordHidden;
              });
            },
            icon: Icon(
              isPasswordHidden ? Icons.visibility_off : Icons.visibility,
              color: isPasswordHidden ? Colors.grey : primaryColor,
            )),
        validator: (value) {
          if (value.isEmpty) {
            return "Password cannot be empty";
          }
          return null;
        });
  }

  Widget retypePasswordField() {
    return TextFieldWithIcon(
        controller: retypePassword,
        hint: "Retype Password",
        icon: const Icon(
          Icons.password_outlined,
          color: primaryColor,
          size: 18,
        ),
        inputType: TextInputType.visiblePassword,
        obscureText: isRetypePasswordHidden,
        suffix: IconButton(
            onPressed: () {
              setState(() {
                isRetypePasswordHidden = !isRetypePasswordHidden;
              });
            },
            icon: Icon(
              isRetypePasswordHidden ? Icons.visibility_off : Icons.visibility,
              color: isRetypePasswordHidden ? Colors.grey : primaryColor,
            )),
        validator: (value) {
          if (value.isEmpty) {
            return "Password cannot be empty";
          }
          if(value != password.text){
            return "Passwords Don't match";
          }
          return null;
        });
  }

  Widget phoneField() {
    return TextFieldWithIcon(
        controller: phone,
        hint: "Phone Number",
        icon: const Icon(
          Icons.phone_outlined,
          color: primaryColor,
          size: 18,
        ),
        inputType: TextInputType.text,
        validator: (String value) {
          if (value.isEmpty) {
            return "Phone cannot be empty";
          }
          int? valueNum = int.tryParse(value);
          if(valueNum == null){
            return "Invalid Phone Number";
          }
          return null;
        });
  }


  Widget loginButton() {
    return SizedBox(
      height: 50,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: primaryColor),
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              // Make API call or anything here

            }
          },
          child: Center(
            child: Text(
              "Register",
              style: heading2FontStyle.copyWith(color: Colors.white),
            ),
          )),
    );
  }
}
