import 'package:blog_club/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  static const int loginTab = 0;
  static const int signUpTab = 1;
  int selectedTabIndex = loginTab;

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final tabTextStyle = themeData.textTheme.headlineSmall!;
    final themeColor = themeData.colorScheme;
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(132, 41, 132, 32),
            child: Assets.img.icons.logo.svg(width: 100),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: themeColor.primary,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(28),
                  topRight: Radius.circular(28),
                ),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 20,
                    color: const Color(0xff4F5B791A).withOpacity(0.1),
                  ),
                ],
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 60,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextButton(
                          onPressed: () {
                            setState(() {
                              selectedTabIndex = loginTab;
                            });
                          },
                          child: Text(
                            'login'.toUpperCase(),
                            style: tabTextStyle.apply(
                              color: selectedTabIndex == loginTab
                                  ? themeColor.onPrimary
                                  : themeColor.onPrimary.withOpacity(0.4),
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              selectedTabIndex = signUpTab;
                            });
                          },
                          child: Text(
                            'sign up'.toUpperCase(),
                            style: tabTextStyle.apply(
                              color: selectedTabIndex == signUpTab
                                  ? themeColor.onPrimary
                                  : themeColor.onPrimary.withOpacity(0.4),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(40, 28, 40, 22),
                      decoration: BoxDecoration(
                        color: themeColor.surface,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(28),
                          topRight: Radius.circular(28),
                        ),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 50,
                            color: const Color.fromARGB(255, 71, 116, 158)
                                .withOpacity(0.5),
                          ),
                        ],
                      ),
                      child: SingleChildScrollView(
                        child: AuthForm(
                          themeData: themeData,
                          selectedTabIndex: selectedTabIndex,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}

class AuthForm extends StatefulWidget {
  const AuthForm({
    super.key,
    required this.themeData,
    required this.selectedTabIndex,
  });

  final ThemeData themeData;
  final int selectedTabIndex;

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  bool isShow = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.selectedTabIndex == 0
              ? 'Welcome Back'
              : 'Welcome to Blog Club',
          style: widget.themeData.textTheme.headlineMedium,
        ),
        const SizedBox(height: 12),
        Text(
          widget.selectedTabIndex == 0
              ? 'Sign in with your account'
              : 'Enter your information',
          style: widget.themeData.textTheme.bodyMedium,
        ),
        const SizedBox(height: 24),
        if (widget.selectedTabIndex == 1)
          const TextField(decoration: InputDecoration(label: Text('Fullname'))),
        SizedBox(height: widget.selectedTabIndex == 1 ? 12 : 0),
        const TextField(decoration: InputDecoration(label: Text('Username'))),
        const SizedBox(height: 12),
        TextField(
          obscureText: isShow ? false : true,
          enableSuggestions: false,
          autocorrect: false,
          decoration: InputDecoration(
            label: const Text('Password'),
            suffix: InkWell(
              onTap: () {
                setState(() {
                  isShow = !isShow;
                });
              },
              child: Text(
                isShow ? 'Hide' : 'Show',
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ),
          ),
        ),
        const SizedBox(height: 30),
        ElevatedButton(
          style: ButtonStyle(
              minimumSize: MaterialStateProperty.all(
                Size(MediaQuery.of(context).size.width, 60),
              ),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)))),
          onPressed: () {},
          child: Text(widget.selectedTabIndex == 0
              ? 'login'.toUpperCase()
              : 'sign up'.toUpperCase()),
        ),
        const SizedBox(height: 12),
        if (widget.selectedTabIndex == 0)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Forgot your password?'),
              TextButton(onPressed: () {}, child: const Text('Reset here'))
            ],
          ),
        SizedBox(height: widget.selectedTabIndex == 0 ? 32 : 10),
        Center(
            child: Text(
          'OR SIGN ${widget.selectedTabIndex == 0 ? 'IN' : 'UP'} WITH',
          style: const TextStyle(letterSpacing: 2), //2*
        )),
        const SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Assets.img.icons.google.image(width: 36, height: 36),
            const SizedBox(width: 32),
            Assets.img.icons.facebook.image(width: 36, height: 36),
            const SizedBox(width: 32),
            Assets.img.icons.twitter.image(width: 36, height: 36),
          ],
        )
      ],
    );
  }
}
