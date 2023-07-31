import 'package:chatapp/services/AuthService.dart';
import 'package:chatapp/widgets/InfoCard.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        // drawer: Drawer(
        //   child: ListView(
        //     children: [
        //
        //     ],
        //   ),
        // ),
        // appBar: AppBar(
        //   title: Text("Chats"),
        // ),
        body: Container(
          width: 288,
          color: Color(0xff17203a),
          child: SafeArea(
            child: Column(
              children: [InfoCard()],
            ),
          ),
        ),
      ),
    );
  }
}
