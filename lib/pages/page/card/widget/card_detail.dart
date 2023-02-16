import 'package:flutter/services.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../app/navigator/router.dart';
import '../../../../data/network/services/payment_service.dart';
import '../bloc/card_bloc.dart';
import 'formater.dart';
import 'loading_button.dart';

class CardDetail extends StatefulWidget {
  const CardDetail({Key? key, required this.keyShow}) : super(key: key);
  final bool keyShow;

  @override
  State<CardDetail> createState() => _CardDetailState();
}

class _CardDetailState extends State<CardDetail> {
  late TextEditingController emailController;
  late TextEditingController nameCardController;
  late TextEditingController zipCodeController;
  late String country;

  CardDetails _card = CardDetails();
  final controller = CardFormEditController();

  @override
  void initState() {
    emailController = TextEditingController();
    nameCardController = TextEditingController();
    zipCodeController = TextEditingController();
    controller.addListener(update);
    super.initState();
  }

  void update() => setState(() {});

  @override
  void dispose() {
    controller.removeListener(update);
    controller.dispose();
    nameCardController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final cardBloc = BlocProvider.of<CardBloc>(context);
    return Stack(
      children: [
        Container(
          color: Colors.white24,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 24, right: 24, top: 20),
                child: SizedBox(
                    height: 50,
                    child: LoadingButton(
                        onPressed: () {
                          return Navigator.of(context).pushNamed(AppRoutes.home);
                        },
                        text: 'Pay',
                        color: Colors.white,
                        img: 'assets/images/apple1.png')),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24, right: 24),
                child: Row(
                  children: [
                    const Expanded(
                      flex: 1,
                      child: Divider(color: Colors.white54),
                    ),
                    Expanded(
                      flex: 1,
                      child: Center(
                          child: Text(
                              'Or pay with card',
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              ))),),
                    const Expanded(
                      flex: 1,
                      child: Divider(color: Colors.white54),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24, right: 24, top: 20),
                child: _formTextCard(),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: LoadingButton(
                  text: '\$ 123.32',
                  onPressed: _handlePayPress,
                  color: Colors.white54,
                  img: null,
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text('Powered by', style: Theme.of(context).textTheme.bodyMedium),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                          'Stripe',
                          style: Theme.of(context).textTheme.headline6?.copyWith(
                            color: Colors.white,
                            fontSize: 20
                          )
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Terms', style: Theme.of(context).textTheme.bodyMedium),
                      const SizedBox(
                        width: 20,
                      ),
                      Text('Privacy', style: Theme.of(context).textTheme.bodyMedium),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 60,
              ),
            ],
          ),
        ),
        widget.keyShow ? Container() : Container(color: Colors.black26, height: 600,),
      ],
    );
  }

  Future<void> _handlePayPress() async {
    await Stripe.instance.dangerouslyUpdateCardDetails(_card);
    try {
      final billingDetails = BillingDetails(
        email: emailController.text,
        name: nameCardController.text,
        phone: '+84374735275',
        address: const Address(
          city: 'Da Nang',
          country: 'VN',
          line1: '381 Tran Hung Dao',
          line2: '',
          state: 'Ngu Hanh Son',
          postalCode: '50000',
        ),
      ); // mocked data for tests

      // 2. Create payment method
      final paymentMethod = await Stripe.instance.createPaymentMethod(
          params: PaymentMethodParams.card(
            paymentMethodData: PaymentMethodData(
              billingDetails: billingDetails,
            ),
          ));

      // 3. call API to create PaymentIntent
      final paymentIntentResult =
      await cardServices.callNoWebhookPayEndpointMethodId(
        useStripeSdk: true,
        paymentMethodId: paymentMethod.id,
        currency: 'usd', // mocked data
        items: [
          'id-1',
        ], price: 12,
      );

      if (paymentIntentResult['error'] != null) {
        // Error during creating or confirming Intent
        print('Error1: ${paymentIntentResult['error']}');
        return;
      }
      if (paymentIntentResult['clientSecret'] != null &&
          paymentIntentResult['requiresAction'] == null) {
        print('Success!: The payment was confirmed successfully!');
        return;
      }
      if (paymentIntentResult['clientSecret'] != null &&
          paymentIntentResult['requiresAction'] == true) {
        // 4. if payment requires action calling handleNextAction
        final paymentIntent = await Stripe.instance
            .handleNextAction(paymentIntentResult['clientSecret']);

        if (paymentIntent.status == PaymentIntentsStatus.RequiresConfirmation) {
          // 5. Call API to confirm intent
          await confirmIntent(paymentIntent.id);
        } else {
          print('Error2: ${paymentIntentResult['error']}');
        }
      }
    } catch (e) {
      print('Error: $e');
      rethrow;
    }
  }

  Future<void> confirmIntent(String paymentIntentId) async {
    final result = await cardServices.callNoWebhookPayEndpointIntentId(
        paymentIntentId: paymentIntentId);
    if (result['error'] != null) {
      print('Error: ${result['error']}');
    } else {
      print('Success!: The payment was confirmed successfully!');
    }
  }

  Widget _formTextCard() {
    return Column(
      children: [
        _formEmail(),
        const SizedBox(
          height: 20,
        ),
        _formNumber(),
        const SizedBox(
          height: 20,
        ),
        _formName(),
        const SizedBox(
          height: 20,
        ),
        _formCountry(),
      ],
    );
  }

  Widget _formEmail() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Email', style: Theme.of(context).textTheme.headline6),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 50,
          child: TextFormField(
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
                contentPadding: EdgeInsets.only(left: 10),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)))),
          ),
        ),
      ],
    );
  }

  Widget _formNumber() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Number Card',
            style: Theme.of(context).textTheme.headline6
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          // height: 50,
          child: TextFormField(
            onChanged: (number) {
              setState(() {
                _card = _card.copyWith(number: number);
              });
            },
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(16),
              CardNumberInputFormatter()
            ],
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(left: 10),
                hintText: '1234 1234 1234 1234',
                hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white54),
                suffixIcon: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: SizedBox(
                      width: 115,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 25,
                            height: 20,
                            child: Image.asset(
                              'assets/images/card1.jpg',
                              fit: BoxFit.fill,
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          SizedBox(
                            width: 25,
                            height: 20,
                            child: Image.asset(
                              'assets/images/card2.jpg',
                              fit: BoxFit.fill,
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          SizedBox(
                            width: 25,
                            height: 20,
                            child: Image.asset(
                              'assets/images/card3.jpg',
                              fit: BoxFit.fill,
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          SizedBox(
                            width: 25,
                            height: 20,
                            child: Image.asset(
                              'assets/images/card4.jpg',
                              fit: BoxFit.fill,
                            ),
                          ),
                        ],
                      )),
                ),
                border: const OutlineInputBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8.0),
                        topRight: Radius.circular(8.0)))),
          ),
        ),
        SizedBox(
          // height: 50,
          child: Row(
            children: [
              Expanded(
                  flex: 1,
                  child: TextFormField(
                    // controller: expirationYear,
                    onChanged: (number) {
                      setState(() {
                        _card = _card.copyWith(
                            expirationMonth: int.tryParse(format
                                .getExpirationFromTextField(number,
                                type: 'month')
                                .toString()),
                            expirationYear: int.tryParse(format
                                .getExpirationFromTextField(number)
                                .toString()));
                      });
                    },
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(4),
                      CardMonthInputFormatter(),
                    ],
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.datetime,
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(left: 10),
                        hintText: 'MM/YY',
                        hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white54),
                        border: const OutlineInputBorder(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(8.0)))),
                  )),
              Expanded(
                  flex: 1,
                  child: TextFormField(
                    onChanged: (number) {
                      setState(() {
                        _card = _card.copyWith(cvc: number);
                      });
                    },
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(3),
                    ],
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(left: 10),
                        hintText: 'CVC',
                        hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white54),
                        suffixIcon: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: SizedBox(
                            width: 25,
                            child: Image.asset(
                              'assets/images/card5.jpg',
                              width: 25,
                              height: 10,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        border: const OutlineInputBorder(
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(10.0)))),
                  ))
            ],
          ),
        ),
      ],
    );
  }

  Widget _formName() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Name on card',
          style: Theme.of(context).textTheme.headline6,
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 50,
          child: TextFormField(
            controller: nameCardController,
            onChanged: (name) {
              setState(() {});
            },
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(
                contentPadding: EdgeInsets.only(left: 10),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)))),
          ),
        ),
      ],
    );
  }

  Widget _formCountry() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Country or region',
          style: Theme.of(context).textTheme.headline6,
        ),
        const SizedBox(
          height: 10,
        ),
        // BlocProvider<HomeBloc>(
        //   create: (context) =>
        //   HomeBloc(context.read())..add(HomeEvent.loadCities),
        //   child: BlocBuilder<HomeBloc, HomeState>(
        //     builder: (context, HomeState state) {
        //       if (state is LoadCitiesSuccess) {
        //         return DropdownButtonFormField(
        //           menuMaxHeight: 200,
        //           items: state.cities
        //               .map((city) => DropdownMenuItem<City>(
        //             value: city,
        //             child: Text(city.name),
        //           ))
        //               .toList(),
        //           value: state.cities.first,
        //           onChanged: (Object? value) {},
        //           decoration: const InputDecoration(
        //             contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
        //             enabledBorder: OutlineInputBorder(
        //               borderRadius: BorderRadius.only(
        //                   topRight: Radius.circular(8.0),
        //                   topLeft: Radius.circular(8.0)),
        //               borderSide: BorderSide(color: Colors.grey, width: 0),
        //             ),
        //             focusedBorder: OutlineInputBorder(
        //               borderRadius: BorderRadius.only(
        //                   topRight: Radius.circular(8.0),
        //                   topLeft: Radius.circular(8.0)),
        //               borderSide: BorderSide(color: Colors.grey, width: 0),
        //             ),
        //           ),
        //         );
        //       }
        //       return const Text('');
        //     },
        //   ),
        // ),
        SizedBox(
          height: 50,
          child: TextFormField(
            controller: zipCodeController,
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(5),
            ],
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(left: 10),
                hintText: 'ZIP',
                hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white54),
                border: const OutlineInputBorder(
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(8.0),
                        bottomLeft: Radius.circular(8.0)))),
          ),
        ),
      ],
    );
  }
}
