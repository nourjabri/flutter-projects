import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clickresturant/Core/constants/config.dart';
import 'package:clickresturant/data/model/address_model.dart';
import 'package:clickresturant/logic/bloc/AddressBloc/address_bloc.dart';

class DilveryDetailes extends StatefulWidget {
  DilveryDetailes({super.key});

  @override
  State<DilveryDetailes> createState() => _DilveryDetailesState();
}

class _DilveryDetailesState extends State<DilveryDetailes> {
  TextEditingController city = TextEditingController();
  TextEditingController area = TextEditingController();
  TextEditingController street = TextEditingController();
  TextEditingController floor = TextEditingController();
  TextEditingController building = TextEditingController();
  @override
  void initState() {
    super.initState();
    context.read<AddressBloc>().add(LoadedAddresEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Your Bil",
          style: TextStyle(
              fontSize: 16, color: fourColor, fontWeight: FontWeight.bold),
        ),
        elevation: 0.0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios),
          color: Colors.black,
        ),
      ),
      body: BlocBuilder<AddressBloc, AddressState>(
        builder: (context, state) {
          if (state is AddressError) {
            return const Center(child: Text("state.message"));
          }
          if (state is AddressLoaded) {
            return Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  const Text(
                    "Dilvery Address ",
                    style: TextStyle(fontSize: 20, color: thirdColor),
                  ),
                  const Icon(
                    Icons.location_on,
                    color: secondryColor,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Expanded(
                    child: ListView(
                      children: [
                        Container(
                          margin: const EdgeInsets.all(16),
                          padding:
                              const EdgeInsets.only(left: 20.0, right: 20.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24.0),
                              color: Colors.white),
                          child: TextFormField(
                            controller: city,
                            decoration: const InputDecoration(
                                hintText: "Please enter your city",
                                border: InputBorder.none),
                            validator: (String? value) {
                              if (value!.isEmpty || value.isEmpty) {
                                return "Please enter the name";
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        final address = AddressModel(
                            city: city.text,
                            floor: floor.text,
                            street: street.text,
                            building: building.text,
                            area: area.text);
                        context
                            .read<AddressBloc>()
                            .add(SaveAddressEvevt(address: address));
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("Address Saved Successfully")));
                      },
                      child: const Text("save Address"))
                ],
              ),
            );
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
