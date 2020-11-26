import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mykart/models/signup_model.dart';
import 'package:mykart/services/product_provider.dart';
import 'package:mykart/widgets/about.dart';
import 'package:mykart/widgets/all_pdt.dart';
import 'package:mykart/widgets/categoryItem.dart';
import 'package:mykart/widgets/contactus.dart';
import 'package:mykart/widgets/profilescreen.dart';
import 'package:mykart/widgets/sales_person.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;
  HomePage({this.auth, this.firestore});

  @override
  _HomePageState createState() => _HomePageState();
}
ProductProvider productProvider;
class _HomePageState extends State<HomePage> {
  Widget _buildUserAccountsDrawerHeader() {
    List<UserModel> userModel = productProvider.userModelList;
    return Column(
        children: userModel.map((e) {
      return UserAccountsDrawerHeader(
        accountName: Text(
          e.userName,
          style: TextStyle(color: Colors.black),
        ),
        currentAccountPicture: CircleAvatar(
          backgroundColor: Colors.white,
          backgroundImage: e.userImage == null
              ? AssetImage("images/userImage.png")
              : NetworkImage(e.userImage),
        ),
        decoration: BoxDecoration(color: Color(0xfff2f2f2)),
        accountEmail: Text(e.userEmail, style: TextStyle(color: Colors.black)),
      );
    }).toList());
  }
  double height, width;
  bool homeColor = true;

  bool checkoutColor = false;

  bool aboutColor = false;

  bool contactUsColor = false;
  bool profileColor = false;
  MediaQueryData mediaQuery;
  final GlobalKey<ScaffoldState> drawerKey = GlobalKey();

  final List bannerAdSlider = [
    "assets/banner1.jpg",
    "assets/banner2.jpg",
    "assets/banner3.jpg",
    "assets/banner4.jpg",
    "assets/banner5.jpg",
    "assets/banner6.jpg",
    "assets/banner7.jpg",
    "assets/banner8.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    productProvider = Provider.of<ProductProvider>(context);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));

    return Scaffold(
      key: drawerKey,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "MyKart",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        elevation: 0,
        actionsIconTheme: IconThemeData(color: Colors.black),
        iconTheme: IconThemeData(color: Colors.black),
        leading: IconButton(
          onPressed: () {
            drawerKey.currentState.openDrawer();
          },
          icon: Icon(EvaIcons.menu2Outline),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, ('/cart'));
            },
            icon: Icon(EvaIcons.shoppingBagOutline),
          ),
        ],
      ),
      drawerEdgeDragWidth: 0,
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            _buildUserAccountsDrawerHeader(),
            SizedBox(height: 10),
            ListTile(
              title: Text("Home"),
              
              leading: Icon(EvaIcons.homeOutline),
              selected: checkoutColor,
            onTap: () {
              setState(() {
                checkoutColor = true;
                contactUsColor = false;
                homeColor = false;
                profileColor = false;
                aboutColor = false;
              });
              Navigator.pop(context);
            }
            ),
               ListTile(
            selected: contactUsColor,
            onTap: () {
              setState(() {
                contactUsColor = true;
                checkoutColor = false;
                profileColor = false;
                homeColor = false;
                aboutColor = false;
              });
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (ctx) => ContactUs()));
            },
            leading: Icon(Icons.phone),
            title: Text("Contant Us"),
          ),
            
            SizedBox(height: 10),
            ListTile(
              title: Text("Profile"),
              leading: Icon(EvaIcons.personOutline),
              selected: profileColor,
              onTap: () {
              setState(() {
                aboutColor = false;
                contactUsColor = false;
                homeColor = false;
                profileColor = true;
                checkoutColor = false;
              });
                Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (ctx) => ProfileScreen(),
                ),
              );
              },
            ),
            SizedBox(height: 10),
            ListTile(
              title: Text("About"),
              leading: Icon(Icons.info_outline,),
              onTap: () {
                 setState(() {
                aboutColor = true;
                contactUsColor = false;
                homeColor = false;
                profileColor = false;
                checkoutColor = false;
              });
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (ctx) => About()));
              },
            ),
            SizedBox(height: 10),
            ListTile(
              title: Text("SalesPerson"),
              leading: Icon(EvaIcons.person),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => Sales()));
              },
            ),
            ListTile(
            onTap: () {
              FirebaseAuth.instance.signOut();
            },
            leading: Icon(Icons.exit_to_app),
            title: Text("Logout"),
          ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: AspectRatio(
                  aspectRatio: 16 / 5,
                  child: Image.asset(
                    "assets/banner8.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Categories",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              SizedBox(
                height: 70,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  children: <Widget>[
                    CategoryItem(
                      icon: EvaIcons.giftOutline,
                      size: 70,
                      margin: EdgeInsets.only(
                        left: 10,
                      ),
                      padding: EdgeInsets.all(10),
                      backgroundColor: Color(0xFFffe291),
                    ),
                    CategoryItem(
                      icon: EvaIcons.headphonesOutline,
                      size: 70,
                      margin: EdgeInsets.only(
                        left: 10,
                      ),
                      padding: EdgeInsets.all(10),
                      backgroundColor: Color(0xFF91bfff),
                    ),
                    CategoryItem(
                      icon: EvaIcons.hardDriveOutline,
                      size: 70,
                      margin: EdgeInsets.only(
                        left: 10,
                      ),
                      padding: EdgeInsets.all(10),
                      backgroundColor: Color(0xFFff91c1),
                    ),
                    CategoryItem(
                      icon: EvaIcons.printerOutline,
                      size: 70,
                      margin: EdgeInsets.only(
                        left: 10,
                      ),
                      padding: EdgeInsets.all(10),
                      backgroundColor: Color(0xFF5340de),
                    ),
                    CategoryItem(
                      icon: EvaIcons.videoOutline,
                      size: 70,
                      margin: EdgeInsets.only(
                        left: 10,
                      ),
                      padding: EdgeInsets.all(10),
                      backgroundColor: Color(0xFF47e6a9),
                    ),
                    CategoryItem(
                      icon: EvaIcons.umbrellaOutline,
                      size: 70,
                      margin: EdgeInsets.only(
                        left: 10,
                      ),
                      padding: EdgeInsets.all(10),
                      backgroundColor: Color(0xFFff788e),
                    ),
                    CategoryItem(
                      icon: EvaIcons.tvOutline,
                      size: 70,
                      margin: EdgeInsets.only(
                        left: 10,
                      ),
                      padding: EdgeInsets.all(10),
                      backgroundColor: Color(0xFFff9378),
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: 30,
              ),
              // banner ad slider

              CarouselSlider(
                options: CarouselOptions(
                  aspectRatio: 16 / 9,
                  autoPlay: true,
                ),
                items: bannerAdSlider.map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 10.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image(
                            image: AssetImage(i),
                            fit: BoxFit.cover,
                            alignment: Alignment.topCenter,
                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
              ),

              // banner ad slider

              SizedBox(
                height: 20,
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Products",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),

              SizedBox(
                height: 20,
              ),
              AllProducts(),
            ],
          ),
        ),
      ),
    );
  }
}
