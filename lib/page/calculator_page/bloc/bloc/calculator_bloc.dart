import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

part 'calculator_event.dart';
part 'calculator_state.dart';

class CalculatorBloc extends Bloc<CalculatorEvent, CalculatorState> {
  CalculatorBloc() : super(CalculatorInitial()) {
    on<OperandEvent>(_handleOperand);
    on<OperatorEvent>(_handleOprator);
    on<PlusMinusEvent>(_handlePlusMinus);
    on<AnwerEvent>(_handleAnwer);
  }
  void _handleOperand(OperandEvent event, Emitter<CalculatorState> emit) {
    if (state is CalculatorInitial) {
      emit(CalculatorFirstOperand(event.Operand));
    } else if (state is CalculatorFirstOperand) {
      emit(CalculatorFirstOperand("${state.output}${event.Operand}"));
    }
  }

  List<String> OperatorList = ['+', '-', 'x', '/', '%'];
  void _handleOprator(OperatorEvent event, Emitter<CalculatorState> emit) {
    if (event.Operator == 'C') {
      emit(CalculatorInitial());
    } else if (OperatorList.contains(event.Operator)) {
      emit(CalculatorFirstOperand("${state.output} ${event.Operator} "));
    } else if (event.Operator == '+/-') {
      if (state.output.startsWith("-")) {
        emit(CalculatorFirstOperand(state.output.substring(1)));
      } else {
        emit(CalculatorFirstOperand("-${state.output}"));
      }
    }
  }

  void _handlePlusMinus(PlusMinusEvent event, Emitter<CalculatorState> emit) {
    if (state.output.startsWith("-")) {
      emit(CalculatorFirstOperand(state.output.substring(1)));
    } else {
      emit(CalculatorFirstOperand("-${state.output}"));
    }
  }

  void _handleAnwer(AnwerEvent event, Emitter<CalculatorState> emit) {
    final listQueation = state.output.split(" ");
    while (true) {
      if (listQueation.contains('%')) {
        _calAndReplaceWithResult(listQueation, '%');
      } else if (listQueation.contains('x')) {
        _calAndReplaceWithResult(listQueation, 'x');
      } else if (listQueation.contains('/')) {
        _calAndReplaceWithResult(listQueation, '/');
      } else if (listQueation.contains('+')) {
        _calAndReplaceWithResult(listQueation, '+');
      } else if (listQueation.contains('-')) {
        _calAndReplaceWithResult(listQueation, '-');
      }

      if (listQueation.length == 1) {
        break;
      }
    }
    emit(CalculatorAnwer(listQueation[0]));
  }

  List<String> _calAndReplaceWithResult(
      List<String> listQueation, String Operator) {
    double result = 0.0;
    final positionOperator = listQueation.indexWhere((e) => e == Operator);
    debugPrint('==> ${positionOperator}');

    if (Operator == '%') {
      result += double.parse(listQueation[positionOperator - 1]) / 100;
      dynamic res = listQueation.removeAt(positionOperator -1);
      debugPrint('==> ${listQueation}');
      final positionOperator2 = listQueation.indexWhere((e) => e == Operator);
      listQueation[positionOperator2] = '${result}';
      debugPrint('==> ${listQueation}');
    } else {
      if (Operator == 'x') {
        result += double.parse(listQueation[positionOperator - 1]) *
            double.parse(listQueation[positionOperator + 1]);
      } else if (Operator == '/') {
        result += double.parse(listQueation[positionOperator - 1]) /
            double.parse(listQueation[positionOperator + 1]);
      } else if (Operator == '+') {
        result += double.parse(listQueation[positionOperator - 1]) +
            double.parse(listQueation[positionOperator + 1]);
      } else if (Operator == '-') {
        result += double.parse(listQueation[positionOperator - 1]) -
            double.parse(listQueation[positionOperator + 1]);
      }
      dynamic res = listQueation.removeAt(positionOperator - 1);
      final positionOperator2 = listQueation.indexWhere((e) => e == Operator);
      dynamic res2 = listQueation.removeAt(positionOperator2 + 1);
      final positionOperator3 = listQueation.indexWhere((e) => e == Operator);
      listQueation[positionOperator3] = '${result}';
    }

    return listQueation;
  }
}
