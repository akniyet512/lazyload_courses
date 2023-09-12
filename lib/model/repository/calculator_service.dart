
import 'package:lazyload_courses/model/repository/summator.dart';

enum CalculatorServiceOperation { summ }

class CalculatorService {
  final summator = const Summator();

  const CalculatorService();
  int calculate(int a, int b, CalculatorServiceOperation operation) {
    if (operation == CalculatorServiceOperation.summ) {
      return summator.summ(a, b);
    } else {
      return 0;
    }
  }
}