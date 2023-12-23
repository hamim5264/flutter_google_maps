import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late GoogleMapController googleMapController;
  Location location = Location();

  Future<void> getCurrentLocation() async {
    final LocationData locationData = await location.getLocation();
    // googleMapController.moveCamera(
    //   CameraUpdate.newCameraPosition(
    //     CameraPosition(target: LatLng(locationData.latitude!, locationData.longitude!),),
    //   ),
    // );
    googleMapController.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(locationData.latitude!, locationData.longitude!),
          zoom: 17,
        ),
      ),
    );
    if(mounted){
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Home",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: GoogleMap(
        initialCameraPosition: const CameraPosition(
          zoom: 19,
          target: LatLng(23.792265005916146, 90.40561775869223),
          bearing: 0,
          tilt: 5,
        ),
        onTap: (LatLng position) {
          print(position);
        },
        onLongPress: (LatLng latLng) {
          print("on long press at $latLng");
        },
        onCameraMove: (cameraPosition) {
          print(cameraPosition);
        },
        onMapCreated: (GoogleMapController controller) {
          googleMapController = controller;
          getCurrentLocation();
        },
        zoomControlsEnabled: false,
        zoomGesturesEnabled: false,
        compassEnabled: false,
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
        markers: {
          Marker(
              markerId: const MarkerId("inititalPosition"),
              position: const LatLng(23.792265005916146, 90.40561775869223),
              icon: BitmapDescriptor.defaultMarkerWithHue(
                  BitmapDescriptor.hueYellow),
              infoWindow: const InfoWindow(
                title: "This is title",
                snippet: "This is snippet",
              ),
              draggable: true,
              onDragEnd: (LatLng position) {
                print(position);
              },
              onDragStart: (LatLng position) {
                print(position);
              },
              onDrag: (LatLng position) {
                print(position);
              },
              onTap: () {
                print("on tapped in marker");
              }),
          Marker(
              markerId: const MarkerId("inititalPosition"),
              position: const LatLng(23.791850617009043, 90.4058363288641),
              icon: BitmapDescriptor.defaultMarkerWithHue(
                  BitmapDescriptor.hueGreen),
              infoWindow: const InfoWindow(
                title: "This is title",
                snippet: "This is snippet",
              ),
              draggable: true,
              onDragEnd: (LatLng position) {
                print(position);
              },
              onDragStart: (LatLng position) {
                print(position);
              },
              onDrag: (LatLng position) {
                print(position);
              },
              onTap: () {
                print("on tapped in marker");
              }),
          Marker(
              markerId: const MarkerId("inititalPosition"),
              position: const LatLng(23.792633525822836, 90.40578536689281),
              icon: BitmapDescriptor.defaultMarkerWithHue(
                  BitmapDescriptor.hueRed),
              infoWindow: const InfoWindow(
                title: "This is title",
                snippet: "This is snippet",
              ),
              draggable: true,
              onDragEnd: (LatLng position) {
                print(position);
              },
              onDragStart: (LatLng position) {
                print(position);
              },
              onDrag: (LatLng position) {
                print(position);
              },
              onTap: () {
                print("on tapped in marker");
              }),
        },
        polylines: {
          Polyline(
            polylineId: const PolylineId("basic-line"),
            color: Colors.red,
            width: 6,
            visible: true,
            endCap: Cap.buttCap,
            jointType: JointType.mitered,
            patterns: [
              PatternItem.gap(10),
              PatternItem.dash(10),
              PatternItem.dot,
              PatternItem.dash(10),
            ],
            points: const [
              LatLng(23.792265005916146, 90.40561775869223),
              LatLng(23.791850617009043, 90.4058363288641),
              LatLng(23.792304348828043, 90.40598049759865),
              LatLng(23.792265005916146, 90.40561775869223),
            ],
          ),
        },
        polygons: {
          Polygon(
            polygonId: const PolygonId("basic-polygon"),
            visible: true,
            fillColor: Colors.pinkAccent,
            strokeColor: Colors.yellowAccent,
            strokeWidth: 6,
            consumeTapEvents: true,
            onTap: () {
              print("tapped on my area");
            },
            points: const [
              LatLng(23.791462842244965, 90.40558755397797),
              LatLng(23.79105573885445, 90.40594696998596),
              LatLng(23.791293803991216, 90.40623228996992),
              LatLng(23.79161224610833, 90.40613975375891),
              LatLng(23.791569603134047, 90.40577128529549),
            ],
          ),
        },
        circles: {
          Circle(
              circleId: const CircleId("basic-circle"),
              center: const LatLng(23.791795089206374, 90.40525194257498),
              radius: 10,
              fillColor: Colors.yellow,
              strokeColor: Colors.red,
              strokeWidth: 6,
              consumeTapEvents: true,
              onTap: () {
                print("tapped on circle");
              }),
        },
      ),
    );
  }
}
