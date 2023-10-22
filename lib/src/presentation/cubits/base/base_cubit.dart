import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';

abstract class BaseCubit<S, T> extends Cubit<S> {
  T _data;

  BaseCubit(S initialState, this._data) : super(initialState);

  @protected
  T get data => _data;

  bool _isBusy = false;
  bool get isBusy => _isBusy;

  @protected
  Future<void> run(Future<void> Function() process) async {
    if (!_isBusy) {
      _isBusy = true;
      await process();
      _isBusy = false;
    }
  }
}
