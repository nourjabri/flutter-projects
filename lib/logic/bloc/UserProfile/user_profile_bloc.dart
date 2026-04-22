import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:clickresturant/data/repositories/auth_repository.dart';

part 'user_profile_event.dart';
part 'user_profile_state.dart';

class UserProfileBloc extends Bloc<UserProfileEvent, UserProfileState> {
  final AuthRepository authRepo;
  UserProfileBloc(this.authRepo) : super(UserProfileInitial()) {
    on<LoadUserPRofile>((event, emit) async {
      emit(UserProfileLoading());
      try {
        final data = await authRepo.getUserData();
        if (data != null) {
          emit(UserProfileLoaded(data));
        } else {
          emit(UserProfileFailed("Failed to load data"));
        }
      } catch (e) {
        emit(UserProfileFailed(e.toString()));
      }
    });
    on<UpdateUserProfileEvent>((event, emit) async {
      emit(UserProfileLoading());
      try {
        final uid = FirebaseAuth.instance.currentUser!.uid;
        await FirebaseFirestore.instance.collection("users").doc(uid).update({
          "firstName": event.firstName,
          "lastName": event.lastName,
          "phone": event.phone,
          "email": event.email,
        });
        final snapshot =
            await FirebaseFirestore.instance.collection("users").doc(uid).get();
        emit(UserProfileLoaded(snapshot.data()!));
      } catch (e) {
        emit(UserProfileFailed("Failed to save your update"));
      }
    });
  }
}
