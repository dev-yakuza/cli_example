import 'package:args/command_runner.dart';

class Echo extends Command {
  @override
  final name = 'echo';

  @override
  final description = 'Echo option';

  Echo() {
    argParser.addOption('message', help: 'A message to echo');
  }

  @override
  void run() {
    String? message = argResults?['message'];

    // ignore: avoid_print
    print('Message: $message');
  }
}
