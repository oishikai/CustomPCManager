import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../config/size_config.dart';
import '../models/pc_parts.dart';

class partsListCell extends StatelessWidget {
  partsListCell(this.parts, {Key? key}) : super(key: key);
  Pcparts parts;
  List<Icon> stars = [];

  List<Icon> describeStars (Pcparts parts){
    const fullStar = Icon(
      Icons.star,
      color: Colors.orange,
      size: 20,
    );

    const halfStar = Icon(
      Icons.star_half,
      color: Colors.orange,
      size: 20,
    );

    const emptyStar = Icon(
      Icons.star_border_purple500_sharp,
      color: Colors.orange,
      size: 20,
    );

    if (parts.star == null) {
      return List.filled(5, emptyStar);
    }

    final star = parts.star!;

    List<Icon> stars = [];

    final fullStarCount = star ~/ 10;
    final fullStars = List.filled(fullStarCount, fullStar);
    stars.addAll(fullStars);

    if (star % 10 == 0) {
      final emptyStarCount = 5 - fullStarCount;
      final emptyStars = List.filled(emptyStarCount, emptyStar);

      stars.addAll(emptyStars);
    } else {
      stars.add(halfStar);
      final emptyStarCount = 4 - fullStarCount;
      final emptyStars = List.filled(emptyStarCount, emptyStar);
      stars.addAll(emptyStars);
    }

    return stars;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
            onTap: () {

            },
            child: Container(
              padding: EdgeInsets.all(SizeConfig.blockSizeHorizontal * 1,),
              height: 140,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Container(
                          width: SizeConfig.blockSizeHorizontal * 45,
                          height: 160 - SizeConfig.blockSizeHorizontal * 0.5,
                          child: Image.network(
                              parts.image
                          )
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          width: 55,
                          height: 18,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(width: 4,),
                              Icon(
                                Icons.local_mall_outlined,
                                color: Colors.orangeAccent,
                                size: 16,
                              ),
                              Text(
                                '${parts.ranked}???',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.orange,
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(width: SizeConfig.blockSizeHorizontal * 1,),
                  Container(
                    padding: EdgeInsets.all(SizeConfig.blockSizeHorizontal * 1,),
                    width: SizeConfig.blockSizeHorizontal * 50,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(245, 245, 245, 1),
                    ),
                    child: Column(
                      children: [
                        Container(
                          height: 16,
                          width: double.infinity,
                          child: Row(
                            children: [
                              Text(
                                parts.maker,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.blueGrey,
                                ),
                              ),
                              SizedBox(width: 8,),
                              Visibility(
                                visible: parts.isNew,
                                child: Container(
                                  padding: EdgeInsets.all(2),
                                  height: 14,
                                  width: 30,
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Text(
                                    'NEW',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 2,),
                        Container(
                          height: 50,
                          width: double.infinity,
                          alignment: Alignment.centerLeft,
                          decoration: BoxDecoration(
                            //color: Colors.red,
                          ),
                          child: Text(
                            parts.title,
                            maxLines: 3,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          height: 26,
                          alignment: Alignment.centerLeft,
                          decoration: BoxDecoration(
                            //color: Colors.blue,
                          ),
                          child: Row(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: stars,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(width: 2,),
                                  Text(
                                    parts.evaluation ?? '-',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blue
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 30,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            //olor: Colors.red,
                          ),
                          child: Text(
                            parts.price,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: 24,
                                color: Colors.redAccent
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
        ),
        SizedBox(height: 8,),
      ],
    );
  }
}