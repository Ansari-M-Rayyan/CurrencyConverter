import 'package:flutter/material.dart';

// LifeCycle :-
// 1. constructor
// 2.'createState()'
// 3.'build' function (if 'initState' is not present)
// After All , 'dispose' will run

class CCP extends StatefulWidget {
  const CCP({super.key});

  @override
  State<CCP> createState() => _CurrencyConverterPage();
}

// 'State' is an abstract class and cannot create a instance of it directly
// also 'State' makes our '_CurrencyConverterPage' class mutable
class _CurrencyConverterPage extends State<CCP> {
  double result = 0;
  // 'TextEditingController' gives us access to Text in entire Widget.
  TextEditingController textEditingController = TextEditingController();
  // note : 'build' func. should be as light(eg.no async tasks) as possible ,
  // bcs it have a potential to run many time (120hz)

  @override
  void dispose() {
    // make sure to dispose controllers to avoid memory leak issue.
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const border = OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(15),
      ),
      borderSide: BorderSide(
        color: Color.fromRGBO(8, 184, 5, 1),
        width: 2,
      ),
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(8, 184, 5, 1),
        title: const Text('Currency Converter'),
        elevation: 2,
      ),
      backgroundColor: const Color.fromRGBO(255, 253, 253, 1),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            // vertical alignment
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                // result is in double type ,but 'Text' only supports 'String'
                // therefore, type cast double into String
                '₹ ${result != 0 ? result.toStringAsFixed(2) : result.toStringAsFixed(0)}',
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(8, 184, 5, 1),
                ),
              ),
              TextField(
                controller: textEditingController,
                style: const TextStyle(
                  color: Color.fromRGBO(8, 184, 5, 1),
                  fontWeight: FontWeight.w600,
                  fontSize: 23,
                ),
                decoration: const InputDecoration(
                  hintText: 'Enter Amount',
                  hintStyle: TextStyle(
                    color: Color.fromARGB(116, 113, 113, 113),
                    fontWeight: FontWeight.bold,
                  ),
                  prefixIcon: Icon(
                    Icons.attach_money_rounded,
                    color: Color.fromRGBO(8, 184, 5, 1),
                    size: 35,
                  ),
                  helperText: '1USD = 82.9INR',
                  filled: true,
                  fillColor: Color.fromRGBO(210, 210, 210, 0.608),
                  focusedBorder: border,
                  enabledBorder: border,
                ),
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
              ),
              // Container(height: 10),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  // since 'textEditingController' gives output in string
                  // type cast it into double
                  // 'setState' to rebuild the func.
                  // only necessary widgets gets rebuild
                  result = double.parse(textEditingController.text) * 82.9;
                  setState(() {});
                },
                style: TextButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(8, 184, 5, 1),
                  foregroundColor: const Color.fromRGBO(255, 255, 255, 1),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text('Convert'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
