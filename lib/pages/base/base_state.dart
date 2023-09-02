import 'package:equatable/equatable.dart';

enum PageStatus<T> {
  loading,
  loaded,
}

class BaseState extends Equatable {
  final PageStatus status;
  final Exception? error;

  const BaseState({
    this.status = PageStatus.loading,
    this.error,
  });

  BaseState copyWith({
    PageStatus? status,
    Exception? error,
  }) {
    return BaseState(
      status: status ?? this.status,
      error: error,
    );
  }

  @override
  List<Object?> get props {
    return [
      status,
      error,
    ];
  }
}
