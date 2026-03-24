part of 'user_profile_bloc.dart';

abstract class UserProfileEvent {}

class LoadUserPRofile extends UserProfileEvent {}

class UpdatuserProfile extends UserProfileEvent {
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  UpdatuserProfile.UpdateUserProfile(
      {required this.firstName,
      required this.lastName,
      required this.email,
      required this.phone});
}
