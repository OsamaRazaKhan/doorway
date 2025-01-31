import 'package:cached_network_image/cached_network_image.dart';
import 'package:doorway/res/components/custom_shopAppbarBack.dart';
import 'package:doorway/utils/SizeConfig.dart';
import 'package:doorway/view_model/myDetails_view_model.dart';
import 'package:doorway/view_model/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopMyDetailsScreen extends StatefulWidget {
  const ShopMyDetailsScreen({super.key});

  @override
  State<ShopMyDetailsScreen> createState() => _ShopMyDetailsScreenState();
}

class _ShopMyDetailsScreenState extends State<ShopMyDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final userViewModel = Provider.of<UserViewModel>(context);
    final myDetailsViewModel = Provider.of<MyDetailsViewModel>(context);
    return Scaffold(
      appBar: shopAppbarBack('', context),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(bottom: SizeConfig.height60),
          child: Column(
            children: [
              SizedBox(height: SizeConfig.height40),
              GestureDetector(
                onTap: myDetailsViewModel.pickImage,
                child: Center(
                  child: myDetailsViewModel.imageLoading == false
                      ? CircleAvatar(
                          radius: SizeConfig.height50,
                          backgroundColor: Colors.white,
                          child: CachedNetworkImage(
                            imageUrl: userViewModel.loginUser!.photo!,
                          ))
                      : const CircularProgressIndicator(),
                ),
              ),
              SizedBox(height: SizeConfig.height10),
              Text(
                userViewModel.loginUser!.name!,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const Text('osamarazakhan • Doorway',
                  style: const TextStyle(color: Colors.grey)),
              SizedBox(height: SizeConfig.height20),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Column(
                  children: [
                    ListTile(
                      title: Text('Name'),
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
                    ListTile(
                      title: Text('User name'),
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
                    ListTile(
                      title: Text('Email'),
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
                    ListTile(
                      title: Text('Phone'),
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


// import 'package:doorway/res/components/global_components/custom_elevatedButton.dart';
// import 'package:doorway/res/components/custom_shopAppbarBack.dart';
// import 'package:doorway/res/components/myDetails_components.dart/custom_textFieldBorder.dart';
// import 'package:doorway/utils/SizeConfig.dart';
// import 'package:doorway/view_model/myDetails_view_model.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class ShopMyDetailsScreen extends StatefulWidget {
//   const ShopMyDetailsScreen({super.key});

//   @override
//   State<ShopMyDetailsScreen> createState() => _ShopMyDetailsScreenState();
// }

// class _ShopMyDetailsScreenState extends State<ShopMyDetailsScreen> {
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     final myDetailsViewModel =
//         Provider.of<MyDetailsViewModel>(context, listen: false);
//     Map<String, dynamic> data = {};
//     myDetailsViewModel.getUserDetails(data);
//   }

//   @override
//   Widget build(BuildContext context) {
//     final myDetailsViewModel = Provider.of<MyDetailsViewModel>(context);
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       appBar: shopAppbarBack("My Details", context),
//       body: Padding(
//         padding: EdgeInsets.only(
//             bottom: SizeConfig.height50,
//             top: SizeConfig.height20,
//             right: SizeConfig.width15,
//             left: SizeConfig.width15),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Center(
//                 child: CircleAvatar(
//                   radius: SizeConfig.height60,
//                   backgroundColor: Colors.white,
//                   child: Image.asset(
//                     'assets/images/myaccount.png',
//                   ),
//                 ),
//               ),
//               Text(
//                 "Name",
//                 style: TextStyle(
//                   color: myDetailsViewModel.nameController.text.isNotEmpty
//                       ? Colors.black
//                       : Colors.black54,
//                   fontSize: SizeConfig.height15,
//                 ),
//               ),
//               TextField(
//                 controller: myDetailsViewModel.nameController,
//                 decoration: textFieldBorder(
//                     myDetailsViewModel.nameController.text, context),
//                 cursorColor: Colors.black,
//                 style: TextStyle(
//                     color: Colors.black, fontSize: SizeConfig.height12),
//                 maxLines: 1,
//               ),
//               Padding(
//                   padding: EdgeInsets.symmetric(vertical: SizeConfig.height20)),
//               Text(
//                 "Email address",
//                 style: TextStyle(
//                   color: myDetailsViewModel.emailController.text.isNotEmpty
//                       ? Colors.black
//                       : Colors.black54,
//                   fontSize: SizeConfig.height15,
//                 ),
//               ),
//               TextField(
//                 controller: myDetailsViewModel.emailController,
//                 decoration: textFieldBorder(
//                     myDetailsViewModel.emailController.text, context),
//                 cursorColor: Colors.black,
//                 style: TextStyle(
//                     color: Colors.black, fontSize: SizeConfig.height12),
//                 maxLines: 1,
//               ),
//               Padding(
//                   padding: EdgeInsets.symmetric(vertical: SizeConfig.height20)),
//               Text(
//                 "Phone",
//                 style: TextStyle(
//                   color: myDetailsViewModel.phoneController.text.isNotEmpty
//                       ? Colors.black
//                       : Colors.black54,
//                   fontSize: SizeConfig.height15,
//                 ),
//               ),
//               TextField(
//                 controller: myDetailsViewModel.phoneController,
//                 decoration: textFieldBorder(
//                     myDetailsViewModel.phoneController.text, context),
//                 enableSuggestions: false,
//                 autocorrect: false,
//                 cursorColor: Colors.black,
//                 style: TextStyle(
//                     color: Colors.black, fontSize: SizeConfig.height12),
//                 maxLines: 1,
//               ),
//               Padding(
//                   padding: EdgeInsets.symmetric(vertical: SizeConfig.height20)),
//             ],
//           ),
//         ),
//       ),
//       bottomSheet: CustomElevatedButton(
//           loading: myDetailsViewModel.Loading,
//           title: "Save Changes",
//           onPress: myDetailsViewModel.Loading == false
//               ? () {
//                   dynamic data =
//                       myDetailsViewModel.getUserDetailsInstance(context);
//                   myDetailsViewModel.updateUserDetails(data);
//                 }
//               : null),
//     );
//   }
// }
