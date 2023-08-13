import 'package:flutter/cupertino.dart';

class Cupertino extends StatefulWidget {
  const Cupertino({super.key});

  @override
  State<Cupertino> createState() => _CupertinoState();
}

class _CupertinoState extends State<Cupertino> {
  double result = 0;
  TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        backgroundColor: CupertinoColors.activeBlue,
        middle: Text('Currency Converter'),
      ),
      backgroundColor: const Color.fromRGBO(255, 253, 253, 1),
      child: Center(
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
                  // color: Color.fromRGBO(8, 184, 5, 1),
                  color: CupertinoColors.activeBlue,
                ),
              ),
              CupertinoTextField(
                placeholder: 'Enter Amount',
                prefix: const Icon(CupertinoIcons.money_dollar),
                controller: textEditingController,
                style: const TextStyle(
                  color: CupertinoColors.activeBlue,
                  fontWeight: FontWeight.w600,
                  fontSize: 23,
                ),
                decoration: BoxDecoration(
                  color: CupertinoColors.white,
                  border: Border.all(),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
              ),
              // Container(height: 10),
              const SizedBox(height: 10),
              CupertinoButton(
                onPressed: () {
                  // since 'textEditingController' gives output in string
                  // type cast it into double
                  // 'setState' to rebuild the func.
                  // only necessary widgets gets rebuild
                  result = double.parse(textEditingController.text) * 82.9;
                  setState(() {});
                },
                color: const Color.fromARGB(255, 0, 42, 252),
                child: const Text('Convert'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
