import 'package:flutter/material.dart';
import 'package:voa/ob/news_ob.dart';
import 'package:voa/ob/response_ob.dart';
import 'package:voa/utils/exts.dart';
import 'package:voa/pages/home/home_bloc.dart';
import 'package:voa/utils/reusable_widget.dart';

class InternationalTab extends StatefulWidget {
  const InternationalTab({Key? key}) : super(key: key);

  @override
  _InternationalTabState createState() => _InternationalTabState();
}

class _InternationalTabState extends State<InternationalTab> {
  HomeBloc _bloc = HomeBloc();

  @override
  void initState() {
    _bloc.getINNews();
    super.initState();
  }

  @override
  void dispose() {
    _bloc.disposed();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _bloc.getINStream().streamWidget(
        dataWidget: (ResponseOb responseOb) {
      NewsOb newsOb = responseOb.data;
      return ListView(
          physics: BouncingScrollPhysics(),
          children: newsOb.items!
              .map((e) => Reusable.newsWidget(context: context,newItems: e))
              .toList());
    });
  }
}
