sealed class Result<T> {
  Object get exception => throw UnimplementedError();
}

class SuccessResult<T> extends Result<T> {
  T data;
  SuccessResult(this.data);
}

class FailureResult<T> extends Result<T> {
  @override
  Exception exception;
  FailureResult(this.exception);
}
