class NotificationModel {
  int? notificationId;
  int? refId;
  String? title;
  String? message;
  int? notificationType;
  int? isRead;
  String? createdDate;

  NotificationModel(
      {this.notificationId,
      this.refId,
      this.title,
      this.message,
      this.notificationType,
      this.isRead,
      this.createdDate});

  NotificationModel.fromJson(Map<String, dynamic> json) {
    notificationId = json['notification_id'];
    refId = json['ref_id'];
    title = json['title'];
    message = json['message'];
    notificationType = json['notification_type'];
    isRead = json['is_read'];
    createdDate = json['created_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['notification_id'] = notificationId;
    data['ref_id'] = refId;
    data['title'] = title;
    data['message'] = message;
    data['notification_type'] = notificationType;
    data['is_read'] = isRead;
    data['created_date'] = createdDate;
    return data;
  }
}
