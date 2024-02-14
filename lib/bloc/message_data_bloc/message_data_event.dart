part of 'message_data_bloc.dart';

abstract class MessageDataEvent extends Equatable {
  const MessageDataEvent();

  @override
  List<Object?> get props => [];
}

class FetchMessageApiData extends MessageDataEvent {
  const FetchMessageApiData();
}

class FetchDropDownData extends MessageDataEvent {
  const FetchDropDownData();
}

// class OpenDialogEvent extends MessageDataEvent {
//   final BuildContext context;
//
//   const OpenDialogEvent({required this.context});
// }

// class AddProjectEvent extends MessageDataEvent {
//   final String projectName;
//
//   const AddProjectEvent({required this.projectName});
// }
//
// class AddShowInEvent extends MessageDataEvent {
//   final String showIn;
//
//   const AddShowInEvent({required this.showIn});
// }
//
// class AddMessageTypeEvent extends MessageDataEvent {
//   final String messageType;
//
//   const AddMessageTypeEvent({required this.messageType});
// }
//
// class AddStartDateEvent extends MessageDataEvent {
//   final BuildContext context;
//
//   const AddStartDateEvent({required this.context});
// }
//
// class AddEndDateEvent extends MessageDataEvent {
//   final BuildContext context;
//
//   const AddEndDateEvent({required this.context});
// }
//
// class AddProductNameEvent extends MessageDataEvent {
//   final String productName;
//
//   const AddProductNameEvent({required this.productName});
// }
//
// class AddMessagePriorityEvent extends MessageDataEvent {
//   final String messagePriority;
//
//   const AddMessagePriorityEvent({required this.messagePriority});
// }
//
// class AddProductEvent extends MessageDataEvent {
//   final String product;
//
//   const AddProductEvent({required this.product});
// }
//
//
// class NextButtonClickedEvent extends MessageDataEvent {
//   const NextButtonClickedEvent();
// }
//
// class OnClearDataEvent extends MessageDataEvent {
//   const OnClearDataEvent();
// }
