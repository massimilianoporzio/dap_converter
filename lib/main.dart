import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_field_validator/form_field_validator.dart';

void main() {
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

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();
  double _value = 1.0;
  final TextEditingController _dapController =
      TextEditingController(text: "1.0");
  @override
  void dispose() {
    _dapController.dispose();
    super.dispose();
  }

  double _convertedValue = 1.0;
  String _fromUnit = "from1";
  String _toUnit = "to1";

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        child: Form(
          key: _formKey,
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 0.0),
                      child: SizedBox(
                        width: 120,
                        child: TextFormField(
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp('[0-9.,]+')),
                          ],
                          validator: MultiValidator([
                            RequiredValidator(errorText: "Required"),
                          ]),
                          controller: _dapController,
                          decoration: const InputDecoration(
                            floatingLabelStyle: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                            labelText: 'DAP to convert',
                            border: OutlineInputBorder(),
                          ),
                          keyboardType: const TextInputType.numberWithOptions(
                              decimal: true),
                        ),
                      ),
                    ),
                    const Text(
                      'from',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: DropdownButton(
                          value: _fromUnit,
                          items: const [
                            DropdownMenuItem(
                              value: 'from1',
                              child: Text('Gycm²'),
                            ),
                            DropdownMenuItem(
                              value: 'from2',
                              child: Text('mGym²'),
                            ),
                          ],
                          onChanged: (value) {
                            setState(() {
                              _fromUnit = value.toString();
                            });
                          }),
                    )
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                const Text(
                  'to',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                const SizedBox(
                  height: 16,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 0),
                  child: DropdownButton(
                      value: _toUnit,
                      items: const [
                        DropdownMenuItem(
                          value: 'to1',
                          child: Text('dGycm²'),
                        ),
                        DropdownMenuItem(
                          value: 'to2',
                          child: Text('mGym²'),
                        ),
                      ],
                      onChanged: (value) {
                        setState(() {
                          _toUnit = value.toString();
                        });
                      }),
                ),
                const SizedBox(
                  height: 32,
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                  decoration: BoxDecoration(border: Border.all()),
                  child: Text(
                    '$_convertedValue',
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                ElevatedButton(
                  onPressed: () {
                    //TODO: CHECK SE UNITA' UGUALI
                  },
                  child: const Text('Convert'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
