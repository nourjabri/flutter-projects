
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_mang/pages/drawer/mydrawer.dart';
import 'package:restaurant_mang/pages/config.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
 final GlobalKey <ScaffoldState> _keydrawer =GlobalKey<ScaffoldState>();
var Myarr_Category =[
  {
  "cat_id" : "1", "cat_name": "cat1", "cat_image":"assets/images/category/cate1.PNG",},
  { "cat_id" : "2", "cat_name": "cat1", "cat_image":"assets/images/category/cate2.PNG",},
  {  "cat_id" : "3", "cat_name": "cat1", "cat_image":"assets/images/category/cate3.PNG",},
  {"cat_id" : "4", "cat_name": "cat1", "cat_image":"assets/images/category/cate4.PNG",},
  { "cat_id" : "5", "cat_name": "cat1", "cat_image":"assets/images/category/cate5.PNG",},
  {"cat_id" : "6", "cat_name": "cat1", "cat_image":"assets/images/category/cate6.PNG",},
];
var Myarr_Products =[
  {
  "pro_id" : "1", "pro_name": "pro1", "pro_dec":"description products","pro_image":"assets/images/products/product1.jpg",},
{"pro_id" : "2", "pro_name": "pro2","pro_dec":"description products", "pro_image":"assets/images/products/product2.jpg",},
{ "pro_id" : "1", "pro_name": "pro3","pro_dec":"description products", "pro_image":"assets/images/products/product3.jpg",},
  { "pro_id" : "1", "pro_name": "pro4", "pro_dec":"description products","pro_image":"assets/images/products/product1.jpg",},


];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _keydrawer,
        drawer: MyDrawer(),
        body: Column(

          mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(

         margin: const EdgeInsets.only(top: 30.0),
         // padding: const EdgeInsets.all(20),
          child: const Text("Delivery Orders",style: TextStyle(
            fontSize: 24,
            color: fourColor,
            fontWeight: FontWeight.bold
          ),),
        ),
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              child:const  Text(
                "Current Location",
                style: TextStyle(
                  fontSize: 20,

                ),
              ),
            ),
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.arrow_drop_down),
                color: Colors.redAccent)
          ],
        ),
        Container(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: <Widget>[
              GestureDetector(

                onTap:(){
                  _keydrawer.currentState!.openEndDrawer();

                },

                child:const  Icon(
                Icons.menu, color: thirdColor,
                size: 28,
                )),
              Expanded(

flex: 1,
                child: Container(
                  padding: const EdgeInsets.only(left: 12,right: 12),
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(16)),
                  child:
                     TextFormField(
                      decoration: const InputDecoration(
                          hintText: "Search",
                        border: InputBorder.none,
                        suffix: Icon(Icons.search,color: Colors.black,),

                      ),
                    ),
                ),
              ),
            ],
          ),
        ),
        Container (
          width:MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height/4,
          padding: const EdgeInsets.all(12),
          child: ListView.builder(
            itemCount: Myarr_Category.length,
            scrollDirection: Axis.horizontal,
            itemBuilder:(BuildContext context , int index){

  return  SingleCategory(
      Cat_id: Myarr_Category[index]["Cat_id"],
   Cat_img : Myarr_Category[index]["Cat_img"]!,
      Cat_name: Myarr_Category[index]["Cat_name"]);

            }),
        ),
        Container (
          width:MediaQuery.of(context).size.width,

          height: MediaQuery.of(context).size.height/3,
          padding: const EdgeInsets.all(10),
          child: ListView.builder(
              itemCount: Myarr_Products.length,

              itemBuilder:(BuildContext context , int index){

                return  SingleProduct(
                    pro_id :  Myarr_Products[index]["pro_id"],
                    pro_img:  Myarr_Products[index]["pro_image"]!,
                    pro_dec:  Myarr_Products[index]["pro_dec"],
                    pro_name:  Myarr_Products[index]["pro_name"],);

              }),
        ),
      ],

    ),
bottomNavigationBar: BottomNavigationBar(

        currentIndex:0,
      selectedItemColor:thirdColor,
      selectedFontSize: 16,
      unselectedItemColor: primaryColor,
  showSelectedLabels: true,
  unselectedFontSize: 12,
  type: BottomNavigationBarType.fixed,
  items: const [
    BottomNavigationBarItem(
      icon: Icon(Icons.notifications),
     label:  ("notifications")
    ),
    BottomNavigationBarItem(
        icon: Icon(Icons.restaurant_menu),
        label:  ("offers")
    ),
    BottomNavigationBarItem(
        icon: Icon(Icons.person),
        label:  ("my account")
    ),



  ],
    ),
    );
  }
}
class  SingleProduct extends StatelessWidget {
  final String ? pro_id;
  final String ? pro_name;
  final String ? pro_dec;
  final String ? pro_img;

  SingleProduct(
      { required this.pro_id, required this.pro_name, required this.pro_dec, required this.pro_img });

  @override
  Widget build(BuildContext context){
    return   Container(

      padding: const EdgeInsets.all(5),
      child: Column(
verticalDirection: VerticalDirection.down,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(

            padding: const EdgeInsets.all(15),
            child:  SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height/5,
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(

                    fit: BoxFit.cover,
                    image: AssetImage(pro_img!)
                )
            ),
          ),
           Text(pro_name!, style: TextStyle(
             fontWeight: FontWeight.bold,
             fontSize: 16,

           ),),
            Text(pro_dec!, style: TextStyle(
              color: Colors.grey,

            ),
          ),
        ],
      ),
    );
  }
}
class SingleCategory extends StatelessWidget {

final String ? Cat_id;
final String ? Cat_name;
final String  Cat_img ;
SingleCategory ({
  required this.Cat_id ,
  required this.Cat_name,
  required  this.Cat_img,
});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 10),
      child: Column(
        children: <Widget>[
          Container(

            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(

                    fit: BoxFit.cover,
                    image: AssetImage(Cat_img)
                )
            ),

          ),
          Text(Cat_name!, style: const TextStyle(
            fontSize: 24,

          ),),

        ],
      ),

    );
  }
}

