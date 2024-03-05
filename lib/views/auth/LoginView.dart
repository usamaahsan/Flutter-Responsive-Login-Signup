import 'package:flutter/material.dart';
import 'package:materialloginsignup/Widgets/TextFieldWithIcon.dart';
import 'package:materialloginsignup/styles/colors.dart';
import 'package:materialloginsignup/styles/constants.dart';
import 'package:materialloginsignup/styles/textStyles.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool isPasswordHidden = true;
  bool rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        padding: const EdgeInsets.fromLTRB(margin, 0, margin, margin),
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        children: [
          TextFieldWithIcon(
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
              }),
          const SizedBox(
            height: 12,
          ),
          TextFieldWithIcon(
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
              }),
          const SizedBox(
            height: 12,
          ),
          loginButton(),
          const SizedBox(
            height: 12,
          ),
          rememberAndForgetPassword(),
          const SizedBox(
            height: 6,
          ),
          orSection(),
          const SizedBox(
            height: 12,
          ),
          googleAndFacebookButtons(),
        ],
      ),
    );
  }

  Widget rememberAndForgetPassword() {
    return SizedBox(
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: InkWell(
                onTap: () {
                  setState(() {
                    rememberMe = !rememberMe;
                  });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Checkbox(
                        activeColor: primaryColor,
                        value: rememberMe,
                        onChanged: (value) {
                          if (value != null) {
                            setState(() {
                              rememberMe = value;
                            });
                          }
                        }),
                    const SizedBox(
                      width: 6,
                    ),
                    const Text(
                      "Remember Me",
                      style: heading3FontStyle,
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              width: 6,
            ),
            Expanded(
                child: TextButton(
              onPressed: () {},
              child: Text(
                "Forgot Password?",
                style: heading3FontStyle.copyWith(color: primaryColor),
              ),
            ))
          ],
        ));
  }

  Widget orSection() {
    return Container(
      height: 20,
      padding: const EdgeInsets.symmetric(horizontal: margin),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Expanded(
            child: Divider(
              height: 0,
            ),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: Text(
                "Or Login with",
                style: heading3FontStyle.copyWith(color: lightParaColor),
              )),
          const Expanded(
            child: Divider(
              height: 0,
            ),
          ),
        ],
      ),
    );
  }

  Widget googleAndFacebookButtons() {
    return SizedBox(
      height: 50,
      child: Row(
        children: [
          Expanded(
              child: outlinedButtonWithIcon(
                  title: "Google",
                  icon: Image.asset(
                    "assets/images/google.png",
                    width: 18,
                    height: 18,
                  ),
                  ontap: () {})),
          const SizedBox(
            width: 6,
          ),
          Expanded(
              child: outlinedButtonWithIcon(
                  title: "Apple",
                  icon: Image.asset(
                    "assets/images/apple.png",
                    width: 18,
                    height: 18,
                  ),
                  ontap: () {}))
        ],
      ),
    );
  }

  Widget outlinedButtonWithIcon(
      {required String title, required Widget icon, required Function ontap}) {
    return SizedBox(
      height: 50,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: Colors.white,
              shape: const StadiumBorder(
                  side: BorderSide(color: secondaryColorOnDarkBg))),
          onPressed: () {
            ontap();
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon,
              const SizedBox(
                width: 4,
              ),
              Text(
                title,
                style: bodyFontStyle.copyWith(color: Colors.black),
              )
            ],
          )),
    );
  }

  Widget loginButton() {
    return SizedBox(
      height: 50,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: primaryColor),
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              // Make API call or anything here
              debugPrint(email.text);
              debugPrint(password.text);
            }
          },
          child: Center(
            child: Text(
              "Login",
              style: heading2FontStyle.copyWith(color: Colors.white),
            ),
          )),
    );
  }
}
