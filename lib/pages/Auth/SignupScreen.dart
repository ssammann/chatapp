import 'package:avoid_keyboard/avoid_keyboard.dart';
import 'package:flutter/material.dart';
import 'package:localization/localization.dart';
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late FocusNode nameNode;
  late FocusNode emailNode;
  late FocusNode passwordNode;

  @override
  void initState() {
    // TODO: implement initState
    nameNode = FocusNode();
    emailNode = FocusNode();
    passwordNode = FocusNode();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: AvoidKeyboard(
          focusNodes: [nameNode,emailNode, passwordNode],
          spacing: 100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Spacer(
                flex: 4,
              ),
              Image.asset(
                "lib/assets/images/chat.png",
                width: 150,
                height: 150,
              ),
              Spacer(
                flex: 2,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 90 / 100,
                child: Text(
                  "loginTitle".i18n(),
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 26.0,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
              Spacer(
                flex: 1,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 80 / 100,
                child: TextFormField(
                  focusNode: nameNode,
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (v) {
                    FocusScope.of(context).requestFocus(emailNode);
                  },
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Name',
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 80 / 100,
                child: TextFormField(
                  focusNode: emailNode,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (v) {
                    FocusScope.of(context).requestFocus(passwordNode);
                  },
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Email',
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 80 / 100,
                child: TextFormField(
                  focusNode: passwordNode,
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.done,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Password',
                  ),
                ),
              ),
              Spacer(
                flex: 1,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 90 / 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        child: Text(
                          "Sign up",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {

                      },
                      child: Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                              color: Colors.blue, shape: BoxShape.circle),
                          child: Icon(Icons.arrow_forward)),
                    )
                  ],
                ),
              ),
              Spacer(
                flex: 1,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 80 / 100,
                child: InkWell(
                  onTap:(){
                    Navigator.pop(context);
                  },
                  child: Container(child: Text("Sign in")),
                ),
              ),
              Spacer(
                flex: 3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
