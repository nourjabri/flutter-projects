part of 'user_profile_bloc.dart';

abstract class UserProfileEvent {}

class LoadUserPRofile extends UserProfileEvent {}

class UpdateUserProfileEvent extends UserProfileEvent {
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  UpdateUserProfileEvent(
      {required this.firstName,
      required this.lastName,
      required this.email,
      required this.phone});
}
