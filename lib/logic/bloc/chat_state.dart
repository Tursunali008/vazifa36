
sealed class ChatStates {}

final class InitialState extends ChatStates {}

final class LoadingState extends ChatStates {}

final class LoadedState extends ChatStates {}

final class ErrorState extends ChatStates {}
