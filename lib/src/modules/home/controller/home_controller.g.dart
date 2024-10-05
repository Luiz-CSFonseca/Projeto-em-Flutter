// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeController on _HomeControllerBase, Store {
  late final _$enderecoConsultadoAtom =
      Atom(name: '_HomeControllerBase.enderecoConsultado', context: context);

  @override
  String? get enderecoConsultado {
    _$enderecoConsultadoAtom.reportRead();
    return super.enderecoConsultado;
  }

  @override
  set enderecoConsultado(String? value) {
    _$enderecoConsultadoAtom.reportWrite(value, super.enderecoConsultado, () {
      super.enderecoConsultado = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_HomeControllerBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$errorMessageAtom =
      Atom(name: '_HomeControllerBase.errorMessage', context: context);

  @override
  String? get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String? value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  late final _$consultarCepAsyncAction =
      AsyncAction('_HomeControllerBase.consultarCep', context: context);

  @override
  Future<void> consultarCep(String cep, BuildContext context) {
    return _$consultarCepAsyncAction
        .run(() => super.consultarCep(cep, context));
  }

  late final _$tracarRotaAsyncAction =
      AsyncAction('_HomeControllerBase.tracarRota', context: context);

  @override
  Future<void> tracarRota() {
    return _$tracarRotaAsyncAction.run(() => super.tracarRota());
  }

  @override
  String toString() {
    return '''
enderecoConsultado: ${enderecoConsultado},
isLoading: ${isLoading},
errorMessage: ${errorMessage}
    ''';
  }
}
