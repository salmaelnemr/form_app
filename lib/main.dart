import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_app/Features/WelcomePage/view.dart';

import 'Core/route_utils/route_utils.dart';
import 'Core/utils.dart';

void main() async{
  await ScreenUtil.ensureScreenSize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      navigatorKey: RouteUtils.navigatorKey,
      debugShowCheckedModeBanner: false,
      builder: (context, child){
        ScreenUtil.init(
          context,
          designSize: const Size(414, 896),
        );
        return child!;
      },
      theme: Utils.appTheme,
      home: const WelcomePageView(),
    );
  }
}
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData.light(),
//       darkTheme: ThemeData.dark(),
//       themeMode: ThemeMode.light,
//       home: const HomeScreen(),
//     );
//   }
// }
//
// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Home Screen')),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () => Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => const FormScreen()),
//           ),
//           child: const Text('Go to Form'),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(content: Text('Floating Action Button Clicked!')),
//           );
//         },
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }
//
// class FormScreen extends StatefulWidget {
//   const FormScreen({super.key});
//
//   @override
//   FormScreenState createState() => FormScreenState();
// }
//
// class FormScreenState extends State<FormScreen> {
//   final _formKey = GlobalKey<FormState>();
//   String _firstName = '';
//   String _lastName = '';
//   String _gender = 'Male';
//   bool _agreed = false;
//   bool _isDarkMode = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Form Screen')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             children: [
//               TextFormField(
//                 decoration: const InputDecoration(labelText: 'First Name'),
//                 validator: (value) => value!.isEmpty ? 'Required' : null,
//                 onSaved: (value) => _firstName = value!,
//               ),
//               TextFormField(
//                 decoration: const InputDecoration(labelText: 'Last Name'),
//                 validator: (value) => value!.isEmpty ? 'Required' : null,
//                 onSaved: (value) => _lastName = value!,
//               ),
//               RadioListTile(
//                 title: const Text('Male'),
//                 value: 'Male',
//                 groupValue: _gender,
//                 onChanged: (value) => setState(() => _gender = value.toString()),
//               ),
//               RadioListTile(
//                 title: const Text('Female'),
//                 value: 'Female',
//                 groupValue: _gender,
//                 onChanged: (value) => setState(() => _gender = value.toString()),
//               ),
//               CheckboxListTile(
//                 title: const Text('Agree to terms'),
//                 value: _agreed,
//                 onChanged: (value) => setState(() => _agreed = value!),
//               ),
//               SwitchListTile(
//                 title: const Text('Dark Mode'),
//                 value: _isDarkMode,
//                 onChanged: (value) => setState(() {
//                   _isDarkMode = value;
//                 }),
//               ),
//               ElevatedButton(
//                 onPressed: () {
//                   if (_formKey.currentState!.validate()) {
//                     _formKey.currentState!.save();
//                     showDialog(
//                       context: context,
//                       builder: (context) => AlertDialog(
//                         title: const Text('User Data'),
//                         content: Text('Name: $_firstName $_lastName\nGender: $_gender\nAgreed: $_agreed'),
//                         actions: [
//                           TextButton(
//                             onPressed: () => Navigator.pop(context),
//                             child: const Text('OK'),
//                           ),
//                         ],
//                       ),
//                     );
//                   }
//                 },
//                 child: const Text('Submit'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }