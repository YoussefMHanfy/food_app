import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_app/screens/details_screen.dart';

import '../constants.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed:(){} ,
          icon:SvgPicture.asset("assets/icons/menu.svg")
          ,),
        title: RichText(
          text: TextSpan(
          style: Theme.of(context)
              .textTheme
              .headline6!
              .copyWith(fontWeight: FontWeight.bold),
          children: const [
            TextSpan(
              text: "Punk",
              style: TextStyle(color: kSecundaryColor),
            ),
            TextSpan(text: "Food", style: TextStyle(color: kPrimaryColor))
          ],
        ),),
        actions: [
          IconButton(
            onPressed:(){} ,
            icon:SvgPicture.asset("assets/icons/notification.svg")
            ,),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 60,
                margin: const EdgeInsets.symmetric(vertical: 5),
                padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(
                    color: kSecundaryColor.withOpacity(0.32),
                  ),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(5),
                    border: InputBorder.none,
                    icon: SvgPicture.asset("assets/icons/search.svg"),
                    hintText: "Search Here",
                    helperStyle: const TextStyle(
                      color: kSecundaryColor,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ItemBuilder(context, 'combo meal', true),
                    ItemBuilder(context, 'chicken', false),
                    ItemBuilder(context, 'chicken', false),
                    ItemBuilder(context, 'chicken', false),
                    ItemBuilder(context, 'chicken', false),
                    ItemBuilder(context, 'chicken', false),
                    ItemBuilder(context, 'chicken', false),

                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ItemCard(context),
                    ItemCard(context),
                    ItemCard(context),
                    ItemCard(context),

                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text('Offer & discounts',
                style: TextStyle(
                  fontWeight: FontWeight.bold,color: kTextColor
                ),
                ),
              ),
              SizedBox(
                height: 15,
              ),

              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                height: 220,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: const DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage("assets/images/beyond-meat-mcdonalds.png"),
                  ),
                ),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                      colors: [
                        const Color(0xFFFF961F).withOpacity(0.7),
                        kPrimaryColor.withOpacity(0.7),
                      ],
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: SvgPicture.asset("assets/icons/mcdonalds.svg"),
                        ),
                        Expanded(
                          child: RichText(
                            text: const TextSpan(
                              style: TextStyle(color: Colors.white),
                              children: [
                                TextSpan(
                                  text: "Get Discount of\n",
                                  style: TextStyle(fontSize: 16),
                                ),
                                TextSpan(
                                  text: "30% \n",
                                  style: TextStyle(
                                      fontSize: 45, fontWeight: FontWeight.bold),
                                ),
                                TextSpan(
                                  text:
                                  "at MacDonald's on your frist order & Instant cashback",
                                  style: TextStyle(fontSize: 15),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),

        ),
      ),
    );
  }
}
Widget ItemBuilder (context,String title , bool isActive){
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
    child: Column(
      children: [
        Text(title,
        style: isActive? TextStyle(
          color: kTextColor,
          fontWeight: FontWeight.bold,
        )
            : const TextStyle(fontSize: 15)),
        if(isActive)
          Container(
            margin: const EdgeInsets.symmetric(vertical: 5),
            height: 3,
            width: 25,
            decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
      ],
    ),
  );
}
Widget ItemCard (context){
  Size size = MediaQuery.of(context).size;
  return Container(
    margin: const EdgeInsets.only(left: 10, right: 15, top: 20, bottom: 20),
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 4),
            blurRadius: 20,
            color: const Color(0xFFB0CCE1).withOpacity(0.32),
          ),
        ]
    ),
    child: InkWell(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (ctx) => const DetailsScreen(),
          ),
        );
      },
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 15),
            padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
            decoration: BoxDecoration(
              color: kPrimaryColor.withOpacity(0.13),
              shape: BoxShape.circle,
            ),
            child: SvgPicture.asset('assets/icons/burger.svg',
              width: size.width * 0.18,
            ),
          ),
          Text('title'),
          const SizedBox(height: 10),
          Text(
            'shopName',
            style: const TextStyle(fontSize: 12),
          )
        ],
      ),
    ),
  );
}

