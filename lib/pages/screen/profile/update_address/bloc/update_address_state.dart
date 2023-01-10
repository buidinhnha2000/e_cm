part of 'update_address_bloc.dart';

@immutable
abstract class UpdateAddressState {}

class UpdateAddressInitial extends UpdateAddressState {}

class LoadingAddressState extends UpdateAddressState {}

class SuccessAddressState extends UpdateAddressState {
  final Address address;

  SuccessAddressState(this.address);
}

class FailureAddressState extends UpdateAddressState {
  final String error;

  FailureAddressState(this.error);
}
