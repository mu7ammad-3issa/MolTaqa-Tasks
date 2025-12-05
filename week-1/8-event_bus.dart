class Event {
  final String message;

  Event({required this.message});
}

// subscriber
class Listener {
  void update(Event event) {
    print('I got \'${event.message}\' ');
  }
}

// publisher
class EventBus {
  final List<Listener> _listeners = [];

  void subscribe(Listener listener) {
    _listeners.add(listener);
  }

  void unsubscribe(Listener listener) {
    _listeners.remove(listener);
  }

  void emit(Event event) {
    for (final listener in _listeners) {
      listener.update(event);
    }
  }
}

void main() {
  final eventBus = EventBus();

  final l1 = Listener();

  eventBus.subscribe(l1);

  final e1 = Event(message: 'user logged in');

  eventBus.emit(e1);
}
