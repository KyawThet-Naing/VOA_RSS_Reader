class ResponseOb {
  ErrState? errState;
  MsgState? msgState;
  PageState? pageState;
  dynamic data;

  ResponseOb({this.errState, this.msgState, this.pageState, this.data});
}

enum ErrState {
  notFoundErr,
  serverErr,
  otherErr,
}

enum MsgState {
  loading,
  data,
  error,
  other,
}

enum PageState {
  first,
  load,
  no_more,
  other,
}
