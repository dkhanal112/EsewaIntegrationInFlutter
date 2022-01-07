import 'package:esewa_pnp/esewa.dart';
import 'package:flutter/material.dart';
import 'package:esewa_pnp/esewa_pnp.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () async {
            _initpayment();
          },
          child: Container(
            color: Colors.green,
            height: 100,
            margin: EdgeInsets.all(20),
            child: Center(
              child: Text(
                "Pay with esewa",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  _initpayment() async {
    ESewaConfiguration _configuration = ESewaConfiguration(
      clientID: "JB0BBQ4aD0UqIThFJwAKBgAXEUkEGQUBBAwdOgABHD4DChwUAB0R",
      secretKey: "BhwIWQQADhIYSxILExMcAgFXFhcOBwAKBgAXEQ==",
      environment: ESewaConfiguration.ENVIRONMENT_TEST,
    );

    ESewaPnp _esewapnp = ESewaPnp(configuration: _configuration);

    ESewaPayment _payment = ESewaPayment(
        amount: 10,
        productName: "Test Product",
        productID: "1",
        callBackURL: "http://example.com/");

    final _res = await _esewapnp.initPayment(payment: _payment);

    print("Esewa ko response");
    print(_res.status);
    print(_res.message);
    print(_res.referenceId);
    print(_res.totalAmount);
    return _res;
  }
}
