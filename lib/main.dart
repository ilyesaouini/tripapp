import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() => runApp(
  MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(fontFamily: 'Nunito'),
    home: HomePage(),
  )
);

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PageController _pageController;
  int totalPage = 4;
  void _onScroll() {

  }
   @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: 0,
    )..addListener(_onScroll);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: <Widget>[
           makePage(
            page:1,
            image: 'assets/images/one.jpg',
            title: 'Yosemite National Park',
            description: 'Yosemite National Park is in California’s Sierra Nevada mountains. It’s famed for its giant, ancient sequoia trees, and for Tunnel View, the iconic vista of towering Bridalveil Fall and the granite cliffs of El Capitan and Half Dome.'
          ),
          makePage(
            page:2,
            image: 'assets/images/two.jpg',
            title: 'Golden Gate Bridge',
            description: 'The Golden Gate Bridge is a suspension bridge spanning the Golden Gate, the one-mile-wide strait connecting San Francisco Bay and the Pacific Ocean.'
          ),
          makePage(
            page:3,
            image: 'assets/images/three.jpg',
            title: 'Sedona',
            description: "Sedona is regularly described as one of America's most beautiful places. Nowhere else will you find a landscape as dramatically colorful."
          ),
          makePage(
            page:4,
            image: 'assets/images/four.jpg',
            title: 'Savannah',
            description: "Savannah, with its Spanish moss, Southern accents and creepy graveyards, is a lot like Charleston, South Carolina. But this city about 100 miles to the south has an eccentric streak."
          ),
        ],
        
      ),
    );
  }

  Widget makePage({page,image,title,description}) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(image),
        fit:BoxFit.cover
        )
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomRight,
            stops: [0.3,0.9],
            colors: [
              Colors.black.withOpacity(.9),
              Colors.black.withOpacity(.2)
            ]
             )
        ),
        child: Padding(
          padding: EdgeInsets.all(28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 40,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                textBaseline: TextBaseline.alphabetic,
                children: <Widget>[
                  Text(page.toString(),style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),),
                  Text('/'+totalPage.toString(),style: TextStyle(color: Colors.white,fontSize: 15),),
                ],
              ),
              Expanded (
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    
                    Text(title,style: TextStyle(color: Colors.white,fontSize: 40,fontWeight: FontWeight.bold),),
                    SizedBox(height: 40,),
                    Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(right: 3),
                          child: Icon(Icons.star,color:Colors.yellow,size:15),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 3),
                          child: Icon(Icons.star,color:Colors.yellow,size:15),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 3),
                          child: Icon(Icons.star,color:Colors.yellow,size:15),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 3),
                          child: Icon(Icons.star,color:Colors.yellow,size:15),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 5),
                          child: Icon(Icons.star,color:Colors.grey,size:15),
                        ),
                        Text('4.0',style: TextStyle(color:Colors.white70),),
                        Text('2300',style: TextStyle(color:Colors.white38,fontSize: 12),),
                      ],
                    ),
                    SizedBox(height:20 ,),
                    Padding(
                      padding: const EdgeInsets.only(right: 50),
                      child: Text(description,style: TextStyle(color: Colors.white.withOpacity(.7),height: 1.9,fontSize: 15),),
                    ),
                    SizedBox(height:20 ,),
                    Text('READ MORE',style: TextStyle(color: Colors.white),)

                  ],
                  ),
                  )
            ],
          ), ),
          
      ),
    );
  }
}