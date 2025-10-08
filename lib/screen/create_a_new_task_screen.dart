import 'package:flutter/material.dart';
import 'package:taskgameproject/screen/widgets/custom_textfield.dart';

class CreateANewScreen extends StatelessWidget {
  const CreateANewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text('From'),
                  SizedBox(width: 100, child: CustomTextField(hintText: '')),
                ],
              ),
              Column(
                children: [
                  Text('To'),
                  SizedBox(width: 100, child: CustomTextField(hintText: '')),
                ],
              ),
            ],
          ),
          CustomTextField(hintText: ''),
          CustomTextField(hintText: '', maxLines: 4),

          Text('Choose Priority'),

          Container(child: Text('High')),
          Container(child: Text('Medium')),
          Container(child: Text('High')),
        ],
      ),
    );
  }
}
