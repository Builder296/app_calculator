part of 'calculator_bloc.dart';

@immutable
abstract class CalculatorState {

  @override
  String get output => "";

  @override

  @override
  List<Object> get props => [];
}

class CalculatorInitial extends CalculatorState {
  CalculatorInitial({this.output = "0"});
  final String output;

  @override
  List<Object> get props => [output];
}


class CalculatorFirstOperand extends CalculatorState {
  CalculatorFirstOperand(this.first);
  final String first;

  @override
  String get output => first;

  @override
  List<Object> get props => [output];
}


class CalculatorAnwer extends CalculatorState {
  CalculatorAnwer(this.anwer);
  final String anwer;


  @override
  String get output => anwer;
  

}
