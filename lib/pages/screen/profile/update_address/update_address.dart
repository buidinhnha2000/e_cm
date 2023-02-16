import 'package:e_cm/app/navigator/router.dart';
import 'package:e_cm/data/network/helper/secure_storage.dart';
import 'package:e_cm/l10n/l10n.dart';
import 'package:e_cm/pages/page/login/component/text_form_frave.dart';
import 'package:e_cm/pages/screen/profile/update_address/bloc/update_address_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../page/login/component/validationform.dart';
import '../../../page/product_detail/component/product_detail_header.dart';
import 'package:csc_picker/csc_picker.dart';

class UpdateAddress extends StatefulWidget {
  const UpdateAddress({Key? key}) : super(key: key);

  @override
  State<UpdateAddress> createState() => _UpdateAddressState();
}

class _UpdateAddressState extends State<UpdateAddress> {
  late TextEditingController _name;
  late TextEditingController _email;
  late TextEditingController _phone;
  late TextEditingController _address;

  // late TextEditingController _country;
  // late TextEditingController _city;
  late String _country;
  late String _city;
  String countryValue = "";
  String? stateValue = "";
  String? cityValue = "";

  @override
  void initState() {
    _name = TextEditingController();
    _email = TextEditingController();
    _phone = TextEditingController();
    _address = TextEditingController();
    _country = 'Viet Nam';
    _city = 'Da Nang';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final updateAddressBloc = BlocProvider.of<UpdateAddressBloc>(context);

    return BlocListener<UpdateAddressBloc, UpdateAddressState>(
      listener: (context, state) {
        if (state is LoadingAddressState) {
        } else if (state is FailureAddressState) {
          Navigator.of(context).pushNamed(AppRoutes.addressList);
        } else if (state is SuccessAddressState) {
          Navigator.of(context).pushNamed(AppRoutes.addressList);
        }
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          actions: const [
            ProductDetailHeader(),
          ],
          title: Text(
            context.l10n!.text_update_address,
            style: const TextStyle(color: Colors.white, fontSize: 23),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "User Name :",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextFormFrave(
                    controller: _name,
                    hintText: 'Full name',
                    prefixIcon:
                        const Icon(Icons.drive_file_rename_outline_outlined),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Email :",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextFormFrave(
                    controller: _email,
                    hintText: 'Email Address',
                    keyboardType: TextInputType.emailAddress,
                    prefixIcon: const Icon(Icons.email_outlined),
                    validator: validatedEmail,
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Phone :",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextFormFrave(
                    controller: _phone,
                    hintText: 'Phone number',
                    keyboardType: TextInputType.phone,
                    prefixIcon: const Icon(Icons.phone),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Country :",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  CSCPicker(
                    layout: Layout.horizontal,
                    onCountryChanged: (country) {
                      countryValue = country;
                    },
                    onStateChanged: (state) {
                      stateValue = state;
                    },
                    onCityChanged: (city) {
                      cityValue = city;
                    },
                    dropdownDecoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        color: Colors.black,
                        border:
                            Border.all(color: Colors.grey.shade300, width: 1)),
                    disabledDropdownDecoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        color: Colors.black54,
                        border: Border.all(color: Colors.white, width: 1)),
                    selectedItemStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                    dropdownHeadingStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                    dropdownItemStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                    ),
                    dropdownDialogRadius: 5.0,
                    searchBarRadius: 5.0,
                    countryDropdownLabel: "Country",
                    stateDropdownLabel: "State",
                    cityDropdownLabel: "City",
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextFormFrave(
                    controller: _address,
                    hintText: 'Address',
                    prefixIcon: const Icon(Icons.location_on_outlined),
                  ),
                ],
              ),
              const SizedBox(
                width: 5,
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: SizedBox(
                  height: 40,
                  width: 200,
                  child: OutlinedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.redAccent[400]),
                      ),
                      onPressed: () async {
                        final userId = await secureStorage.getUserId();
                        if (userId!.isNotEmpty == true) {
                          updateAddressBloc.add(OnUpdateAddressEvent(
                            userId,
                            _name.text.trim(),
                            _email.text.trim(),
                            int.parse(_phone.text),
                            _address.text.trim(),
                            _country.trim(),
                            _city.trim(),
                          ));
                        }
                      },
                      child: const Center(
                        child: Text(
                          'Update',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
