import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'property_detail_event.dart';
part 'property_detail_state.dart';

class PropertyDetailBloc extends Bloc<PropertyDetailEvent, PropertyDetailState> {
  PropertyDetailBloc() : super(PropertyDetailInitial()) {
    on<PropertyDetailEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
