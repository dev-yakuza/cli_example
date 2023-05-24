import 'dart:async';

import 'package:args/command_runner.dart';
import 'package:cli_example/cli_example.dart';
import 'package:test/test.dart';

void main() {
  final runner = CommandRunner('test', 'test')..addCommand(Echo());

  test('Echo test message', runWithPrint((logs) async {
    await runner.run(['echo', '--message', 'test message']);
    expect(logs, ['Message: test message']);
  }));
}

void Function() runWithPrint(void Function(List<String> logs) testFn) => () {
      List<String> logs = [];

      var spec = ZoneSpecification(print: (_, __, ___, String msg) {
        logs.add(msg);
      });

      void callback() {
        testFn(logs);
      }

      return Zone.current.fork(specification: spec).run<void>(callback);
    };
