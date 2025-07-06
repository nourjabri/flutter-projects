part of 'parent_bloc.dart';

@immutable
abstract class ParentState {}

class ParentInitial extends ParentState {}

class ParentLoading extends ParentState {}

class ParentLoaded extends ParentState {
  final List<ParentModel> parents;

  ParentLoaded(this.parents);
}

class ParentCreated extends ParentState {}

class ParentError extends ParentState {
  final String message;

  ParentError(this.message);
}
