import 'package:flutter/material.dart';

class InfoCard extends StatefulWidget {
  const InfoCard({super.key});

  @override
  State<InfoCard> createState() => _InfoCardState();
}

class _InfoCardState extends State<InfoCard> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.white24,
        child: Icon(
          Icons.person_2_outlined,
          color: Colors.white,
        ),
      ),
      title: Text(
        "name",
        style: TextStyle(color: Colors.white),
      ),
      subtitle: Text(
        "email",
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
