import 'dart:collection';
import 'dart:convert';
import 'package:Ecomapp/Models/RecycleBin.dart';
import 'package:Ecomapp/Screens/drawers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GMap extends StatefulWidget {
  @override
  _GMap createState() => new _GMap();
}

class _GMap extends State<GMap> {
  List<RecycleBin> recycleBinList;
  Set<Marker> _markers = HashSet<Marker>();
  GoogleMapController _mapController;

  void _onMapCreated(GoogleMapController controller) async {
    _mapController = controller;
  }

  Future<List<RecycleBin>> getRecycleBins() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference bins = firestore.collection('recyclebins');
    List<RecycleBin> recycleBinList = [];

    bins.get().then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        GeoPoint geoPoint = doc["location"];

        final bin = RecycleBin(
          address: doc["adress"],
          borough: doc["borough"],
          siteType: doc["site_type"],
          latitude: geoPoint.latitude.toString(),
          longitude: geoPoint.longitude.toString(),
        );
        recycleBinList.add(bin);
      });
    });

    return recycleBinList;
  }

  Future loadMarkers() async {
    recycleBinList = await getRecycleBins();

    await new Future.delayed(const Duration(seconds: 3));
    setState(() {
      for (int i = 0; i < recycleBinList.length; i++) {
        if (recycleBinList[i].longitude != null) {
          _markers.add(Marker(
              markerId: MarkerId(i.toString()),
              position: LatLng(double.parse(recycleBinList[i].latitude),
                  double.parse(recycleBinList[i].longitude)),
              infoWindow: InfoWindow(
                  title: recycleBinList[i].address,
                  snippet: recycleBinList[i].siteType)));
        }
      }
    });
  }

  @override
  void initState() {
    super.initState();
    loadMarkers();
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey =
        new GlobalKey<ScaffoldState>();
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      key: _scaffoldKey,
      drawer: ProfileDrawer(),
      endDrawer: MenuDrawer(),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.0),
        child: AppBar(
          backgroundColor: Colors.blueGrey[900],
          centerTitle: true,
          title: Text("EcoMapp", style: TextStyle(fontSize: 24)),
          leading: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Transform.scale(
              scale: 1.5,
              child: IconButton(
                icon: const Icon(Icons.person_rounded),
                tooltip: 'Profile',
                onPressed: () => _scaffoldKey.currentState.openDrawer(),
              ),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Transform.scale(
                scale: 1.5,
                child: IconButton(
                  icon: const Icon(Icons.list_rounded),
                  tooltip: 'Menu',
                  onPressed: () => _scaffoldKey.currentState.openEndDrawer(),
                ),
              ),
            ),
          ],
          elevation: 0,
        ),
      ),
      body: Stack(children: <Widget>[
        GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: LatLng(36.548817, 32.002015),
            zoom: 16.0,
          ),
          markers: _markers,
        ),
      ]),
    );
  }
}
