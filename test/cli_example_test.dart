import 'package:args/command_runner.dart';
import 'package:cli_example/cli_example.dart';
import 'package:run_with_print/run_with_print.dart';
import 'package:test/test.dart';

void main() {
  final runner = CommandRunner('test', 'test')..addCommand(Echo());

  test('Echo test message', () async {
    await runWithPrint((logs) async {
      await runner.run(['echo', '--message', 'test message']);
      expect(logs, ['Message: test message']);
    });
  });
}
