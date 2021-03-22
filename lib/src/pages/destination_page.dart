import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:travel/src/models/activity_model.dart';
import 'package:travel/src/models/destination_model.dart';

class DestinationPage extends StatefulWidget {
  final Destination destination;

  const DestinationPage({this.destination});

  @override
  _DestinationPageState createState() => _DestinationPageState();
}

class _DestinationPageState extends State<DestinationPage> {
  Text _buildRatingStars(int rating) {
    String stars = '';
    for (var i = 0; i < rating; i++) {
      stars += '♣';
    }
    stars.trim();
    return Text(stars);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: <Widget>[
      Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0.0, 2.0),
                      blurRadius: 6.0)
                ]),
            child: Hero(
              tag: widget.destination.imageUrl,
              child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30)),
                  child: Image(
                    image: AssetImage(widget.destination.imageUrl),
                    fit: BoxFit.cover,
                  )),
            ),
          ),
          SafeArea(
            child: Row(
              children: <Widget>[
                IconButton(
                    icon: Icon(Icons.arrow_back),
                    iconSize: 30.0,
                    color: Colors.black,
                    onPressed: () => Navigator.pop(context)),
                Spacer(),
                IconButton(
                    icon: Icon(Icons.search),
                    iconSize: 30.0,
                    color: Colors.black,
                    onPressed: () => Navigator.pop(context)),
                IconButton(
                    icon: Icon(FontAwesomeIcons.sortAmountDown),
                    iconSize: 25.0,
                    color: Colors.black,
                    onPressed: () => Navigator.pop(context)),
              ],
            ),
          ),
          Positioned(
            left: 20,
            bottom: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(widget.destination.city,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 35.0,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.2)),
                Row(
                  children: <Widget>[
                    Icon(
                      FontAwesomeIcons.locationArrow,
                      size: 15.0,
                      color: Colors.white70,
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text(
                      widget.destination.country,
                      style: TextStyle(color: Colors.white70, fontSize: 20.0),
                    )
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            right: 20,
            bottom: 20,
            child: Icon(Icons.location_on, color: Colors.white70, size: 25.0),
          )
        ],
      ),
      Expanded(
          child: ListView.builder(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.only(top: 10, bottom: 15),
        itemCount: widget.destination.activities.length,
        itemBuilder: (BuildContext context, int index) {
          Activity activity = widget.destination.activities[index];
          return FadeInLeft(
            duration: Duration(milliseconds: 250),
            child: Stack(children: [
              Container(
                margin: EdgeInsets.fromLTRB(40.0, 5.0, 20.0, 5.0),
                height: 170.0,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(100, 20, 20, 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            width: 120,
                            child: Text(activity.name,
                                style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w600)),
                          ),
                          Column(
                            children: [
                              Text('\$ ${activity.price}',
                                  style: TextStyle(
                                      fontSize: 22.0,
                                      fontWeight: FontWeight.w600),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2),
                              Text('Per pax',
                                  style: TextStyle(color: Colors.grey)),
                            ],
                          ),
                        ],
                      ),
                      Text(activity.type, style: TextStyle(color: Colors.grey)),
                      _buildRatingStars(activity.rating),
                      SizedBox(height: 10.0),
                      Row(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(4.0),
                            width: 70,
                            decoration: BoxDecoration(
                                color: Theme.of(context).accentColor,
                                borderRadius: BorderRadius.circular(10.0)),
                            alignment: Alignment.center,
                            child: Text(activity.startTimes[0]),
                          ),
                          SizedBox(width: 5),
                          Container(
                            padding: EdgeInsets.all(4.0),
                            width: 70,
                            decoration: BoxDecoration(
                                color: Theme.of(context).accentColor,
                                borderRadius: BorderRadius.circular(10.0)),
                            alignment: Alignment.center,
                            child: Text(activity.startTimes[1]),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 20,
                top: 20,
                bottom: 15,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Image(
                    width: 110,
                    image: AssetImage(activity.imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              )
            ]),
          );
        },
      ))
    ]));
  }
}
