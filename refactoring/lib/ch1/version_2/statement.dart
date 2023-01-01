import 'dart:math' as math;
import 'index.dart';

class Statement {
  String statement(Invoice invoice, Plays plays) {
    double totalAmount = 0;
    int volumeCredits = 0;
    String result = 'Statement for ${invoice.customer}\n';

    for (final perf in invoice.performances) {
      Play? play = plays.getPlay(perf);
      double thisAmount = 0;
      switch (play?.type) {
        case PlayType.tragedy:
          thisAmount = 40000;
          if (perf.audience > 30) {
            thisAmount += 1000 * (perf.audience - 30);
          }
          break;
        case PlayType.comedy:
          thisAmount = 30000;
          if (perf.audience > 20) {
            thisAmount += 10000 + 500 * (perf.audience - 20);
          }
          thisAmount += 300 * perf.audience;
          break;
        default:
          throw ArgumentError('unknown type: ${play?.type}');
      }
      // add volume credits
      volumeCredits += math.max(perf.audience - 30, 0);
      // add extra credit for every ten comedy attendees
      if (play?.type == PlayType.comedy) {
        volumeCredits += (perf.audience / 5).floor();
      }
      // print line for this order
      result +=
          '\t${play?.name}: \$${(thisAmount / 100).floor()} (${perf.audience} seats)\n';
      totalAmount += thisAmount;
    }
    result +=
        'Amount owed is \$${(totalAmount / 100).floor()}\nYou earned $volumeCredits credits';
    return result;
  }
}