import 'package:flutter/material.dart';
import 'filter_section.dart';

class OrdersViewBody extends StatelessWidget {
  const OrdersViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
          children: [
            SizedBox(height: 24),
            FilterSection(),
          ],
      ),
    );
  }
}
