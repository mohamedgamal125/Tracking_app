import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:location/location.dart';

import '../../feature/order_details/data/models/driver_location_model.dart';

class FireStoreService {
  static final _firestore = FirebaseFirestore.instance;

  static Future<void> updateDriverLocation(
      {required String driverId, required LocationData location}) async {
    try {
      await _firestore.collection('drivers').doc(driverId).set({
        'location': {'lat': location.latitude, 'lng': location.longitude},
        'creaditAt': DateTime.now(),
      });
    } on FirebaseException catch (e) {
      print('Ann error due to firebase occured $e');
    } catch (err) {
      print('Ann error occured $err');
    }
  }


  static Stream<Driver> driverCollectionStream(String driverId) {
    return _firestore.collection('drivers').doc(driverId).snapshots().map(
            (snapshot) => Driver.fromJson(snapshot.data() as Map<String, dynamic>));
  }

  static Future<List<Driver>> getDriversOnce() async {
    print('get');
    final snapshot =
        await FirebaseFirestore.instance.collection('drivers').get();

    return snapshot.docs.map((doc) {
      print('geyt1');
      print(doc.data());
      return Driver.fromJson(doc.data());
    }).toList();
  }
}
