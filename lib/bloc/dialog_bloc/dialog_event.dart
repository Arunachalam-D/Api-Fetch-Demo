part of 'dialog_bloc.dart';

abstract class DialogEvent extends Equatable {
  const DialogEvent();
}

class OpenDialogEvent extends DialogEvent{
  const OpenDialogEvent({required this.context});

  final BuildContext context;

  @override
  List<Object?> get props => [context];
}

class AddProjectEvent extends DialogEvent {
  final String projectName;

  const AddProjectEvent({required this.projectName});

  @override
  List<Object?> get props => [];
}

class AddShowInEvent extends DialogEvent {
  final String showIn;

  @override
  List<Object?> get props => [];
  const AddShowInEvent({required this.showIn});
}

class AddMessageTypeEvent extends DialogEvent {
  final String messageType;

  const AddMessageTypeEvent({required this.messageType});
  @override
  List<Object?> get props => [];
}

class AddStartDateEvent extends DialogEvent {
  final BuildContext context;

  const AddStartDateEvent({required this.context});
  @override
  List<Object?> get props => [];
}

class AddEndDateEvent extends DialogEvent {
  final BuildContext context;

  const AddEndDateEvent({required this.context});
  @override
  List<Object?> get props => [];
}

class AddProductNameEvent extends DialogEvent {
  final String productName;

  const AddProductNameEvent({required this.productName});
  @override
  List<Object?> get props => [];
}

class AddMessagePriorityEvent extends DialogEvent {
  final String messagePriority;

  const AddMessagePriorityEvent({required this.messagePriority});
  @override
  List<Object?> get props => [];
}

class AddProductEvent extends DialogEvent {
  final String product;

  const AddProductEvent({required this.product});
  @override
  List<Object?> get props => [];
}


class NextButtonClickedEvent extends DialogEvent {
  const NextButtonClickedEvent();
  @override
  List<Object?> get props => [];
}

class OnClearDataEvent extends DialogEvent {
  const OnClearDataEvent();
  @override
  List<Object?> get props => [];
}
