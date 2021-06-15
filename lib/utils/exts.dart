import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:voa/ob/response_ob.dart';

extension StreamExtension on Stream<ResponseOb> {
  Widget streamWidget(
      {required Widget Function(ResponseOb responseOb) dataWidget}) {
    return StreamBuilder<ResponseOb>(
        stream: this,
        initialData: ResponseOb(msgState: MsgState.loading),
        builder: (_, AsyncSnapshot<ResponseOb> snapshot) {
          ResponseOb rsp = snapshot.data!;
          if (rsp.msgState == MsgState.data) {
            return dataWidget(rsp);
          } else if (rsp.msgState == MsgState.error) {
            if (rsp.errState == ErrState.serverErr) {
              return Center(child: Text('500\nServer Error'));
            } else if (rsp.errState == ErrState.notFoundErr) {
              return Center(child: Text('404\nServer Error'));
            } else {
              return Center(child: Text('Unknown Error'));
            }
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }
}
