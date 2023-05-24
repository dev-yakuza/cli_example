import 'package:args/command_runner.dart';
import 'package:cli_example/cli_example.dart';

void main() async {
  final cmd = CommandRunner(
    "cli_example",
    "Dart CLI example",
  )..addCommand(Echo());

  await cmd.run(['echo', '--message', 'test message']);
}
