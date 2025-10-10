import 'package:flutter/material.dart';
import 'package:taskgameproject/screen/create_a_new_Task_screen.dart';
import 'package:taskgameproject/screen/widgets/custom_button.dart';
import 'package:taskgameproject/screen/widgets/custom_textfield.dart';
import 'package:taskgameproject/util/colorconstraint.dart';
import 'package:taskgameproject/model/task_model.dart';

import 'package:flutter/material.dart';

class CreateANewScreen extends StatefulWidget {
  const CreateANewScreen({super.key});

  @override
  State<CreateANewScreen> createState() => _CreateANewScreenState();
}

class _CreateANewScreenState extends State<CreateANewScreen> {
  final TextEditingController fromController = TextEditingController();
  final TextEditingController toController = TextEditingController();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  String selectedPriority = "Low";

  // --- Date Picker Function ---
  Future<void> _pickDate(TextEditingController controller) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );

    if (picked != null) {
      setState(() {
        controller.text = "${picked.year}-${picked.month}-${picked.day}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstraint.primaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Create New Tasks',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.w800),
              ),
              const SizedBox(height: 20),
              _buildFromToSection(),
              const SizedBox(height: 20),
              _buildTitleSection(),
              const SizedBox(height: 20),
              _buildDescriptionSection(),
              const SizedBox(height: 20),
              _buildPrioritySection(),
              const SizedBox(height: 40),
              _buildAddButton(context),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  // --- Widget Methods ---
  Widget _buildFromToSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildLabeledTextField(
          label: 'From',
          width: 120,
          controller: fromController,
          onTap: () => _pickDate(fromController),
        ),
        _buildLabeledTextField(
          label: 'To',
          width: 120,
          controller: toController,
          onTap: () => _pickDate(toController),
        ),
      ],
    );
  }

  Widget _buildLabeledTextField({
    required String label,
    double? width,
    required TextEditingController controller,
    required VoidCallback onTap,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: ColorConstraint.textColor,
            fontWeight: FontWeight.w400,
            fontSize: 24,
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          width: width,
          child: GestureDetector(
            onTap: onTap,
            child: AbsorbPointer(
              child: CustomTextField(hintText: '', controller: controller),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTitleSection() => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Title',
        style: TextStyle(
          color: ColorConstraint.textColor,
          fontWeight: FontWeight.w400,
          fontSize: 24,
        ),
      ),
      const SizedBox(height: 10),
      CustomTextField(hintText: '', controller: titleController),
    ],
  );

  Widget _buildDescriptionSection() => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Description',
        style: TextStyle(
          color: ColorConstraint.textColor,
          fontWeight: FontWeight.w400,
          fontSize: 24,
        ),
      ),
      const SizedBox(height: 10),
      CustomTextField(
        hintText: '',
        maxLines: 4,
        controller: descriptionController,
      ),
    ],
  );

  Widget _buildPrioritySection() => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Choose Priority',
        style: TextStyle(
          color: ColorConstraint.textColor,
          fontWeight: FontWeight.w400,
          fontSize: 24,
        ),
      ),
      const SizedBox(height: 20),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildPriorityBox('High', const Color(0xffDD1515)),
          _buildPriorityBox('Medium', const Color(0xffA6A6A6)),
          _buildPriorityBox('Low', const Color(0xff79AF92)),
        ],
      ),
    ],
  );

  Widget _buildPriorityBox(String text, Color color) {
    final bool isSelected = selectedPriority == text;
    return GestureDetector(
      onTap: () => setState(() => selectedPriority = text),
      child: Container(
        height: 30,
        width: 100,
        decoration: BoxDecoration(
          color: color.withOpacity(isSelected ? 1 : 0.5),
          borderRadius: BorderRadius.circular(12),
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          style: const TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildAddButton(BuildContext context) => SizedBox(
    width: double.infinity,
    child: CustomButton(
      bgColor: const Color(0xff79AF92),
      title: 'Add',
      onPressed: () {
        if (titleController.text.isEmpty ||
            fromController.text.isEmpty ||
            toController.text.isEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Please fill all fields")),
          );
          return;
        }

        final newTask = TaskModel(
          title: titleController.text,
          fromDate: DateTime.parse(fromController.text),
          toDate: DateTime.parse(toController.text),
          priority: selectedPriority,
          description: descriptionController.text,
        );

        Navigator.pop(context, newTask);
      },
    ),
  );
}
