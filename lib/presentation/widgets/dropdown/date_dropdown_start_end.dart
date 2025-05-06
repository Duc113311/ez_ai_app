import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

class DateDropdownStartEnd extends StatefulWidget {
  final DateTime? initialStartDate;
  final DateTime? initialEndDate;

  const DateDropdownStartEnd({
    super.key,
    this.initialStartDate,
    this.initialEndDate,
  });

  @override
  State<DateDropdownStartEnd> createState() => _DateDropdownStartEnd();
}

class _DateDropdownStartEnd extends State<DateDropdownStartEnd> {
  late DateTime? _startDate;
  late DateTime? _endDate;
  String? _errorText;
  bool _showError = false;

  @override
  void initState() {
    super.initState();
    _startDate = widget.initialStartDate;
    _endDate = widget.initialEndDate;
  }

  Future<void> _pickDate({required bool isStart}) async {
    final now = DateTime.now();
    final initial = isStart ? (_startDate ?? now) : (_endDate ?? now);

    final picked = await showDatePicker(
      context: context,
      initialDate: initial,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      setState(() {
        if (isStart) {
          _startDate = picked;
          if (_endDate != null && _endDate!.isBefore(_startDate!)) {
            _showError = true;
            _errorText = 'End date cannot be earlier than start date';
          } else {
            _showError = false;
            _errorText = null;
          }
        } else {
          if (_startDate != null && picked.isBefore(_startDate!)) {
            _endDate = null;
            _showError = true;
            _errorText = 'End date cannot be earlier than start date';
          } else {
            _endDate = picked;
            _showError = false;
            _errorText = null;
          }
        }
      });
    }
  }

  void _clearStartDate() {
    setState(() {
      _startDate = null;
      _showError = false;
      _errorText = null;
    });
  }

  void _clearEndDate() {
    setState(() {
      _endDate = null;
      _showError = false;
      _errorText = null;
    });
  }

  void _validateDates() {
    if (_startDate != null && _endDate != null) {
      if (_endDate!.isBefore(_startDate!)) {
        setState(() {
          _showError = true;
          _errorText = 'End date cannot be earlier than start date';
        });
        return;
      }
    }

    Navigator.pop(context, {
      'startDate': _startDate,
      'endDate': _endDate,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Select Date',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.pop(context),
                )
              ],
            ),
            const SizedBox(height: 16),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text('Start date',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16)),
            ),
            const SizedBox(height: 4),
            TextFormField(
              readOnly: true,
              onTap: () => _pickDate(isStart: true),
              decoration: InputDecoration(
                hintText: 'Select start date',
                suffixIcon: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (_startDate != null)
                      IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: _clearStartDate,
                      ),
                    IconButton(
                      icon: SvgPicture.asset(
                        'assets/icons/ic_calendar.svg',
                        width: 16,
                        height: 16,
                      ),
                      onPressed: () => _pickDate(isStart: true),
                    ),
                  ],
                ),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              ),
              controller: TextEditingController(
                text: _startDate != null
                    ? DateFormat('dd/MM/yyyy').format(_startDate!)
                    : '',
              ),
            ),
            const SizedBox(height: 12),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text('End date',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16)),
            ),
            const SizedBox(height: 4),
            TextFormField(
              readOnly: true,
              onTap: () => _pickDate(isStart: false),
              decoration: InputDecoration(
                hintText: 'Select end date',
                suffixIcon: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (_endDate != null)
                      IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: _clearEndDate,
                      ),
                    IconButton(
                      icon: SvgPicture.asset(
                        'assets/icons/ic_calendar.svg',
                        width: 16,
                        height: 16,
                      ),
                      onPressed: () => _pickDate(isStart: false),
                    ),
                  ],
                ),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              ),
              controller: TextEditingController(
                text: _endDate != null
                    ? DateFormat('dd/MM/yyyy').format(_endDate!)
                    : '',
              ),
            ),
            if (_showError && _errorText != null)
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    _errorText!,
                    style: const TextStyle(color: Colors.red, fontSize: 12),
                  ),
                ),
              ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _validateDates,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1D6854),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                padding: const EdgeInsets.symmetric(horizontal: 12),
              ),
              child: const Text('DONE',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.white)),
            )
          ],
        ),
      ),
    );
  }
}

Future<Map<String, DateTime?>?> openDateRangePicker({
  required BuildContext context,
  DateTime? initialStartDate,
  DateTime? initialEndDate,
}) {
  return showModalBottomSheet<Map<String, DateTime?>>(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    builder: (_) => DateDropdownStartEnd(
      initialStartDate: initialStartDate,
      initialEndDate: initialEndDate,
    ),
  );
}
