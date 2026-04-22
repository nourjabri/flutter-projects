part of 'user_profile_bloc.dart';

abstract class UserProfileState {}

class UserProfileInitial extends UserProfileState {}

class UserProfileLoading extends UserProfileState {}

class UserProfileLoaded extends UserProfileState {
  final Map<String, dynamic> user;
  UserProfileLoaded(this.user);
}

class UserProfileFailed extends UserProfileState {
  final String message;
  UserProfileFailed(this.message);
}

class UserProfileUpdateSuccess extends UserProfileState {}
