import 'package:flutter/material.dart';
import 'package:taskgameproject/screen/widgets/custom_button.dart';
import 'package:taskgameproject/screen/widgets/custom_textfield.dart';
import 'package:taskgameproject/util/colorconstraint.dart';

class CreateANewScreen extends StatelessWidget {
  const CreateANewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstraint.primaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Create New Tasks',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.w800),
            ),
            SizedBox(height: 20),
            _buildFromToSection(),
            const SizedBox(height: 20),
            _buildTitleSection(),
            const SizedBox(height: 20),
            _buildDescriptionSection(),
            const SizedBox(height: 20),
            _buildPrioritySection(),
            const Spacer(),
            _buildAddButton(),
          ],
        ),
      ),
    );
  }

  // --- Widget Methods ---

  Widget _buildFromToSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildLabeledTextField(label: 'From', width: 100),
        _buildLabeledTextField(label: 'To', width: 100),
      ],
    );
  }

  Widget _buildLabeledTextField({required String label, double? width}) {
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
          child: CustomTextField(hintText: ''),
        ),
      ],
    );
  }

  Widget _buildTitleSection() {
    return Column(
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
        SizedBox(height: 10),
        CustomTextField(hintText: ''),
      ],
    );
  }

  Widget _buildDescriptionSection() {
    return Column(
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
        SizedBox(height: 10),
        CustomTextField(hintText: '', maxLines: 4),
      ],
    );
  }

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
    return Container(
      height: 30,
      width: 100,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      alignment: Alignment.center,
      child: Text(text, style: const TextStyle(fontSize: 20)),
    );
  }

  Widget _buildAddButton() {
    return SizedBox(
      width: double.infinity,
      child: CustomButton(
        bgColor: const Color(0xff79AF92),
        title: 'Add',
        onPressed: () {},
      ),
    );
  }
}
