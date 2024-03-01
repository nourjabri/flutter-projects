import 'package:flutter/material.dart';

class InvoiceScreen extends StatefulWidget {
  const InvoiceScreen({Key? key}) : super(key: key);
  @override
  State<InvoiceScreen> createState() => _InvoiceScreenState();
}

class _InvoiceScreenState extends State<InvoiceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Invoice'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Invoice Number'),
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
            //  subtitle:  Text('$10.00'),
          ),
        ],
      ),
    );
  }
}
