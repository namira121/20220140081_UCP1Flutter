import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final String email;

  const HomePage({super.key,
  required this.email});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}