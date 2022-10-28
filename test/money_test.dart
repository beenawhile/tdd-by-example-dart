import 'package:tdd_by_example/dollar.dart';
import 'package:tdd_by_example/franc.dart';
import 'package:tdd_by_example/money.dart';
import 'package:test/test.dart';

void main() {
  test(
    "Classes derived from Money should be equal",
    () async {
      expect(Money.dollar(5).equals(Money.franc(5)), true);
    },
  );

  test(
    "Subclasses of Money returns right currency",
    () async {
      expect("USD", Money.dollar(1).currency);
      expect("CHF", Money.franc(1).currency);
    },
  );
}
