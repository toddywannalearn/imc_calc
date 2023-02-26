import 'package:test/test.dart';

import '../bin/dart_playgroud.dart';

void main() {
  test('calculaImc', () {
    expect(calculaImc(peso: 84.0, altura: 1.71), 29.0);
  });
}
