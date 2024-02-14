import 'package:flutter/material.dart';
import 'package:flutter_demo_task/core/constants/colors.dart';
import 'package:flutter_quill/flutter_quill.dart';

class QuillEditorWidget extends StatelessWidget {
  const QuillEditorWidget({super.key,required this.isValid,required this.controller});
  final bool isValid;
  final QuillController controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 30,),
        Padding(
          padding: const EdgeInsets.only(left:16.0,right: 16),
          child: Container(
            width: 685,
            decoration:
                BoxDecoration(
                  border: Border.all(color: TaskColors.quillBorderColor),borderRadius: const BorderRadius.only(topRight: Radius.circular(12),
    topLeft: Radius.circular(12))),
            child: QuillToolbar.simple(
              configurations: QuillSimpleToolbarConfigurations(
                controller:controller ,
              ),
            ),
          ),
        ),
        Container(
          width: 685,
          decoration: BoxDecoration(border: Border.all(color: isValid ? TaskColors.quillBorderColor : TaskColors.statusRedBackground),borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12),
              bottomLeft: Radius.circular(12))),
          child:  Padding(
            padding: const EdgeInsets.only(left: 16.0,right: 16.0,top: 30,bottom: 30),
            child: QuillEditor(
              configurations: QuillEditorConfigurations(
                  controller:controller,
    ),
              focusNode: FocusNode(),
              scrollController:
                  ScrollController(), // Set to true if you want to make the editor read-only
            ),
          ),
        ),

        const SizedBox(height: 20,),
      ],
    );
  }
}
