import 'package:app/model/CollectionModel.dart';
import 'package:app/services/CollectionAPI/services.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'collection_state.dart';

class CollectionCubit extends Cubit<CollectionState> {
  final Services services;
  CollectionCubit(this.services) : super(CollectionInitial());

  void Collection() async {
    try {
      collectionModel? data = await services.CollectionAPI();
      if (data != null) {
        emit(CollextionData(collection: data));
      } else {
        emit(CollectionError(message: "date not found"));
      }
    } catch (e) {
      emit(CollectionError(message: "date not found"));
    }
  }
}
