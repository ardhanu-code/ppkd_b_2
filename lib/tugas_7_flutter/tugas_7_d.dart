import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class TugasTujuhD extends StatefulWidget {
  const TugasTujuhD({super.key});

  @override
  State<TugasTujuhD> createState() => _TugasTujuhDState();
}

class _TugasTujuhDState extends State<TugasTujuhD> {
  DateTime? selectedDate;

  @override
  void initState() {
    super.initState();
    initializeDateFormatting('id_ID', null);
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2000, 1, 1),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  String get formattedDate {
    if (selectedDate == null) {
      return 'Tanggal Lahir: ';
    }
    return 'Tanggal Lahir: ${DateFormat("d MMMM yyyy", "id_ID").format(selectedDate!)}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => _selectDate(context),
              child: const Text('Pilih Tanggal Lahir'),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                foregroundColor: Colors.white,
                backgroundColor: Colors.blue,
              ),
            ),
            const SizedBox(height: 18),
            Text(formattedDate, style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
