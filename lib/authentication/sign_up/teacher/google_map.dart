import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:learning_management_system/presentation/resources/assets_manager.dart';
import 'package:learning_management_system/presentation/resources/values_manager.dart';
import 'package:learning_management_system/provider/teacher_provider.dart';
import 'package:provider/provider.dart';
import '../../../presentation/resources/color_manager.dart';
import '../../../presentation/resources/routes_manager.dart';


class GoogleMapPage extends StatefulWidget {
  const GoogleMapPage({Key? key}) : super(key: key);


  @override
  State<GoogleMapPage> createState() => _GoogleMapPageState();
}

class _GoogleMapPageState extends State<GoogleMapPage> {

  late GoogleMapController googleMapController;

  Set<Marker> markers = {};

  static const double _defaultLat = 35.715298;
  static const double _defaultLng = 51.404343;

  static const CameraPosition _defaultLocation = CameraPosition(
      target: LatLng(_defaultLat, _defaultLng),zoom: 15
  );

  MapType _currentMapType = MapType.normal;

  void _changeMapType(){
    setState(() {
      _currentMapType = _currentMapType == MapType.normal ?
          MapType.satellite : MapType.normal;
    });
  }

  Future <Position> _determinePosition() async{
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    
    if(!serviceEnabled){
      return Future.error('Location services are disabled');
    }
    permission = await Geolocator.checkPermission();
    if(permission == LocationPermission.denied){
      permission = await Geolocator.requestPermission();
      
      if(permission == LocationPermission.denied){
        return Future.error('Location Permission  denied');
      }
    }
    if(permission == LocationPermission.deniedForever){
      return Future.error('Location Permission are Permanetly denied');
    }
    Position position = await Geolocator.getCurrentPosition();
    return position;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorManager.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: ColorManager.black,
            size: AppSize.s20,
          ),
          onPressed: () {
            Navigator.of(context).pushReplacementNamed(Routes.teacherInformationSecondRoutes);
          },
        ),
        title: Image.asset(
          ImageAssets.epent,
          width: MediaQuery.of(context).size.width * 0.3,
          height: MediaQuery.of(context).size.height * 0.08,
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: ColorManager.black, size: AppSize.s30),
        actions: [
          TextButton(
              onPressed: () async{
                Position position = await _determinePosition();
                Provider.of<TeacherProvider>(context,listen: false).selectedLocation(context, position);
              },
              child: Text(
                'Save',
                style: TextStyle(
                  fontSize: 16.0,
                  color: ColorManager.primary,
                  fontWeight: FontWeight.w400
                ),
              ),
          )
        ],
      ),
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: _defaultLocation,
            mapType: _currentMapType,
            markers: markers,
            onMapCreated: (GoogleMapController controller){
              googleMapController = controller;
            },
          ),
          Positioned(
            bottom: 100,
            right: -5,
            child: Container(
              padding: const EdgeInsets.only(top: 24.0,right: AppPadding.p12),
              alignment: Alignment.topRight,
              child: Column(
                children: [
                  IconButton(
                      onPressed: _changeMapType,
                      icon: CircleAvatar(
                        radius: 40.0,
                        backgroundColor: ColorManager.white,
                        child: const Icon(
                            Icons.map,
                        ),
                      ),
                  ),
                  IconButton(
                      onPressed: () async{
                        Position position = await _determinePosition();
                        googleMapController.animateCamera(
                          CameraUpdate.newCameraPosition(CameraPosition(
                              target: LatLng(position.latitude,position.longitude),zoom: 15.0),
                          ),
                        );
                          markers.clear();
                          markers.add(
                              Marker(
                                  markerId: const MarkerId('currentLocation'),
                                position: LatLng(position.latitude,position.longitude),
                                
                              ));
                          setState(() {

                          });

                      },
                      icon: CircleAvatar(
                        radius: 40.0,
                          backgroundColor: ColorManager.white,
                          child: SvgPicture.asset(
                            IconAssets.location,
                            color: ColorManager.primary,
                          )
                      ),
                  ),

                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
