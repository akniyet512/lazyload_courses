
import 'package:lazyload_courses/model/repository/calculator_service.dart';


abstract class ExampleViewModel {
  void onPressMe();
  void onPressMe2();
}

class ExampleCalcViewModel implements ExampleViewModel {
  final calculatorService = const CalculatorService();

  const ExampleCalcViewModel();

  @override
  void onPressMe() {
    final result = calculatorService.calculate(
      1,
      2,
      CalculatorServiceOperation.summ,
    );
    print(result);
  }

  @override
  void onPressMe2() {
    print("5");
  }
}

class ExamplePetViewModel implements ExampleViewModel {
  const ExamplePetViewModel();

  @override
  void onPressMe() {
    print("гав гав");
  }

  @override
  void onPressMe2() {
    print("мяу мяу");
  }
}