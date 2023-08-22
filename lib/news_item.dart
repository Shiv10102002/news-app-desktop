import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsapp/model/article.dart';
import 'package:transparent_image/transparent_image.dart';
// import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share_plus/share_plus.dart';

class NewsItem extends StatefulWidget {
  final Article article;
  const NewsItem({super.key, required this.article});

  @override
  State<NewsItem> createState() => _NewsItemState();
}

class _NewsItemState extends State<NewsItem> {
  openDialog(String url) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          children: [
            SimpleDialogOption(
              child: const Text(
                "Open in Browser",
              ),
              onPressed: () {
                // setState(() {
                //   launchUrl(Uri.parse(url), mode: LaunchMode.inAppWebView);
                // });
                launchUrl(Uri.parse(url), mode: LaunchMode.inAppWebView);
              },
            ),
            SimpleDialogOption(
              child: const Text(
                "Send",
              ),
              onPressed: () {
                // Share.share('Check out this article ${url}');
                Share.share('Check out this article $url');
              },
            ),
            SimpleDialogOption(
              child: const Text(
                "Copy URL",
              ),
              onPressed: () {
                FlutterClipboard.copy(url);
                Get.snackbar("Copied ", url,
                    maxWidth: 600,
                    snackPosition: SnackPosition.BOTTOM,
                    colorText: Colors.black);
              },
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        launchUrl(Uri.parse(widget.article.uri), mode: LaunchMode.inAppWebView);
      },
      child: Card(
        // padding: const EdgeInsets.only(bottom: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(6), topRight: Radius.circular(6)),
              child: Container(
                  width: double.infinity,
                  height: 180,
                  color: Colors.grey.shade700,
                  child: FadeInImage.memoryNetwork(
                      placeholder: kTransparentImage,
                      imageErrorBuilder: (ctx, error, stackTrace) {
                        return Icon(Icons.image, color: Colors.grey.shade300);
                      },
                      fit: BoxFit.cover,
                      image: widget.article.urlToImage ??
                          'https://via.placeholder.com/180')),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
                child: Text(
                  widget.article.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textScaleFactor: 1,
                  style:
                      const TextStyle(color: Color.fromRGBO(10, 1, 2, 0.838)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8, right: 8, left: 8),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      widget.article.captionText(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(Icons.menu),
                    onPressed: () {
                      openDialog(widget.article.uri);
                    },
                  )
                  // DropDownButton<String>(
                  //    Value:drop
                  //     title:  Icon(Icons.menu),
                  //     items: [
                  //       DropDownButtonItem(
                  //           title: const Text('Open in Browser'),
                  //           leading: const Icon(FluentIcons.edge_logo),
                  //           onTap: (() async {
                  //             if (!await launch(article.uri)) {
                  //               log('Could not launch url ${article.uri}');
                  //             }
                  //           })),
                  //       DropDownButtonItem(
                  //           title: const Text('Send'),
                  //           leading: const Icon(FluentIcons.send),
                  //           onTap: (() {
                  //             Share.share(
                  //                 'Check out this article ${article.uri}');
                  //           })),
                  //       DropDownButtonItem(
                  //           title: const Text('Copy URL'),
                  //           leading: const Icon(FluentIcons.copy),
                  //           onTap: (() {
                  //             FlutterClipboard.copy(article.uri).then(
                  //                 (value) => showCopiedSnackbar(
                  //                     context, article.uri));
                  // }
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
