import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo_task/data/api_fetch/message_api_data.dart';
import 'package:flutter_demo_task/domain/model/drop_down_model.dart';
import 'package:flutter_demo_task/presentation/widgets/date_formatter_widget.dart';
import 'package:flutter_demo_task/presentation/widgets/dialog_widget.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;
import 'package:flutter_quill/flutter_quill.dart';

part 'dialog_event.dart';

part 'dialog_state.dart';

class DialogBloc extends Bloc<DialogEvent, DialogState> {
  DialogBloc() : super(DialogInitial()) {
    on<OpenDialogEvent>(openDialogEvent);
    on<AddProjectEvent>(addProjectEvent);
    on<AddShowInEvent>(addShowInEvent);
    on<AddMessageTypeEvent>(addSMessageTypeEvent);
    on<AddProductNameEvent>(addProductNameEvent);
    on<AddProductEvent>(addProductEvent);
    on<AddStartDateEvent>(addStartDateEvent);
    on<AddEndDateEvent>(addEndDateEvent);
    on<AddMessagePriorityEvent>(addMessagePriorityEvent);
    on<NextButtonClickedEvent>(nextButtonClickedEvent);
    on<OnClearDataEvent>(onClearDataEvent);
  }

  FutureOr<void> openDialogEvent(

      OpenDialogEvent event, Emitter<DialogState> emit) async {

    showDialogModal(event.context);

    emit(
        DialogDataLoadedState(
            showInList: [],
            messageTypeList: [],
            priorityMessageList:[],
            questionTypeList: [],
            messageStatusList: [],
            showIn: '',
            startDate: '',
            endDate: '',
            productName: '',
            messagePriority: '',
            answer: QuillController.basic(),
            messageType: '',
            product: '',
            projectName: '',
            description: '',
            isLoading: true,
            isNextPressed: false));
    final castState = state as DialogDataLoadedState;
    final dropDownData = await getDropDownData();
    if(dropDownData != null){
    emit(
        DialogDataLoadedState(
        showInList: dropDownData.dropDownData!.showInDatas!.toList(),
        messageTypeList: dropDownData.dropDownData!.messageTypeData!.toList(),
        priorityMessageList: dropDownData.dropDownData!.priorityMessageData!.toList(),
        questionTypeList: dropDownData.dropDownData!.questionTypeData!.toList(),
        messageStatusList: dropDownData.dropDownData!.messageStatusData!.toList(),
        showIn: '',
        startDate: '',
        endDate: '',
        productName: '',
        messagePriority: '',
        answer: castState.answer,
        messageType: '',
        product: '',
        projectName: '',
        description: '',
        isLoading: false,
        isNextPressed: false)
    );
    }

  }
  FutureOr<void> nextButtonClickedEvent(NextButtonClickedEvent event, Emitter<DialogState> emit) {
    final castState = state as DialogDataLoadedState;

    emit(DialogDataLoadedState(
        showInList: castState.showInList,
        messageType: castState.messageType,
        messageTypeList: castState.messageTypeList,
        priorityMessageList: castState.priorityMessageList,
        questionTypeList: castState.questionTypeList,
        messageStatusList: castState.messageStatusList,
        projectName: castState.projectName,
        showIn:castState.showIn,
        startDate: castState.startDate,
        endDate: castState.endDate,
        productName: castState.productName,
        product: castState.product,
        messagePriority: castState.messagePriority,
        answer: castState.answer,
        description: castState.answer!.document.getPlainText(0, castState.answer!.document.length),
        isNextPressed: true));
  }

  FutureOr<void> addShowInEvent(AddShowInEvent event, Emitter<DialogState> emit) {

    final castState = state as DialogDataLoadedState;

    emit(DialogDataLoadedState(
      showInList: castState.showInList,
      messageType: castState.messageType,
      messageTypeList: castState.messageTypeList,
      priorityMessageList: castState.priorityMessageList,
      questionTypeList: castState.questionTypeList,
      messageStatusList: castState.messageStatusList,
      projectName: castState.projectName,
      showIn:event.showIn,
      startDate: castState.startDate,
      endDate: castState.endDate,
      productName: castState.productName,
      product: castState.product,
      answer: castState.answer,
      description: castState.description,
      messagePriority: castState.messagePriority,
    ));
  }

  FutureOr<void> addSMessageTypeEvent(AddMessageTypeEvent event, Emitter<DialogState> emit) {
    final castState = state as DialogDataLoadedState;

    emit(DialogDataLoadedState(
      showInList: castState.showInList,
      messageTypeList: castState.messageTypeList,
      priorityMessageList: castState.priorityMessageList,
      questionTypeList: castState.questionTypeList,
      messageStatusList: castState.messageStatusList,
      projectName: castState.projectName,
      showIn:castState.showIn,
      messageType: event.messageType,
      startDate: castState.startDate,
      endDate: castState.endDate,
      productName: castState.productName,
      product: castState.product,
      answer: castState.answer,
      description: castState.description,
      messagePriority: castState.messagePriority,
    ));
  }

  FutureOr<void> addProductNameEvent(AddProductNameEvent event, Emitter<DialogState> emit) {
    final castState = state as DialogDataLoadedState;

    emit(DialogDataLoadedState(
      showInList: castState.showInList,
      messageTypeList: castState.messageTypeList,
      priorityMessageList: castState.priorityMessageList,
      questionTypeList: castState.questionTypeList,
      messageStatusList: castState.messageStatusList,
      projectName: castState.projectName,
      showIn:castState.showIn,
      messageType: castState.messageType,
      startDate: castState.startDate,
      endDate: castState.endDate,
      productName: event.productName,
      product: castState.product,
      answer: castState.answer,
      description: castState.description,
      messagePriority: castState.messagePriority,
    ));
  }

  FutureOr<void> addMessagePriorityEvent(AddMessagePriorityEvent event, Emitter<DialogState> emit) {
    final castState = state as DialogDataLoadedState;

    emit(DialogDataLoadedState(
      showInList: castState.showInList,
      messageTypeList: castState.messageTypeList,
      priorityMessageList: castState.priorityMessageList,
      questionTypeList: castState.questionTypeList,
      messageStatusList: castState.messageStatusList,
      projectName:castState.projectName ,
      showIn:castState.showIn,
      messageType: castState.messageType,
      startDate: castState.startDate,
      endDate: castState.endDate,
      productName: castState.productName,
      product: castState.product,
      answer: castState.answer,
      description: castState.description,
      messagePriority: event.messagePriority,
    ));
  }

  FutureOr<void> addProductEvent(AddProductEvent event, Emitter<DialogState> emit) {
    final castState = state as DialogDataLoadedState;

    emit(DialogDataLoadedState(
      showInList: castState.showInList,
      messageTypeList: castState.messageTypeList,
      priorityMessageList: castState.priorityMessageList,
      questionTypeList: castState.questionTypeList,
      messageStatusList: castState.messageStatusList,
      projectName: castState.projectName,
      showIn:castState.showIn,
      messageType: castState.messageType,
      startDate: castState.startDate,
      endDate: castState.endDate,
      productName: castState.productName,
      product: event.product,
      answer: castState.answer,
      description: castState.description,
      messagePriority: castState.messagePriority,
    ));
  }

  FutureOr<void> onClearDataEvent(OnClearDataEvent event, Emitter<DialogState> emit) {

    final castState = state as DialogDataLoadedState;
    emit(DialogDataLoadedState(
        showInList: castState.showInList,
        messageTypeList: castState.messageTypeList,
        priorityMessageList: castState.priorityMessageList,
        questionTypeList: castState.questionTypeList,
        messageStatusList: castState.messageStatusList,
        projectName: '',
        showIn: '',
        messageType: '',
        startDate: '',
        endDate: '',
        productName: '',
        product: '',
        messagePriority: '',
        description: '',
        answer: QuillController.basic(),
        isNextPressed: false));

  }

  FutureOr<void> addProjectEvent(AddProjectEvent event, Emitter<DialogState> emit) {
    final castState = state as DialogDataLoadedState;

    emit(DialogDataLoadedState(
      showInList: castState.showInList,
      messageTypeList: castState.messageTypeList,
      priorityMessageList: castState.priorityMessageList,
      questionTypeList: castState.questionTypeList,
      messageStatusList: castState.messageStatusList,
      projectName: event.projectName,
      showIn:castState.showIn,
      messageType: castState.messageType,
      startDate: castState.startDate,
      endDate: castState.endDate,
      productName: castState.productName,
      product: castState.product,
      answer: castState.answer,
      description: castState.description,
      messagePriority: castState.messagePriority,
    ));
  }

  FutureOr<void> addEndDateEvent(AddEndDateEvent event, Emitter<DialogState> emit) async{

    DateTime? endDate = await showDatePicker(context: event.context, initialDate: DateTime.now(),firstDate: DateTime(2000), lastDate: DateTime(2100));
    final endDateTime = formatDate(endDate.toString());
    final castState = state as DialogDataLoadedState;

    emit(DialogDataLoadedState(
      showInList: castState.showInList,
      messageTypeList: castState.messageTypeList,
      priorityMessageList: castState.priorityMessageList,
      questionTypeList: castState.questionTypeList,
      messageStatusList: castState.messageStatusList,
      projectName: castState.projectName,
      showIn:castState.showIn,
      messageType: castState.messageType,
      startDate: castState.startDate,
      endDate: endDateTime,
      productName: castState.productName,
      product: castState.product,
      answer: castState.answer,
      description: castState.description,
      messagePriority: castState.messagePriority,
    ));
  }

  FutureOr<void> addStartDateEvent(AddStartDateEvent event, Emitter<DialogState> emit) async{

    DateTime? startDate = await showDatePicker(context: event.context, initialDate: DateTime.now(),firstDate: DateTime(2000), lastDate: DateTime(2100));
    final startDateTime = formatDate(startDate.toString());
    final castState = state as DialogDataLoadedState;

    emit(DialogDataLoadedState(
      showInList: castState.showInList,
      messageTypeList: castState.messageTypeList,
      priorityMessageList: castState.priorityMessageList,
      questionTypeList: castState.questionTypeList,
      messageStatusList: castState.messageStatusList,
      projectName: castState.projectName,
      showIn:castState.showIn,
      messageType: castState.messageType,
      startDate: startDateTime,
      endDate: castState.endDate,
      productName: castState.productName,
      product: castState.product,
      answer: castState.answer,
      description: castState.description,
      messagePriority: castState.messagePriority,
    ));
  }
}
