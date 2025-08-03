sealed class SendState {}

class SendStateInit extends SendState {}

class SendStateLoading extends SendState {}

class SendStateSuccess extends SendState {
  SendStateSuccess(this.transactionHash);
  
  final String transactionHash;
}

class SendStateError extends SendState {
  SendStateError(this.message);
  
  final String message;
}