import 'package:flutter/material.dart';

class TextOverflowWidget extends StatelessWidget {
  const TextOverflowWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: MediaQuery.of(context).size.height / 2,
        child: Column(
          children: [
            Text(
              "臣亮言：先帝創業未半，而中道崩殂。今天下三分，益州疲敝，此誠危急存亡之秋也！然侍衞之臣，不懈於內；忠志之士，忘身於外者，蓋追先帝之殊遇，欲報之於陛下也。誠宜開張聖聽，以光先帝遺德，恢弘志士之氣；不宜妄自菲薄，引喻失義，以塞忠諫之路也。",
              overflow: TextOverflow.ellipsis,
              softWrap: false,
              style: TextStyle(
                fontSize: 60,
              ),
            ),
            Text(
              "臣亮言：先帝創業未半，而中道崩殂。今天下三分，益州疲敝，此誠危急存亡之秋也！然侍衞之臣，不懈於內；忠志之士，忘身於外者，蓋追先帝之殊遇，欲報之於陛下也。誠宜開張聖聽，以光先帝遺德，恢弘志士之氣；不宜妄自菲薄，引喻失義，以塞忠諫之路也。",
              overflow: TextOverflow.fade,
              softWrap: false,
              maxLines: 1,
              style: TextStyle(
                fontSize: 60,
              ),
            ),
            Text(
              "臣亮言：先帝創業未半，而中道崩殂。今天下三分，益州疲敝，此誠危急存亡之秋也！然侍衞之臣，不懈於內；忠志之士，忘身於外者，蓋追先帝之殊遇，欲報之於陛下也。誠宜開張聖聽，以光先帝遺德，恢弘志士之氣；不宜妄自菲薄，引喻失義，以塞忠諫之路也。",
              overflow: TextOverflow.clip,
              softWrap: false,
              style: TextStyle(
                fontSize: 60,
              ),
            )
          ],
        ),
      ),
    );
  }
}
