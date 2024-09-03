import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:school_staff/Controller/auth_controller.dart';
import 'package:school_staff/views/splashScreen.dart';
import 'Services/authService.dart';
import 'firebase_options.dart';
import 'models/userModel.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
      MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthService>(
            create: (_)=>AuthService()
        ),
        ChangeNotifierProvider<AuthController>(
            create: (context)=>AuthController()
        ),
        StreamProvider<UserModel?>(
            create: (context)=>context.read<AuthService>().user,
            initialData: null),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(

          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: Splashscreen(),
      ),
    );
  }
}

