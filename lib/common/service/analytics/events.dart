abstract class MyEvent {
  final String eventType;
  final Map<String, dynamic>? eventProperties;

  MyEvent(this.eventType, [this.eventProperties]);
}

class OnStartApp extends MyEvent {
  OnStartApp() : super('OnStartApp');
}
