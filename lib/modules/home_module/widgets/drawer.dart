import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_services/routes/routes.dart';
// import 'package:supa_app/modules/auth_module/services/auth_service.dart';
// import 'package:supa_app/routes/routes.dart';

// Future<void> logOut() async {
//   final AuthService authService = Modular.get<AuthService>();
//   print("logged out");
//   await authService.logout();
// }

// Future<String?> getUserInfo() async {
//   final AuthService authService = Modular.get<AuthService>();
//   return await authService.getUserName();
// }

Widget drawer = Drawer(
  child: ListView(
    children: [
      // FutureBuilder<String?>(
      //   future: getUserInfo(),
      //   builder: (context, snapshot) {
      //     if (snapshot.connectionState == ConnectionState.waiting) {
      //       return const DrawerHeader(child: Text("Loading..."));
      //     }
      //     if (snapshot.hasError || snapshot.data == null) {
      //       return const DrawerHeader(child: Text("Unknown User"));
      //     }
      //     return DrawerHeader(child: Text(snapshot.data!));
      //   },
      // ),
      ListTile(
        leading: Icon(Icons.settings),
        title: Text("S E T T I N G S"),
        trailing: Icon(Icons.forward),
        onTap: () {
          Modular.to.pushNamed(Routes.home.getRoute(Routes.home.settings));
        },
      ),
      // ListTile(
      //   leading: Icon(Icons.category_outlined),
      //   title: Text("C A T E G O R I E S"),
      //   trailing: Icon(Icons.forward),
      //   onTap: () {},
      // ),
      ListTile(
        leading: Icon(Icons.logout),
        title: Text("L O G O U T"),
        trailing: Icon(Icons.forward),
        onTap: () async {
          // logOut();
          await Modular.to.pushNamed(Routes.login.getRoute(Routes.login.login));
        },
      ),
      ListTile(
        leading: Icon(Icons.favorite),
        title: Text("R A T E   US"),
        trailing: Icon(Icons.forward),
        onTap: () {},
      ),
    ],
  ),
);
