import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:taskgameproject/model/task_model.dart';
import 'package:taskgameproject/screen/widgets/custom_button.dart';
import 'package:taskgameproject/screen/widgets/custom_textfield.dart';
import 'package:taskgameproject/util/colorconstraint.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:taskgameproject/model/task_model.dart';

class EditANewScreen extends StatefulWidget {
  final TaskModel task;

  const EditANewScreen({super.key, required this.task});

  @override
  State<EditANewScreen> createState() => _EditANewScreenState();
}

class _EditANewScreenState extends State<EditANewScreen> {
  final TextEditingController fromController = TextEditingController();
  final TextEditingController toController = TextEditingController();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  String selectedPriority = "Low";

  @override
  void initState() {
    super.initState();
    // Pre-fill fields with existing task data
    final task = widget.task;
    titleController.text = task.title;
    descriptionController.text = task.description;
    fromController.text = DateFormat('yyyy-MM-dd').format(task.fromDate);
    toController.text = DateFormat('yyyy-MM-dd').format(task.toDate);
    selectedPriority = task.priority;
  }

  Future<void> _pickDate(TextEditingController controller) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );

    if (picked != null) {
      setState(() {
        controller.text = DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstraint.primaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.arrow_back_ios_rounded),

                Text(
                  'Edit Task',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.w800),
                ),
              ],
            ),

            const SizedBox(height: 20),
            _buildFromToSection(),
            const SizedBox(height: 20),
            _buildTitleSection(),
            const SizedBox(height: 20),
            _buildDescriptionSection(),
            const SizedBox(height: 20),
            _buildPrioritySection(),
            const Spacer(),
            _buildEditButton(context),
          ],
        ),
      ),
    );
  }

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

  Widget _buildPrioritySection() {
    return Column(
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
  }

  Widget _buildPriorityBox(String text, Color color) {
    final bool isSelected = selectedPriority == text;
    return GestureDetector(
      onTap: () {
        setState(() => selectedPriority = text);
      },
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

  Widget _buildEditButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: CustomButton(
        bgColor: const Color(0xff79AF92),
        title: 'Save Changes',
        onPressed: () {
          if (titleController.text.isEmpty ||
              fromController.text.isEmpty ||
              toController.text.isEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Please fill all fields")),
            );
            return;
          }

          final editedTask = TaskModel(
            title: titleController.text,
            description: descriptionController.text,
            fromDate: DateTime.parse(fromController.text),
            toDate: DateTime.parse(toController.text),
            priority: selectedPriority,
          );

          Navigator.pop(context, editedTask);
        },
      ),
    );
  }
}
