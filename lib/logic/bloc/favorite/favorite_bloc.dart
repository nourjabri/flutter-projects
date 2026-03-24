import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:clickresturant/data/model/product_model.dart';

part 'favorite_event.dart';
part 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  final FirebaseFirestore firestore;
  final String userId;

  FavoriteBloc(this.firestore, this.userId) : super(FavoriteInitial()) {
    on<LoadFavorites>(_load);
    on<AddToFavorite>(_add);
    on<RemoveFromFavorite>(_remove);
  }

  Future<void> _load(LoadFavorites event, Emitter<FavoriteState> emit) async {
    emit(FavoriteLoading());
    try {
      final snap = await firestore
          .collection("users")
          .doc(userId)
          .collection("favorites")
          .get();

      final items =
          snap.docs.map((e) => ProductModel.fromJson(e.data())).toList();

      emit(FavoriteLoaded(items));
    } catch (e) {
      emit(FavoriteError(e.toString()));
    }
  }

  Future<void> _add(AddToFavorite event, Emitter<FavoriteState> emit) async {
    await firestore
        .collection("users")
        .doc(userId)
        .collection("favorites")
        .doc(event.product.proId)
        .set(event.product.toMap());

    add(LoadFavorites());
  }

  Future<void> _remove(
      RemoveFromFavorite event, Emitter<FavoriteState> emit) async {
    await firestore
        .collection("users")
        .doc(userId)
        .collection("favorites")
        .doc(event.productId)
        .delete();

    add(LoadFavorites());
  }
}
