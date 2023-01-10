import 'package:e_cm/data/model/address/address.dart';
import 'package:e_cm/data/network/services/address_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'update_address_event.dart';
part 'update_address_state.dart';

class UpdateAddressBloc extends Bloc<UpdateAddressEvent, UpdateAddressState> {
  UpdateAddressBloc() : super(UpdateAddressInitial()) {
    on<OnUpdateAddressEvent>(_updateAddress);
  }

  Future<void> _updateAddress(
      OnUpdateAddressEvent event, Emitter<UpdateAddressState> emit) async {

    emit(LoadingAddressState());
    final address = await addressService.updateAddress(event.userId, event.name,
        event.email, event.phone, event.address, event.country, event.city);
    print(address);
    emit(SuccessAddressState(address!));
  }
}
