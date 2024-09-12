import 'package:flutter/material.dart';

class BhVerificationPage extends StatefulWidget {
  const BhVerificationPage({super.key});

  @override
  State<BhVerificationPage> createState() => _BhVerificationPageState();
}

class _BhVerificationPageState extends State<BhVerificationPage> {
  @override
  Widget build(BuildContext context) {
    return const Text(
      "Bh Ver",
      style: TextStyle(fontSize: 20, color: Colors.black),
    );
  }
}
