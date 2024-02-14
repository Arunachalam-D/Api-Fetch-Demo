import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo_task/bloc/dialog_bloc/dialog_bloc.dart';
import 'package:flutter_demo_task/core/constants/colors.dart';
import 'package:flutter_demo_task/presentation/widgets/drop_down_widget.dart';
import 'package:flutter_demo_task/presentation/widgets/loading_widget.dart';
import 'package:flutter_demo_task/presentation/widgets/quill_editor_widget.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:google_fonts/google_fonts.dart';

showDialogModal(context) {
  final List<String> projectItems = [
    'Shionogi',
    'RDMS',
    'RDC',
    'Demo Task'
  ];
  showDialog(
      context: (context),
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: TaskColors.textWhite,
          surfaceTintColor: TaskColors.transparent,
          child: SizedBox(

            width: MediaQuery.of(context).size.width * 0.5,
            child:  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(12),
                              topLeft: Radius.circular(12)),
                          color: TaskColors.headBlue,
                        ),

                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Add Message",
                                style: GoogleFonts.lato(
                                    color: TaskColors.textWhite,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16)),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                                context.read<DialogBloc>().add(const OnClearDataEvent());
                              },
                              child: Text("X",
                                  style: GoogleFonts.lato(
                                      color:TaskColors.textWhite,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16)),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 8.0, right: 8.0, top: 8.0),
                        child: Text("Message Info",
                            style: GoogleFonts.lato(
                                color:TaskColors.headBlue,
                                fontWeight: FontWeight.bold,
                                fontSize: 15)),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(
                            left: 20.0, right: 20.0, top: 8.0, bottom: 8.0),
                        child: Divider(
                          color: TaskColors.dropdownTextColor,
                          thickness: 0.5,
                        ),
                      ),
                      BlocBuilder<DialogBloc, DialogState>(
                        builder: (context, state) {
                      if (state is DialogDataLoadedState) {
                        if(state.isLoading){
                          return Center(
                              child: loader(
                                color:TaskColors.headBlue ,//
                              ));
                        }
                        return SizedBox(
                          height: 440,
                          child: SingleChildScrollView(
                            child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: Container(
                                      margin: const EdgeInsets.all(13),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("Project",
                                              style: GoogleFonts.lato(
                                                  color: TaskColors.headBlue,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold)),
                                          const SizedBox(
                                            height: 7,
                                          ),
                                          DropDown(
                                            initialValue:state.projectName,//state.showIn
                                            onChange: (value){
                                              // print('Show in Value : $value');
                                              context.read<DialogBloc>().add(AddProjectEvent(projectName:value));
                                            },
                                            items: projectItems
                                                .map((showInList) =>
                                            showInList)
                                                .toList(),
                                            isValid: state.isNextPressed
                                                ? (state.projectName == '' ? false : true)
                                                : true,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: Container(
                                      margin: const EdgeInsets.all(13),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("Type",
                                              style: GoogleFonts.lato(
                                                  color: TaskColors.headBlue,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold)),
                                          const SizedBox(
                                            height: 7,
                                          ),
                                          DropDown(
                                            onChange: (value){
                                              context.read<DialogBloc>().add(AddMessageTypeEvent(messageType:value));
                                            },
                                            initialValue: state.messageType,//state.messageType
                                            items: state.messageTypeList
                                                .where((messageTypeList) =>
                                            messageTypeList.messageTypeName !=
                                                null)
                                                .map((messageTypeList) =>
                                            messageTypeList.messageTypeName!)
                                                .toList(),
                                            isValid: state.isNextPressed ? (state.messageType == '' ? false : true):true,
                                          )
                                          // textInputField(),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: Container(
                                      margin: const EdgeInsets.all(13),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("Question Type",
                                              style: GoogleFonts.lato(
                                                  color: TaskColors.headBlue,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold)),
                                          const SizedBox(
                                            height: 7,
                                          ),
                                          DropDown(
                                            onChange: (value){
                                              context.read<DialogBloc>().add(AddProductNameEvent(productName:value));
                                            },
                                            initialValue: state.productName,
                                            items: state.questionTypeList
                                                .where((questionTypeList) =>
                                            questionTypeList.typeName != null)
                                                .map((questionTypeList) =>
                                            questionTypeList.typeName!)
                                                .toList(),
                                            isValid: state.isNextPressed ? (state.productName == '' ? false : true) : true,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: Container(
                                      margin: const EdgeInsets.all(13),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("Publish Date",
                                              style: GoogleFonts.lato(
                                                  color: TaskColors.headBlue,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold)),
                                          const SizedBox(
                                            height: 7,
                                          ),
                                          Container(
                                            padding: const EdgeInsets.all(4),
                                            decoration: BoxDecoration(
                                                border: state.isNextPressed ? (state.startDate == '' ? Border.all(color: Colors.red) : Border.all(color: Colors.black26)) : Border.all(color: Colors.black26),
                                                borderRadius: BorderRadius.circular(10)
                                            ),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text((state.startDate != '')?state.startDate : ''),
                                                IconButton(onPressed: (){
                                                  context.read<DialogBloc>().add(AddStartDateEvent(context: context));
                                                }, icon: const Icon(Icons.calendar_month))
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: Container(
                                      margin: const EdgeInsets.all(13),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("End date",
                                              style: GoogleFonts.lato(
                                                  color:TaskColors.headBlue,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold)),
                                          const SizedBox(
                                            height: 7,
                                          ),
                                          Container(
                                            padding: const EdgeInsets.all(4),
                                            decoration: BoxDecoration(
                                                border:state.isNextPressed ? (state.endDate == '' ? Border.all(color: Colors.red) : Border.all(color: Colors.black26)) : Border.all(color: Colors.black26),
                                                borderRadius: BorderRadius.circular(10)
                                            ),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text((state.endDate != '')?state.endDate : ''),
                                                IconButton(onPressed: (){
                                                  context.read<DialogBloc>().add(AddEndDateEvent(context: context));
                                                }, icon: const Icon(Icons.calendar_month))
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: Container(
                                      margin: const EdgeInsets.all(13),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("Show in",
                                              style: GoogleFonts.lato(
                                                  color: TaskColors.headBlue,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold)),
                                          const SizedBox(
                                            height: 7,
                                          ),
                                          DropDown(
                                            onChange: (value){
                                              context.read<DialogBloc>().add(AddShowInEvent(showIn:value));
                                            },
                                            initialValue: state.showIn,
                                            items: state.showInList
                                                .where((showInList) =>
                                            showInList.showInName != null)
                                                .map((showInList) =>
                                            showInList.showInName!)
                                                .toList(),
                                            isValid: state.isNextPressed ? (state.showIn == '' ?false : true):true,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: Container(
                                      margin: const EdgeInsets.all(13),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("Product",
                                              style: GoogleFonts.lato(
                                                  color: TaskColors.headBlue,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold)),
                                          const SizedBox(
                                            height: 7,
                                          ),
                                          DropDown(
                                            onChange: (value){
                                              context.read<DialogBloc>().add(AddProductEvent(product:value));
                                            },
                                            initialValue: state.product,
                                            items: state.messageStatusList
                                                .where((messageStatusList) =>
                                            messageStatusList
                                                .messageStatusName !=
                                                null)
                                                .map((messageStatusList) =>
                                            messageStatusList.messageStatusName)
                                                .toList(),
                                            isValid: state.isNextPressed?(state.product == '' ? false : true):true,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),

                                  Expanded(
                                    flex: 3,
                                    child: Container(
                                      margin: const EdgeInsets.all(13),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("Message Priority",
                                              style: GoogleFonts.lato(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold,
                                                  color: TaskColors.headBlue)),
                                          const SizedBox(
                                            height: 7,
                                          ),
                                          DropDown(
                                            onChange:
                                                (value){
                                              context.read<DialogBloc>().add(AddMessagePriorityEvent(messagePriority:value));
                                            },
                                            initialValue: state.messagePriority,
                                            items: state.priorityMessageList
                                                .where((priorityMessageList) =>
                                            priorityMessageList
                                                .priorityMessageName !=
                                                null)
                                                .map((priorityMessageList) =>
                                            priorityMessageList
                                                .priorityMessageName)
                                                .toList(),
                                            isValid: state.isNextPressed ? (state.messagePriority == '' ? false : true):true,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),

                                  const Expanded(
                                    flex: 3,
                                    child: SizedBox.shrink(),
                                  ),

                                  // QuillEditor()
                                ],
                              ),
                              Row(
                                 mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                QuillEditorWidget(
                                    isValid:state.isNextPressed ?(state.answer!.document.isEmpty() ? false : true)  : true,
                                    controller:state.answer ?? QuillController.basic(),
                                )
                                ],
                              ),

                            ],
                                                  ),
                          ),
                        );
                      }
                      else{
                        return Center(
                            child: loader(
                              color: TaskColors.headBlue,
                            ));
                      }
  },
),

                      const SizedBox(
                        height: 5,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(
                            left: 20.0, right: 20.0, top: 8.0, bottom: 8.0),
                        child: Divider(
                          color: TaskColors.dropdownTextColor,
                          thickness: 0.5,
                        ),
                      ),
                      // const QuillEditor(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      backgroundColor:TaskColors.textWhite,
                                      surfaceTintColor: TaskColors.transparent,
                                      title: Text(
                                        "Confirmation",
                                        style: GoogleFonts.lato(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: TaskColors.headBlue),
                                      ),
                                      content: Text(
                                        "On clear your data will be lost",
                                        style: GoogleFonts.lato(
                                            fontSize: 12, color: TaskColors.dropdownTextColor),
                                      ),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          style: TextButton.styleFrom(
                                              backgroundColor: TaskColors.buttonBackground,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10))),
                                          child: Text(
                                            "Cancel",
                                            style: GoogleFonts.lato(
                                                fontSize: 12,
                                                color: TaskColors.buttonTextColor),
                                          ),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            context.read<DialogBloc>().add(const OnClearDataEvent());
                                            Navigator.of(context).pop();
                                          },
                                          style: TextButton.styleFrom(
                                              backgroundColor:
                                                  TaskColors.headBlue,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10))),
                                          child: Text(
                                            "Ok",
                                            style: GoogleFonts.lato(
                                                fontSize: 12,
                                                color: TaskColors.textWhite),
                                          ),
                                        )
                                      ],
                                    );
                                  });
                            },
                            style: TextButton.styleFrom(
                              padding: const EdgeInsets.only(
                                  left: 35, right: 35, top: 15, bottom: 15),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              backgroundColor: TaskColors.buttonBackground,
                            ),
                            child: Text("Clear",
                                style: GoogleFonts.lato(
                                    fontSize: 12, color: TaskColors.cancelTextColor)),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              padding: const EdgeInsets.only(
                                  left: 35, right: 35, top: 15, bottom: 15),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              backgroundColor: TaskColors.buttonBackground,
                            ),
                            child: Text("Save as draft",
                                style: GoogleFonts.lato(
                                    fontSize: 12, color: TaskColors.cancelTextColor)),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          TextButton(
                              onPressed: () {
                                context
                                    .read<DialogBloc>()
                                    .add(const NextButtonClickedEvent());

                              },
                              style: TextButton.styleFrom(
                                  padding: const EdgeInsets.only(
                                      left: 35, right: 35, top: 15, bottom: 15),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5)),
                                  backgroundColor: TaskColors.headBlue),
                              child: Text("Next",
                                  style: GoogleFonts.lato(
                                      fontSize: 12, color: TaskColors.textWhite))),
                          const SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  )



          ),
        );
      });
}
