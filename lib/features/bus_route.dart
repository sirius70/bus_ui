import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../screens/drawer.dart';
import 'Logs.dart';
import 'package:bus_ui/features/attendace.dart';

class Bus_routes extends StatelessWidget {
  const Bus_routes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          drawerEdgeDragWidth: MediaQuery.of(context).size.width,
          drawer: NavigationDrawerWidget(),
          appBar: AppBar(
            title: const Text("Home"),
          ),
          backgroundColor: Colors.white,
          body: Column(
            children: [
              Card(
                child: Column(
                  children: [
                    ListTile(
                      leading: const Icon(Icons.account_circle_outlined,size: 50.0,),
                      title: const Text("Children 1"),
                      subtitle: Text(
                        'Secondary Text',
                        style: TextStyle(color: Colors.black.withOpacity(0.6)),
                      ),
                    ),
                    ButtonBar(
                      alignment: MainAxisAlignment.start,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context){
                              return Tracker();
                            }));
                          },
                          child: const Text('Bus Tracking'),
                        ),
                        TextButton(
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context){
                              return Logs();
                            }));
                          },
                          child: const Text('Logs'),
                        ),
                        TextButton(
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context){
                              return Attendance();
                            }));
                          },
                          child: const Text('Attendance'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
    );
  }
}




class Tracker extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget{
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  GoogleMapController? mapController; //contrller for Google map
  PolylinePoints polylinePoints = PolylinePoints();

  String googleAPiKey = "AIzaSyC-SbnVjcgvgtD9uPx8u0NB655_uqYfO2w";

  Set<Marker> markers = Set(); //markers for google map
  Map<PolylineId, Polyline> polylines = {}; //polylines to show direction

  LatLng startLocation = const LatLng(27.6683619, 85.3101895);
  LatLng endLocation = const LatLng(27.6688312, 85.3077329);


  @override
  void initState() {

    markers.add(Marker( //add start location marker
      markerId: MarkerId(startLocation.toString()),
      position: startLocation, //position of marker
      infoWindow: const InfoWindow( //popup info
        title: 'Starting Point ',
        snippet: 'Start Marker',
      ),
      icon: BitmapDescriptor.defaultMarker, //Icon for Marker
    ));

    markers.add(Marker( //add distination location marker
      markerId: MarkerId(endLocation.toString()),
      position: endLocation, //position of marker
      infoWindow: const InfoWindow( //popup info
        title: 'Destination Point ',
        snippet: 'Destination Marker',
      ),
      icon: BitmapDescriptor.defaultMarker, //Icon for Marker
    ));

    getDirections(); //fetch direction polylines from Google API

    super.initState();
  }

  getDirections() async {
    List<LatLng> polylineCoordinates = [];

    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      googleAPiKey,
      PointLatLng(startLocation.latitude, startLocation.longitude),
      PointLatLng(endLocation.latitude, endLocation.longitude),
      travelMode: TravelMode.driving,
    );

    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    } else {
      print(result.errorMessage);
    }
    addPolyLine(polylineCoordinates);
  }

  addPolyLine(List<LatLng> polylineCoordinates) {
    PolylineId id = const PolylineId("poly");
    Polyline polyline = Polyline(
      polylineId: id,
      color: Colors.deepPurpleAccent,
      points: polylineCoordinates,
      width: 8,
    );
    polylines[id] = polyline;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Buses"),
        backgroundColor: Colors.blue,
      ),
      body: GoogleMap( //Map widget from google_maps_flutter package
        zoomGesturesEnabled: true, //enable Zoom in, out on map
        initialCameraPosition: CameraPosition( //innital position in map
          target: startLocation, //initial position
          zoom: 16.0, //initial zoom level
        ),
        markers: markers, //markers to show on map
        polylines: Set<Polyline>.of(polylines.values), //polylines
        mapType: MapType.normal, //map type
        onMapCreated: (controller) { //method called when map is created
          setState(() {
            mapController = controller;
          });
        },
      ),
    );
  }
}