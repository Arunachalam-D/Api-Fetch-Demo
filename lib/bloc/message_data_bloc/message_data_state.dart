
part of 'message_data_bloc.dart';

abstract class MessageDataState extends Equatable {
  const MessageDataState();
}

class MessageDataInitial extends MessageDataState {
  @override
  List<Object> get props => [];
}

class MessageDataLoadedState extends MessageDataState {

  //data for home page table
  final List<ListItem> listItems;

  //selected item for dropdown
  // final String projectName;
  // final String showIn;
  // final String startDate;
  // final String endDate;
  // final String productName;
  // final String messagePriority;
  // final String messageType;
  // final String product;
  // final String description;
  // final quill.QuillController? answer;
  // final bool isNextPressed;

  //list items for dropdown
  // final List<ShowInDatas> showInList; //Project & Show in
  // final List<MessageTypeData> messageTypeList; //Type
  // final List<PriorityMessageData> priorityMessageList; //Message Priority
  // final List<QuestionTypeData> questionTypeList; //Participant Type
  // final List<MessageStatusData> messageStatusList; //Product

  const MessageDataLoadedState({
    required this.listItems,
    // required this.showInList,
    // required this.messageTypeList,
    // required this.priorityMessageList,
    // required this.questionTypeList,
    // required this.messageStatusList,
    // required this.showIn,
    // required this.startDate,
    // required this.endDate,
    // required this.productName,
    // required this.messagePriority,
    // required this.messageType,
    // required this.product,
    // required this.projectName,
    // required this.description,
    // this.answer,
    // this.isNextPressed = false
  });

  @override
  List<Object?> get props =>
      [
        listItems
        // projectName,
        // showIn,
        // startDate,
        // messageType,
        // endDate,
        // productName,
        // product,
        // description,
        // messagePriority,
        // answer,
        // showInList,
        // messageTypeList,
        // priorityMessageList,
        // questionTypeList,
        // messageStatusList,
        // isNextPressed,
      ];
}
