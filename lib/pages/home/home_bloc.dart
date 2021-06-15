import 'dart:async';
import 'package:dio/dio.dart';
import 'package:voa/ob/news_ob.dart';
import 'package:voa/ob/response_ob.dart';
import 'package:voa/utils/app_constants.dart';

class HomeBloc {
  StreamController<ResponseOb> _mmController = StreamController();

  StreamController<ResponseOb> _inController = StreamController();

  Stream<ResponseOb> getMMStream() => _mmController.stream;

  Stream<ResponseOb> getINStream() => _inController.stream;

  Dio dio = Dio();

  getMMNews() async {
    ResponseOb responseOb = ResponseOb(msgState: MsgState.loading);
    _mmController.sink.add(responseOb);
    Response<dynamic> response = await dio.get(MM_RSS_URL);
    if (response.statusCode == 200) {
      NewsOb newsOb = NewsOb.fromJson(response.data);
      responseOb.msgState = MsgState.data;
      responseOb.data = newsOb;
      _mmController.sink.add(responseOb);
    } else if (response.statusCode == 404) {
      responseOb.msgState = MsgState.error;
      responseOb.errState = ErrState.notFoundErr;
      _mmController.sink.add(responseOb);
    } else if (response.statusCode == 500) {
      responseOb.msgState = MsgState.error;
      responseOb.errState = ErrState.serverErr;
      _mmController.sink.add(responseOb);
    } else {
      responseOb.msgState = MsgState.error;
      responseOb.errState = ErrState.otherErr;
      _mmController.sink.add(responseOb);
    }
  }

  getINNews() async {
    ResponseOb responseOb = ResponseOb(msgState: MsgState.loading);
    _inController.sink.add(responseOb);
    Response<dynamic> response = await dio.get(IN_RSS_URL);
    if (response.statusCode == 200) {
      NewsOb newsOb = NewsOb.fromJson(response.data);
      responseOb.msgState = MsgState.data;
      responseOb.data = newsOb;
      _inController.sink.add(responseOb);
    } else if (response.statusCode == 404) {
      responseOb.msgState = MsgState.error;
      responseOb.errState = ErrState.notFoundErr;
      _inController.sink.add(responseOb);
    } else if (response.statusCode == 500) {
      responseOb.msgState = MsgState.error;
      responseOb.errState = ErrState.serverErr;
      _inController.sink.add(responseOb);
    } else {
      responseOb.msgState = MsgState.error;
      responseOb.errState = ErrState.otherErr;
      _inController.sink.add(responseOb);
    }
  }

  disposed() {
    _mmController.close();
    _inController.close();
  }
}
