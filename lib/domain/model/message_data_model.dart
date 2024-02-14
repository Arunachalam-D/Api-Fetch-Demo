class TableData {
  bool? status;
  String? message;
  Data? data;

  TableData({this.status, this.message, this.data});

  TableData.fromJson(Map<String, dynamic> json) {
    status = json['Status'];
    message = json['Message'];
    data = json['Data'] != null ? Data.fromJson(json['Data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Status'] = status;
    data['Message'] = message;
    if (this.data != null) {
      data['Data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<ListItem>? list;
  int? count;

  Data({this.list, this.count});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['List'] != null) {
      list = <ListItem>[];
      json['List'].forEach((v) {
        list!.add(ListItem.fromJson(v));
      });
    }
    count = json['Count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (list != null) {
      data['List'] = list!.map((v) => v.toJson()).toList();
    }
    data['Count'] = count;
    return data;
  }
}

class ListItem {
  int? messageId;
  String? messageText;
  String? endDate;
  String? publishDate;
  String? createdAt;
  String? updatedAt;
  MessageType? messageType;
  List<Project>? project;
  MessageStatus? messageStatus;
  List<MessageParticipantType>? messageParticipantType;

  ListItem(
      {this.messageId,
        this.messageText,
        this.endDate,
        this.publishDate,
        this.createdAt,
        this.updatedAt,
        this.messageType,
        this.project,
        this.messageStatus,
        this.messageParticipantType});

  ListItem.fromJson(Map<String, dynamic> json) {
    messageId = json['MessageId'];
    messageText = json['MessageText'];
    endDate = json['EndDate'];
    publishDate = json['PublishDate'];
    createdAt = json['CreatedAt'];
    updatedAt = json['UpdatedAt'];
    messageType = json['MessageType'] != null
        ? MessageType.fromJson(json['MessageType'])
        : null;
    if (json['Project'] != null) {
      project = <Project>[];
      json['Project'].forEach((v) {
        project!.add(Project.fromJson(v));
      });
    }
    messageStatus = json['MessageStatus'] != null
        ? MessageStatus.fromJson(json['MessageStatus'])
        : null;
    if (json['MessageParticipantType'] != null) {
      messageParticipantType = <MessageParticipantType>[];
      json['MessageParticipantType'].forEach((v) {
        messageParticipantType!.add(MessageParticipantType.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['MessageId'] = messageId;
    data['MessageText'] = messageText;
    data['EndDate'] = endDate;
    data['PublishDate'] = publishDate;
    data['CreatedAt'] = createdAt;
    data['UpdatedAt'] = updatedAt;
    if (messageType != null) {
      data['MessageType'] = messageType!.toJson();
    }
    if (project != null) {
      data['Project'] = project!.map((v) => v.toJson()).toList();
    }
    if (messageStatus != null) {
      data['MessageStatus'] = messageStatus!.toJson();
    }
    if (messageParticipantType != null) {
      data['MessageParticipantType'] =
          messageParticipantType!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MessageType {
  int? messageTypeId;
  String? messageTypeName;

  MessageType({this.messageTypeId, this.messageTypeName});

  MessageType.fromJson(Map<String, dynamic> json) {
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

class Project {
  int? projectId;
  Project? project;

  Project({this.projectId, this.project});

  Project.fromJson(Map<String, dynamic> json) {
    projectId = json['ProjectId'];
    project =
    json['Project'] != null ? Project.fromJson(json['Project']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ProjectId'] = projectId;
    if (project != null) {
      data['Project'] = project!.toJson();
    }
    return data;
  }
}

class MessageStatus {
  int? messageStatusId;
  String? messageStatusName;

  MessageStatus({this.messageStatusId, this.messageStatusName});

  MessageStatus.fromJson(Map<String, dynamic> json) {
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

class MessageParticipantType {
  int? roleId;
  Role? role;

  MessageParticipantType({this.roleId, this.role});

  MessageParticipantType.fromJson(Map<String, dynamic> json) {
    roleId = json['RoleId'];
    role = json['Role'] != null ? Role.fromJson(json['Role']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['RoleId'] = roleId;
    if (role != null) {
      data['Role'] = role!.toJson();
    }
    return data;
  }
}

class Role {
  String? roleName;

  Role({this.roleName});

  Role.fromJson(Map<String, dynamic> json) {
    roleName = json['RoleName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['RoleName'] = roleName;
    return data;
  }
}
