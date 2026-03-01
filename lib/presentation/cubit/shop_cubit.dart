import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:quranapp/domain/entites/shop_entity.dart';
import 'package:quranapp/domain/repositories/shop_repository.dart';

part 'shop_state.dart';


class ShopCubit extends Cubit<ShopState> {
  final ShopRepository repository;

  List<ShopEntity> _allShops = [];

  ShopCubit(this.repository) : super(ShopInitial());

  Future<void> fetchShops() async {
    emit(ShopLoading());

    final result = await repository.getShops();

    result.fold(
      (error) => emit(ShopError(error)),
      (shops) {
        _allShops = shops;
        emit(shops.isEmpty ? ShopEmpty() : ShopLoaded(shops));
      },
    );
  }

  void updateList({
    String query = '',
    bool openOnly = false,
    String sortBy = 'None',
  }) {
    List<ShopEntity> filtered = List.from(_allShops);

    if (query.isNotEmpty) {
      filtered = filtered.where((s) =>
          s.name.toLowerCase().contains(query.toLowerCase()) ||
          s.description.toLowerCase().contains(query.toLowerCase())).toList();
    }

    if (openOnly) {
      filtered = filtered.where((s) => s.isOpen).toList();
    }

    if (sortBy == 'ETA') {
      filtered.sort((a, b) => a.eta.compareTo(b.eta));
    } else if (sortBy == 'MinOrder') {
      filtered.sort((a, b) => a.minOrder.compareTo(b.minOrder));
    }

    emit(filtered.isEmpty ? ShopEmpty() : ShopLoaded(filtered));
  }
}
