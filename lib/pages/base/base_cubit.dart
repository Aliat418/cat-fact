import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'base_state.dart';

abstract class BaseCubit<T extends BaseState> extends Cubit<T> {
  BaseCubit(super.initialState);
  // Performing asynchronous operations with error handling
  Future<void> perform(AsyncCallback function) async {
    try {
      await function();
    } on Exception catch (exception) {
      handleError(exception);
    }
  }

// Currently not implemented by subclasses
  void handleError(Exception exception);

// Reset the error state by emitting a new state with the same properties
  void resetError() {
    emit(state.copyWith() as T);
  }
}
