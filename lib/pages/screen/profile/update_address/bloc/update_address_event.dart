part of 'update_address_bloc.dart';

@immutable
abstract class UpdateAddressEvent {

}

class OnUpdateAddressEvent extends UpdateAddressEvent {
  final String userId;
  final String name;
  final String email;
  final int phone;
  final String address;
  final String country;
  final String city;

  OnUpdateAddressEvent(this.userId, this.name, this.email, this.phone, this.address, this.country, this.city);

}
