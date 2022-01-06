enum RESTState {
  Ok,
  BadRequest,
  Unauthorized,
  Forbidden,
  NotFound,
  InternalServerError,
  Uavailable
}

class HttpMsg {
  RESTState _state = RESTState.Ok;
  String contentJson = '';
}
