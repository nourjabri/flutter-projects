import 'package:clickresturant/Core/constants/config.dart';
import 'package:clickresturant/data/model/address_model.dart';
import 'package:clickresturant/logic/bloc/AddressBloc/address_bloc.dart';
import 'package:clickresturant/presentation/screens/locationpicker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DilveryDetailes extends StatefulWidget {
  const DilveryDetailes({super.key});

  @override
  State<DilveryDetailes> createState() => _DilveryDetailesState();
}

class _DilveryDetailesState extends State<DilveryDetailes> {
  final city = TextEditingController();
  final area = TextEditingController();
  final street = TextEditingController();
  final floor = TextEditingController();
  final building = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    context.read<AddressBloc>().add(LoadAddressEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Add Your Address",
            style: TextStyle(fontWeight: FontWeight.bold, color: fourColor)),
      ),
      body: BlocConsumer<AddressBloc, AddressState>(
        listener: (context, state) {
          if (state is AddressSaved) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Address Saved Successfully")),
            );
          }
        },
        builder: (context, state) {
          if (state is AddressLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is AddressError) {
            return Center(child: Text(state.message));
          }

          return Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  _buildHeader(),
                  Expanded(
                    child: ListView(
                      children: [
                        _buildTextField(city, "City", "Please enter your city"),
                        _buildTextField(area, "Area", "Please enter your area"),
                        _buildTextField(
                            street, "Street", "Please enter street name"),
                        _buildTextField(building, "Building",
                            "Please enter building number"),
                        _buildTextField(
                            floor, "Floor", "Please enter floor number"),
                      ],
                    ),
                  ),
                  _buildSaveButton(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        Text("Delivery Address ",
            style: TextStyle(fontSize: 20, color: Colors.blue)),
        IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MapPickerScreen()));
            },
            icon: Icon(
              Icons.location_on,
              color: primaryColor,
            ))
      ],
    );
  }

  Widget _buildTextField(
      TextEditingController controller, String hint, String errorMsg) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24.0),
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
      ),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(hintText: hint, border: InputBorder.none),
        validator: (value) =>
            (value == null || value.isEmpty) ? errorMsg : null,
      ),
    );
  }

  Widget _buildSaveButton() {
    return GestureDetector(
      onTap: () {
        if (_formKey.currentState!.validate()) {
          final address = AddressModel(
            city: city.text,
            floor: floor.text,
            street: street.text,
            building: building.text,
            area: area.text,
          );
          context.read<AddressBloc>().add(SaveAddressEvent(address: address));
        }
      },
      child: Container(
        height: 60,
        width: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: fourColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: const Text("Save",
            style: TextStyle(fontSize: 20, color: Colors.white)),
      ),
    );
  }
}
