import 'package:flutter/material.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({Key? key}) : super(key: key);
  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Orders'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Order Number'),
            subtitle: const Text('123456'),
          ),
          ListTile(
            title: const Text('Date'),
            subtitle: const Text('2023-03-08'),
          ),
          ListTile(
            title: const Text('Customer'),
            subtitle: const Text('John Doe'),
          ),
          ListTile(
            title: const Text('Address'),
            subtitle: const Text('123 Main Street, Anytown, CA 91234'),
          ),
          ListTile(
            title: const Text('Items'),
            subtitle: const Text('1 x Hamburger, 1 x Fries, 1 x Soda'),
          ),
          ListTile(
            title: const Text('Total'),
            //   subtitle: const Text('$10.00'),
          ),
          ListTile(
            title: const Text('Status'),
            subtitle: const Text('In progress'),
          ),
        ],
      ),
    );
  }
}
