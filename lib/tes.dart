import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Tes extends StatefulWidget {
  @override
  _TesState createState() => _TesState();
}

class _TesState extends State<Tes> {
  int _currencyValue = 0;
  String _otherValue = '';

  void _showAlertDialog(BuildContext context) async {
    final result = await showDialog<Map<String, dynamic>>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Masukkan Data'),
          content: CurrencyInputFields(),
          actions: <Widget>[
            TextButton(
              child: Text('BATAL'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop(
                  {
                    'currency': CurrencyInputFields.currencyValue,
                    'other': CurrencyInputFields.otherValue,
                  },
                );
              },
            ),
          ],
        );
      },
    );

    if (result != null) {
      setState(() {
        _currencyValue = result['currency'] ?? 0;
        _otherValue = result['other'] ?? '';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contoh AlertDialog'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ElevatedButton(
              child: Text('Tampilkan AlertDialog'),
              onPressed: () => _showAlertDialog(context),
            ),
            SizedBox(height: 20),
            if (_currencyValue != 0 || _otherValue.isNotEmpty)
              Column(
                children: [
                  Text('Currency: $_currencyValue'),
                  Text('Other: $_otherValue'),
                ],
              ),
          ],
        ),
      ),
    );
  }
}

class CurrencyInputFields extends StatefulWidget {
  static int currencyValue = 0;
  static String otherValue = '';

  @override
  _CurrencyInputFieldsState createState() => _CurrencyInputFieldsState();
}

class _CurrencyInputFieldsState extends State<CurrencyInputFields> {
  final TextEditingController _currencyController = TextEditingController();
  final TextEditingController _otherController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _currencyController.addListener(_formatCurrency);
  }

  void _formatCurrency() {
    String text =
        _currencyController.text.replaceAll('Rp ', '').replaceAll('.', '');
    if (text.isNotEmpty) {
      int value = int.parse(text);
      String newText = 'Rp ' +
          value.toString().replaceAllMapped(
              RegExp(r'(\d)(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.');
      _currencyController.value = _currencyController.value.copyWith(
        text: newText,
        selection: TextSelection.collapsed(offset: newText.length),
      );
      CurrencyInputFields.currencyValue = value;
    } else {
      CurrencyInputFields.currencyValue = 0;
    }
  }

  @override
  void dispose() {
    _currencyController.dispose();
    _otherController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        TextField(
          controller: _currencyController,
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          decoration: InputDecoration(
            labelText: 'Field 1 (Mata Uang)',
          ),
        ),
        SizedBox(height: 8),
        TextField(
          controller: _otherController,
          onChanged: (value) {
            CurrencyInputFields.otherValue = value;
          },
          decoration: InputDecoration(
            labelText: 'Field 2',
          ),
        ),
      ],
    );
  }
}
