import 'package:teste/utils/calcWithOperator.dart';
import 'package:teste/utils/doubleOfExpression.dart';
import 'package:teste/utils/operatorsOfExpression.dart';

calcExpression(String expression){
  List<String> characters = [];
  List<double> numbers = [];

  numbers = doubleOfExpression(expression);

  characters = operatorsOfExpression(expression);

  double total = 0;
  int currentCharacter = 0;

  total = calcWithOperator(numbers[0], numbers[1], characters[currentCharacter]);
  characters.removeAt(0);

  for(int i = 2 ; i <= numbers.length; i++ ) {

    if(characters.isEmpty) break;

    total = calcWithOperator(total, numbers[i], characters[0]);
    characters.removeAt(0);
  }

  return total;
}