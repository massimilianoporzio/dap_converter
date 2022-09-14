import 'package:dap_converter/components/dap_units.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:footer/footer.dart';
import 'package:footer/footer_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

void main() {
  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('google_fonts/OFL.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], license);
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DAP converter',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: const MyHomePage(title: 'DAP Converter'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

//Validator for double numbers

String? Function(String?) doubleValidator = (String? value) {
  if (value!.isEmpty) {
    return 'DAP value must be entered';
  } else {
    return double.tryParse(value) == null ? "DAP value must be a number" : null;
  }
};

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();

  // String get fromDAPString {
  //   return _fromDAP.toString();
  // }

  final TextEditingController _dapController = TextEditingController();
  bool _hideError = false;
  bool _first = true;

  void _printLatestValue() {
    print('DAP text field: ${_dapController.text}');
  }

  @override
  void dispose() {
    _dapController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _fromDAP = 1.0;
    _dapController.text = "---";
    // Start listening to changes.
    _dapController.addListener(_printLatestValue);
  }

  double _convertedValue = double.nan;
  late double _fromDAP;
  String _fromUnit = listaFromUnits[0].value;
  String _toUnit = listaToUnits[0].value;

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(
          widget.title,
          style: GoogleFonts.libreFranklin(
              fontSize: 30, fontWeight: FontWeight.w400),
        ),
      ),
      body: Form(
        autovalidateMode: AutovalidateMode.disabled,
        key: _formKey,
        child: Container(
          height: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.contain,
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.24), BlendMode.dstATop),
                  image: const AssetImage('images/DAP.jpg'))),
          width: MediaQuery.of(context).size.width,
          child: FooterView(
            footer: Footer(
              child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Text(
                        'Copyright ©2022, All Rights Reserved.',
                        style: GoogleFonts.libreFranklin(),
                      ),
                      Text('Created by Massimiliano Porzio.',
                          style: GoogleFonts.libreFranklin())
                    ],
                  )),
            ),
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(
                    height: 32,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 0.0, vertical: 20),
                    child: SizedBox(
                      width: 200,
                      child: TextFormField(
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                        textAlign: TextAlign.center,
                        inputFormatters: [
                          FilteringTextInputFormatter.deny(',',
                              replacementString: '.'),
                          FilteringTextInputFormatter.allow(RegExp('[0-9.,]+')),
                        ],
                        validator: doubleValidator,
                        onChanged: (value) {
                          setState(() {
                            _hideError = false;
                            _first = false;
                          });
                        },
                        controller: _dapController,
                        decoration: _hideError && !_first
                            ? InputDecoration(
                                errorMaxLines: 2,
                                suffixIcon: _dapController.text == "---"
                                    ? null
                                    : IconButton(
                                        onPressed: (() {
                                          setState(() {
                                            _convertedValue = double.nan;
                                            _dapController.text = "---";
                                            _first = true;
                                            _hideError = true;
                                          });
                                        }),
                                        icon: Icon(Icons.clear),
                                      ),
                                floatingLabelStyle: GoogleFonts.libreFranklin(
                                    textStyle: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600)),
                                labelText: 'DAP to convert',
                                border: const OutlineInputBorder(),
                              )
                            : null,
                        keyboardType: const TextInputType.numberWithOptions(
                            decimal: true),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'from',
                        style: GoogleFonts.libreFranklin(
                            textStyle: const TextStyle(
                                fontStyle: FontStyle.italic, fontSize: 20)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 0),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                              style: GoogleFonts.libreFranklin(
                                  textStyle: const TextStyle(
                                fontWeight: FontWeight.w700,
                                color: Colors.black,
                                fontSize: 20,
                              )),
                              focusColor: Colors.amber,
                              value: _fromUnit,
                              items: listaFromUnits
                                  .map((e) => DropdownMenuItem(
                                      value: e.value,
                                      child: Text(e.description)))
                                  .toList(),
                              onChanged: (value) {
                                setState(() {
                                  _fromUnit = value.toString();
                                  _convertedValue = double.nan;
                                });
                              }),
                        ),
                      ),
                      Text(
                        'to',
                        style: GoogleFonts.libreFranklin(
                            textStyle: const TextStyle(
                                fontStyle: FontStyle.italic, fontSize: 20)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 0),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                              style: GoogleFonts.libreFranklin(
                                  textStyle: const TextStyle(
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black,
                                      fontSize: 20)),
                              focusColor: Colors.amber,
                              value: _toUnit,
                              items: listaToUnits
                                  .map((e) => DropdownMenuItem(
                                      value: e.value,
                                      child: Text(e.description)))
                                  .toList(),
                              onChanged: (value) {
                                setState(() {
                                  _toUnit = value.toString();
                                  _convertedValue = double.nan;
                                });
                              }),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  SizedBox(
                    width: 200,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          //TODO: DO CONVERSION
                          double fromDAP = double.parse(_dapController.text);
                          Map mappa = conversionFactors;
                          dynamic conversionFactorsForUnit = mappa[_fromUnit];

                          double factor = 1.0;
                          if (conversionFactorsForUnit != null) {
                            factor = conversionFactorsForUnit[_toUnit] ?? 1.0;
                          }

                          // print('factor is ' + factor.toString());
                          setState(() {
                            _convertedValue = factor * fromDAP;
                            _hideError = true; //tolgo la visualizz degli errori
                          });
                        }
                      },
                      child: Text(
                        'Convert',
                        style: GoogleFonts.libreFranklin(
                            textStyle: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w600)),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Container(
                    width: 200,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 32),
                    decoration: BoxDecoration(border: Border.all()),
                    child: Text(
                      _convertedValue.isNaN
                          ? "---"
                          : _convertedValue.toStringAsPrecision(3),
                      style: GoogleFonts.libreFranklin(
                          textStyle: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                              color: Colors.black)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
