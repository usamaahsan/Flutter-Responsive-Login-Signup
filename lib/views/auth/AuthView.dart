import 'package:flutter/material.dart';
import 'package:materialloginsignup/styles/colors.dart';
import 'package:materialloginsignup/styles/constants.dart';
import 'package:materialloginsignup/styles/textStyles.dart';
import 'package:materialloginsignup/views/auth/LoginView.dart';
import 'package:materialloginsignup/views/auth/SignupView.dart';

class AuthView extends StatefulWidget {
  const AuthView({super.key});

  @override
  State<AuthView> createState() => _AuthViewState();
}

class _AuthViewState extends State<AuthView>
    with SingleTickerProviderStateMixin {
  String headerSectionTitle = "Welcome Back";
  String headerSectionSubtitle = "Login with email and password";

  late TabController _tabController;

  List<Widget> tabViews = [
    const LoginView(),
    const SignupView(),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 600) {
            return largeScreenView(constraints.maxWidth);
          }
          return smallScreenView(constraints.maxWidth);
        },
      ),
    );
  }

  Widget largeScreenView(double screenWidth) {
    return Scaffold(
      backgroundColor: darkBgColor,
      body: Row(
        children: [
      Expanded(
        child: mainTitleSection(),
      ),
      Expanded(child: mainSection(screenWidth))
        ],
      ),
    );
  }

  Widget smallScreenView(double screenWidth) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: darkBgColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          mainTitleSection(),
          const SizedBox(
            height: 6,
          ),
          Expanded(
            child: mainSection(screenWidth),
          )
        ],
      ),
    );
  }

  Widget mainTitleSection() {
    return Padding(
      padding: const EdgeInsets.all(margin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            headerSectionTitle,
            style: headingFontStyle.copyWith(color: Colors.white),
          ),
          const SizedBox(
            height: 6,
          ),
          Text(
            headerSectionSubtitle,
            style: body2FontStyle.copyWith(color: secondaryColorOnDarkBg),
          ),
        ],
      ),
    );
  }

  Widget mainSection(double screenWidth) {
    BorderRadiusGeometry radius = const BorderRadius.only(
        topLeft: Radius.circular(24), topRight: Radius.circular(24));
    if (screenWidth > 600) {
      radius = const BorderRadius.only(
          topLeft: Radius.circular(24), bottomLeft: Radius.circular(24));
    }
    return Container(
      decoration: BoxDecoration(color: Colors.white, borderRadius: radius),
      child: Column(
        children: [
          tabs(),
          tabView(),
        ],
      ),
    );
  }

  Widget tabs() {
    return Padding(
      padding: const EdgeInsets.all(margin),
      child: Container(
        height: 50,
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: tabBackgroundColor,
          borderRadius: BorderRadius.circular(
            25.0,
          ),
        ),
        child: TabBar(
          onTap: (value) {
            if (value == 0) {
              setState(() {
                headerSectionTitle = "Welcome Back";
                headerSectionSubtitle = "Login with email and password";
              });
            }
            if (value == 1) {
              setState(() {
                headerSectionTitle = "Set up your account";
                headerSectionSubtitle =
                    "Sign up to enjoy the best managing experience";
              });
            }
          },
          dividerColor: Colors.transparent,
          indicatorSize: TabBarIndicatorSize.tab,
          controller: _tabController,
          indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(
              25.0,
            ),
            color: Colors.white,
          ),
          labelColor: Colors.black,
          unselectedLabelColor: Colors.black,
          labelStyle: heading3FontStyle,
          unselectedLabelStyle: bodyFontStyle,
          tabs: const [
            Tab(
              text: 'Login',
            ),
            Tab(
              text: 'Create Account',
            ),
          ],
        ),
      ),
    );
  }

  Widget tabView() {
    return Expanded(
      child: TabBarView(
        controller: _tabController,
        children: tabViews,
      ),
    );
  }
}
