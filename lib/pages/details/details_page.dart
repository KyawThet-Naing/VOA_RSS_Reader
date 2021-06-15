import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:voa/ob/news_ob.dart';
import 'package:voa/pages/web/web_page.dart';
import 'package:voa/utils/reusable_widget.dart';
import 'package:voa/utils/context_exts.dart';

class DetailsPage extends StatelessWidget {
  final NewItems newItems;

  const DetailsPage({Key? key, required this.newItems}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(physics: BouncingScrollPhysics(), slivers: [
        SliverAppBar(
          stretch: true,
          pinned: true,
          expandedHeight: 200,
          flexibleSpace: FlexibleSpaceBar(
            title: Text(
              Reusable.mmText('${newItems.title}'),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 15, height: 1.5),
            ),
            background: Hero(
              tag: '${newItems.enclosure!.link}',
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl: '${newItems.enclosure!.link}',
                placeholder: (_, __) =>
                    Center(child: CircularProgressIndicator()),
                errorWidget: (_, __, ___) =>
                    Center(child: Icon(Icons.error, color: Colors.red)),
              ),
            ),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.all(20),
          sliver: SliverToBoxAdapter(
              child: Text(
                  'Published Date : ${Reusable.mmText('${newItems.pubDate}')}')),
        ),
        SliverPadding(
          padding: EdgeInsets.all(20),
          sliver: SliverToBoxAdapter(
              child: Text(Reusable.mmText('${newItems.title}'))),
        ),
        SliverPadding(
          padding: EdgeInsets.all(20),
          sliver: SliverToBoxAdapter(
              child: Text(Reusable.mmText('${newItems.content}'))),
        ),
        SliverToBoxAdapter(
          child: MaterialButton(
            height: 50,
            onPressed: () =>
                context.pushPage(WebViewPage(url: newItems.link.toString())),
            child: Text('Read More From Website'),
          ),
        )
      ]),
    );
  }
}
