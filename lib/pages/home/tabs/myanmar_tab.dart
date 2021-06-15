import 'package:flutter/material.dart';
import 'package:voa/ob/news_ob.dart';
import 'package:voa/ob/response_ob.dart';
import 'package:voa/pages/home/home_bloc.dart';
import 'package:voa/utils/exts.dart';
import 'package:voa/utils/reusable_widget.dart';

class MyanmarTab extends StatefulWidget {
  const MyanmarTab({Key? key}) : super(key: key);

  @override
  _MyanmarTabState createState() => _MyanmarTabState();
}

class _MyanmarTabState extends State<MyanmarTab> {
  HomeBloc _bloc = HomeBloc();

  @override
  void initState() {
    _bloc.getMMNews();
    super.initState();
  }

  @override
  void dispose() {
    _bloc.disposed();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _bloc.getMMStream().streamWidget(
        dataWidget: (ResponseOb responseOb) {
      NewsOb newsOb = responseOb.data;
      return ListView(
        physics: BouncingScrollPhysics(),
        children: newsOb.items!
            .map((e) => Reusable.newsWidget(context: context, newItems: e))
            .toList(),
      );
    });
  }
}
