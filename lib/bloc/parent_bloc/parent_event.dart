part of 'parent_bloc.dart';

@immutable
abstract class ParentEvent {}

class GetAllParents extends ParentEvent {}

class CreateParent extends ParentEvent {
  final ParentModel parent;

  CreateParent(this.parent);
}
