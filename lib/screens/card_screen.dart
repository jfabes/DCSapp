import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:flutter_card_scanner_latest/flutter_card_scanner_latest.dart';
import 'package:digital_card_service/cardScanResponse.dart';
import 'package:digital_card_service/constants.dart';
import 'package:flutter/services.dart';
import 'dart:convert';


class CardScreen extends StatefulWidget {
  static const String id = 'cardScreen';

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  String cardScanResponse = '';

  @override
  void initState() {
    super.initState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initCardScan() async {
    String scanResponse='';
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      String response = await FlutterCardScannerLatest.scanCard;
      //Parsing the response
      final CardScanResponse cardScanResponse =
      CardScanResponse.fromJSON(json.decode(response));
      //Reading the response and rendering it on the screen
      if (cardScanResponse.result == Constant.success) {
        scanResponse = cardScanResponse.responseText +
            '\n' +
            'Cardholder\'s Name : ' +
            cardScanResponse.body.cardholderName + '\n' +
            'Expiry : ' +
            cardScanResponse.body.expiry;
      } else {
        scanResponse = cardScanResponse.responseText;
      }
    } on PlatformException catch (e) {
      scanResponse = "Failed to scan the card ::: '${e.message}'.";
    }

    setState(() {
      cardScanResponse = scanResponse;
    });
  }


  bool showSpinner = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: const EdgeInsets.only(top: 40.0, left: 15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Align(
                  alignment: Alignment.topLeft,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: 50.0,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 200.0,
              ),
              RichText(
                text: new TextSpan(
                  style: new TextStyle(
                    fontSize: 20.0,
                    fontStyle: FontStyle.normal,
                    color: Colors.black,
                  ),
                  children: <TextSpan>[
                    new TextSpan(
                        text: cardScanResponse,
                        style: new TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation : FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: initCardScan,
        tooltip: 'Scan Card',
        elevation: 50.0,
        child: Icon(Icons.scanner),
      ),
    );
  }
}
