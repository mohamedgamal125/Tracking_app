sealed class UpdateOrderStateStates {}

final class UpdateOrderStateInitial extends UpdateOrderStateStates {}

final class UpdateOrderStateLoading extends UpdateOrderStateStates {}

final class UpdateOrderStateSuccess extends UpdateOrderStateStates {}

final class UpdateOrderStateError extends UpdateOrderStateStates {
  final String message;

  UpdateOrderStateError({required this.message});
}
