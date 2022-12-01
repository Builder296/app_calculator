part of 'calculator_bloc.dart';

@immutable
abstract class CalculatorEvent {
  @override
  List<Object> get props => [];
}

class OperandEvent extends CalculatorEvent {
  final String Operand;
  OperandEvent({required this.Operand});
  @override
  List<Object> get props => [Operand];
}

class OperatorEvent extends CalculatorEvent {
  final String Operator;
  OperatorEvent({required this.Operator});
  @override
  List<Object> get props => [Operator];
}

class PlusMinusEvent extends CalculatorEvent {
  final String Operator;
  PlusMinusEvent({required this.Operator});
  @override
  List<Object> get props => [Operator];
}


class AnwerEvent extends CalculatorEvent {
  
}