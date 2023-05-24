import 'package:args/command_runner.dart';
import 'package:cli_example/cli_example.dart';

void main(List<String> arguments) {
  CommandRunner(
    "cli_example",
    "Dart CLI example",
  )
    ..addCommand(Echo())
    ..run(arguments);
}
