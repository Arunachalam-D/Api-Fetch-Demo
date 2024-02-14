part of 'dialog_bloc.dart';

abstract class DialogState extends Equatable {
  const DialogState();
}

class DialogInitial extends DialogState {
  @override
  List<Object> get props => [];
}

class DialogDataLoadedState extends DialogState{


  final String projectName;
  final String showIn;
  final String startDate;
  final String endDate;
  final String productName;
  final String messagePriority;
  final String messageType;
  final String product;
  final String description;
  final quill.QuillController? answer;
  final bool isNextPressed;
  final bool isLoading;

  //list items for dropdown
  final List<ShowInDatas> showInList; //Project & Show in
  final List<MessageTypeData> messageTypeList; //Type
  final List<PriorityMessageData> priorityMessageList; //Message Priority
  final List<QuestionTypeData> questionTypeList; //Participant Type
  final List<MessageStatusData> messageStatusList;

  const DialogDataLoadedState({
    required this.showInList,
    required this.messageTypeList,
    required this.priorityMessageList,
    required this.questionTypeList,
    required this.messageStatusList,
    required this.showIn,
    required this.startDate,
    required this.endDate,
    required this.productName,
    required this.messagePriority,
    required this.messageType,
    required this.product,
    required this.projectName,
    required this.description,
    this.answer,
    this.isNextPressed = false,
    this.isLoading = false,
});


  @override
  List<Object> get props => [
    projectName,
    showIn,
    startDate,
    messageType,
    endDate,
    productName,
    product,
    description,
    messagePriority,
    showInList,
    isLoading,
    messageTypeList,
    priorityMessageList,
    questionTypeList,
    messageStatusList,
    isNextPressed,
  ];
}