import 'package:err_rss_reader/presentation/style/app_colors.dart';
import 'package:err_rss_reader/presentation/style/app_text_style.dart';
import 'package:flutter/material.dart';

class ArticleForm extends StatelessWidget {
  const ArticleForm({
    super.key,
    required this.image,
    required this.title,
    required this.pubDate,
  });

  final String image;
  final String title;
  final String pubDate;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.of(context).push(MaterialPageRoute(
        //   builder: (context) => FullScreenPhoto(photoUrl: image),
        // ));
      },
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.only(bottom: 15, left: 15, right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              maxLines: 2,
              textAlign: TextAlign.start,
              style: getHeaderStyle(
                fontSize: 18,
                color: AppColors.textLight,
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 200,
              width: double.infinity,
              child: Image.network(
                image,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              pubDate,
              maxLines: 2,
              textAlign: TextAlign.start,
              style: getBodyStyle(
                fontSize: 14,
                color: AppColors.textLight,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
