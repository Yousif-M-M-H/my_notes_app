import 'package:flutter/material.dart';

class SaveAndUpdateDialog extends StatelessWidget {
  const SaveAndUpdateDialog(
      {super.key,
      this.onSavePressed,
      this.onDiscardPressed,
      required this.redButtonTitle});
  final void Function()? onSavePressed;
  final void Function()? onDiscardPressed;
  final String redButtonTitle;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      backgroundColor: const Color(0xFF252525),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.save,
            size: 40,
            color: Color(0xFF606060),
          ),
          const SizedBox(height: 16),
          const Text(
            'Save changes',
            style: TextStyle(color: Colors.white),
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: onDiscardPressed,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
                child: Text(
                  redButtonTitle,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              ElevatedButton(
                onPressed: onSavePressed,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF30BE71),
                ),
                child: const Text(
                  'Save',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
