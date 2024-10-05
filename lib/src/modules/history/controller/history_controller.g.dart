// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HistoryController on _HistoryControllerBase, Store {
  late final _$historicoEnderecosAtom =
      Atom(name: '_HistoryControllerBase.historicoEnderecos', context: context);

  @override
  ObservableList<String> get historicoEnderecos {
    _$historicoEnderecosAtom.reportRead();
    return super.historicoEnderecos;
  }

  @override
  set historicoEnderecos(ObservableList<String> value) {
    _$historicoEnderecosAtom.reportWrite(value, super.historicoEnderecos, () {
      super.historicoEnderecos = value;
    });
  }

  late final _$_HistoryControllerBaseActionController =
      ActionController(name: '_HistoryControllerBase', context: context);

  @override
  void carregarHistorico() {
    final _$actionInfo = _$_HistoryControllerBaseActionController.startAction(
        name: '_HistoryControllerBase.carregarHistorico');
    try {
      return super.carregarHistorico();
    } finally {
      _$_HistoryControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removerHistorico(int index) {
    final _$actionInfo = _$_HistoryControllerBaseActionController.startAction(
        name: '_HistoryControllerBase.removerHistorico');
    try {
      return super.removerHistorico(index);
    } finally {
      _$_HistoryControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void limparHistorico() {
    final _$actionInfo = _$_HistoryControllerBaseActionController.startAction(
        name: '_HistoryControllerBase.limparHistorico');
    try {
      return super.limparHistorico();
    } finally {
      _$_HistoryControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
historicoEnderecos: ${historicoEnderecos}
    ''';
  }
}
