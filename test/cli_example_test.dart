import 'dart:async';

import 'package:args/command_runner.dart';
import 'package:cli_example/cli_example.dart';
import 'package:test/test.dart';

var log = [];

void main() {
  final runner = CommandRunner('test', 'test')..addCommand(Echo());

  setUp(() {
    log = [];
  });

  test('Echo test message', runWithPrint(() async {
    await runner.run(['echo', '--message', 'test message']);
    expect(log, ['Message: test message']);
  }));
}

void Function() runWithPrint(void Function() testFn) => () {
      var spec = ZoneSpecification(print: (_, __, ___, String msg) {
        log.add(msg);
      });
      return Zone.current.fork(specification: spec).run<void>(testFn);
    };
