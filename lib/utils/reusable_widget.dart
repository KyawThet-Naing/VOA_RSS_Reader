import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rabbit_converter/rabbit_converter.dart';
import 'package:voa/ob/news_ob.dart';
import 'package:voa/pages/details/details_page.dart';
import 'package:voa/utils/context_exts.dart';
class Reusable {
  static Widget newsWidget(
          {required NewItems newItems, required BuildContext context}) =>
      Card(
        child: ListTile(
          onTap: () =>context.pushPage(DetailsPage(newItems: newItems)),
          contentPadding: EdgeInsets.all(10),
          leading: SizedBox(
            height: 80,
            width: 100,
            child: Hero(
              tag: '${newItems.enclosure!.link}',
              child: CachedNetworkImage(
                imageUrl: '${newItems.enclosure!.link}',
                placeholder: (_, __) =>
                    Center(child: CircularProgressIndicator()),
                errorWidget: (_, __, ___) =>
                    Center(child: Icon(Icons.error, color: Colors.red)),
              ),
            ),
          ),
          title: Text(
            mmText('${newItems.title}'),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          subtitle: Text(mmText('${newItems.pubDate}')),
        ),
      );

  static String mmText(String text) => Rabbit.zg2uni(text);
}
