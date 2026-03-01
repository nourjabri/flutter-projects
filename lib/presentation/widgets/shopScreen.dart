import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quranapp/presentation/cubit/shop_cubit.dart';
import 'package:quranapp/presentation/widgets/shopCard.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  Timer? _debounce;
  final TextEditingController _searchController = TextEditingController();
  bool _isOpenOnly = false;
  String _sortBy = 'None';

  @override
  void initState() {
    super.initState();
    context.read<ShopCubit>().fetchShops();
  }

  _onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      context.read<ShopCubit>().updateList(
        query: query,
        openOnly: _isOpenOnly,
        sortBy: _sortBy,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Grocery Stores"), centerTitle: true),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: "Search by name or description...",
                prefixIcon: const Icon(Icons.search),
                suffixIcon: _searchController.text.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          _searchController.clear();
                          context.read<ShopCubit>().updateList();
                        },
                      )
                    : Text("data"),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onChanged: _onSearchChanged,
            ),
          ),

          _buildFilterSection(),

          Expanded(
            child: BlocBuilder<ShopCubit, ShopState>(
              builder: (context, state) {
                if (state is ShopLoading)
                  return const Center(child: CircularProgressIndicator());
                if (state is ShopError)
                  return Center(child: Text("Error: ${state.message}"));

                if (state is ShopLoaded) {
                  return ListView.builder(
                    itemCount: state.shops.length,
                    itemBuilder: (context, index) =>
                        ShopCard(shop: state.shops[index]),
                  );
                }
                return const SizedBox();
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Text("Open Only"),
              Switch(
                value: _isOpenOnly,
                onChanged: (val) {
                  setState(() => _isOpenOnly = val);
                  context.read<ShopCubit>().updateList(
                    openOnly: val,
                    query: _searchController.text,
                    sortBy: _sortBy,
                  );
                },
              ),
            ],
          ),

          DropdownButton<String>(
            value: _sortBy,
            items: const [
              DropdownMenuItem(value: 'None', child: Text("Sort By")),
              DropdownMenuItem(value: 'ETA', child: Text("Fastest Delivery")),
              DropdownMenuItem(value: 'MinOrder', child: Text("Min Order")),
            ],
            onChanged: (val) {
              setState(() => _sortBy = val!);
              context.read<ShopCubit>().fetchShops();
            },
          ),
        ],
      ),
    );
  }
}
