import 'dart:developer';

abstract class Plugin {
  void execute();
}

class LoggerPlugin implements Plugin {
  final String message;

  LoggerPlugin({required this.message});

  @override
  void execute() {
    log(message);
  }
}

class AnalyticsPlugin implements Plugin {
  @override
  void execute() {
    print('analysing ... ');
  }
}

class Application {
  final List<Plugin> plugins = [];

  void register(Plugin plugin) {
    plugins.add(plugin);
  }

  void run() {
    for (Plugin plugin in plugins) {
      plugin.execute();
    }
  }
}

void main() {
  final app1 = Application();

  app1.register(LoggerPlugin(message: 'The response has been returned'));
  app1.register(AnalyticsPlugin());

  app1.run();
}
