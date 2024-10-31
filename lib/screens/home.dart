import 'package:flutter/material.dart';
import 'package:invoicify/widgets/app_text.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 8.0, left: 20, right: 20),
              child: SizedBox(
                height: 65,
                child: AppText(
                  title: "EVAT SUITE",
                  fontSize: 40,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
