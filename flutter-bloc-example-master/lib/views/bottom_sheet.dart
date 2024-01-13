import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/user.dart';

class BottomSheet extends StatelessWidget {
  final User user;
  final bool isEdit;
  final int id;

  const BottomSheet({
    super.key,
    required this.user,
    required this.isEdit,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildTextField(
              controller: TextEditingController(), hint: 'Enter Name'),
          _buildTextField(
              controller: TextEditingController(), hint: 'Enter Email'),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('Update'),
            ),
          )
        ],
      ),
    );
  }

  static Widget _buildTextField({
    required TextEditingController controller,
    required String hint,
  }) =>
      Padding(
        padding: const EdgeInsets.all(12.0),
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: hint,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      );
}
