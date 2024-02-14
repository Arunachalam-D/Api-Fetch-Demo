import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_demo_task/data/api_fetch/message_api_data.dart';
import 'package:flutter_demo_task/domain/model/message_data_model.dart';


part 'message_data_event.dart';

part 'message_data_state.dart';

class MessageDataBloc extends Bloc<MessageDataEvent, MessageDataState> {
  MessageDataBloc() : super(MessageDataInitial()) {
    on<FetchMessageApiData>(fetchMessageApiData);
  }

  FutureOr<void> fetchMessageApiData(
      FetchMessageApiData event, Emitter<MessageDataState> emit) async {
    final messageData = await getMessageData();
    if (messageData != null) {
      emit(MessageDataLoadedState(
        listItems: messageData,
      ));
    }
  }

}


