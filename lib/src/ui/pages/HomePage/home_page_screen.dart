import 'package:conecta_ai_app/src/ui/components/custom_colors.dart';
import 'package:conecta_ai_app/src/ui/components/custom_drawer.dart';
import 'package:flutter/material.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Cor.white, size: 28),
        title: const Text(
          'Conecta AI',
          style: TextStyle(color: Cor.white),
        ),
        backgroundColor: Cor.darkBlue,
        centerTitle: true,
      ),
      drawer: const CustomDrawer(),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                backgroundColor: Cor.darkBlue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12))),
            child: const Text(
              'Começar',
              style: TextStyle(fontSize: 18),
            ),
          )
        ],
      ),
    );
  }
}
