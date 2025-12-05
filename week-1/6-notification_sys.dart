abstract class NotificationChannel {
  void send(String message);
}

class EmailNotification implements NotificationChannel {
  @override
  void send(String message) {
    print('This is an email and it\'s content is: $message');
  }
}

class SMSNotification implements NotificationChannel {
  @override
  void send(String message) {
    print('This is a SMS and it\'s content is: $message');
  }
}

class PushNotification implements NotificationChannel {
  @override
  void send(String message) {
    print('Notify user with $message');
  }
}
