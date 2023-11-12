import 'package:trips_plus/home/home.dart';
//login
import 'package:trips_plus/login/login.dart';
import 'package:trips_plus/login/signup.dart';
//mates
import 'package:trips_plus/mates/mates.dart';
//profile
import 'package:trips_plus/profile/profile.dart';
//trips
import 'package:trips_plus/trips/trips.dart';
import 'package:trips_plus/trips/add_trip.dart';
import 'package:trips_plus/trips/a_trip.dart';



var appRoutes = {
  '/': (context) => const HomeScreen(),
  //login
  '/login': (context) => const LoginScreen(),
  '/signup': (context) => const SignUpScreen(),
  //mates
  '/mates': (context) => const MatesScreen(),
  //profile
  '/profile': (context) => const ProfileScreen(),
  //trips
  '/trips': (context) => const TripsScreen(),
  '/add_trip': (context) => const AddTripScreen(),
  '/a_trip': (context) => const TripScreen(),
};
