abstract class Response<T> {
  final T? data;
  final String? errorMsg;

  const Response({
    this.data,
    this.errorMsg,
  });
}

class ResponseSuccess<T> extends Response<T> {
  const ResponseSuccess(T data) : super(data: data);
}

class ResponseError extends Response {
  const ResponseError(String errorMsg) : super(errorMsg: errorMsg);
}
