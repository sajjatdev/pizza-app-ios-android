part of 'collection_cubit.dart';

@immutable
abstract class CollectionState {}

class CollectionInitial extends CollectionState {}

class CollextionData extends CollectionState {
  final collectionModel collection;

  CollextionData({required this.collection});
}

class CollectionError extends CollectionState {
  final String message;

  CollectionError({required this.message});
}
