class DropDownData {
  bool? status;
  String? message;
  ChoiceData? dropDownData;

  DropDownData({this.status, this.message, this.dropDownData});

  DropDownData.fromJson(Map<String, dynamic> json) {
    status = json['Status'];
    message = json['Message'];
    dropDownData = json['Data'] != null ? ChoiceData.fromJson(json['Data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Status'] = status;
    data['Message'] = message;
    if (dropDownData != null) {
      data['Data'] = dropDownData!.toJson();
    }
    return data;
  }
}

class ChoiceData {
  List<ShowInDatas>? showInDatas;
  List<MessageTypeData>? messageTypeData;
  List<PriorityMessageData>? priorityMessageData;
  List<QuestionTypeData>? questionTypeData;
  List<MessageStatusData>? messageStatusData;

  ChoiceData(
      {this.showInDatas,
        this.messageTypeData,
        this.priorityMessageData,
        this.questionTypeData,
        this.messageStatusData});

  ChoiceData.fromJson(Map<String, dynamic> json) {
    if (json['showInDatas'] != null) {
      showInDatas = <ShowInDatas>[];
      json['showInDatas'].forEach((v) {
        showInDatas!.add(ShowInDatas.fromJson(v));
      });
    }
    if (json['MessageTypeData'] != null) {
      messageTypeData = <MessageTypeData>[];
      json['MessageTypeData'].forEach((v) {
        messageTypeData!.add(MessageTypeData.fromJson(v));
      });
    }
    if (json['PriorityMessageData'] != null) {
      priorityMessageData = <PriorityMessageData>[];
      json['PriorityMessageData'].forEach((v) {
        priorityMessageData!.add(PriorityMessageData.fromJson(v));
      });
    }
    if (json['QuestionTypeData'] != null) {
      questionTypeData = <QuestionTypeData>[];
      json['QuestionTypeData'].forEach((v) {
        questionTypeData!.add(QuestionTypeData.fromJson(v));
      });
    }
    if (json['MessageStatusData'] != null) {
      messageStatusData = <MessageStatusData>[];
      json['MessageStatusData'].forEach((v) {
        messageStatusData!.add(MessageStatusData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (showInDatas != null) {
      data['showInDatas'] = showInDatas!.map((v) => v.toJson()).toList();
    }
    if (messageTypeData != null) {
      data['MessageTypeData'] =
          messageTypeData!.map((v) => v.toJson()).toList();
    }
    if (priorityMessageData != null) {
      data['PriorityMessageData'] =
          priorityMessageData!.map((v) => v.toJson()).toList();
    }
    if (questionTypeData != null) {
      data['QuestionTypeData'] =
          questionTypeData!.map((v) => v.toJson()).toList();
    }
    if (messageStatusData != null) {
      data['MessageStatusData'] =
          messageStatusData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ShowInDatas {
  int? showInId;
  String? showInName;

  ShowInDatas({this.showInId, this.showInName});

  ShowInDatas.fromJson(Map<String, dynamic> json) {
    showInId = json['ShowInId'];
    showInName = json['ShowInName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ShowInId'] = showInId;
    data['ShowInName'] = showInName;
    return data;
  }
}

class MessageTypeData {
  int? messageTypeId;
  String? messageTypeName;

  MessageTypeData({this.messageTypeId, this.messageTypeName});

  MessageTypeData.fromJson(Map<String, dynamic> json) {
    messageTypeId = json['MessageTypeId'];
    messageTypeName = json['MessageTypeName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['MessageTypeId'] = messageTypeId;
    data['MessageTypeName'] = messageTypeName;
    return data;
  }
}

class PriorityMessageData {
  int? priorityMessageId;
  String? priorityMessageName;

  PriorityMessageData({this.priorityMessageId, this.priorityMessageName});

  PriorityMessageData.fromJson(Map<String, dynamic> json) {
    priorityMessageId = json['PriorityMessageId'];
    priorityMessageName = json['PriorityMessageName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['PriorityMessageId'] = priorityMessageId;
    data['PriorityMessageName'] = priorityMessageName;
    return data;
  }
}

class QuestionTypeData {
  int? pollOptionTypeId;
  String? typeName;

  QuestionTypeData({this.pollOptionTypeId, this.typeName});

  QuestionTypeData.fromJson(Map<String, dynamic> json) {
    pollOptionTypeId = json['PollOptionTypeId'];
    typeName = json['TypeName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['PollOptionTypeId'] = pollOptionTypeId;
    data['TypeName'] = typeName;
    return data;
  }
}

class MessageStatusData {
  int? messageStatusId;
  String? messageStatusName;

  MessageStatusData({this.messageStatusId, this.messageStatusName});

  MessageStatusData.fromJson(Map<String, dynamic> json) {
    messageStatusId = json['MessageStatusId'];
    messageStatusName = json['MessageStatusName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['MessageStatusId'] = messageStatusId;
    data['MessageStatusName'] = messageStatusName;
    return data;
  }
}
