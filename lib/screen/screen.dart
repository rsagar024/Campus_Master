import 'package:carousel_slider/carousel_slider.dart';
// import 'package:college_app/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_5/screen/drawer.dart';

class Screen extends StatefulWidget {
  //static const String id = 'Screen';
  const Screen({Key? key}) : super(key: key);

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      body: CustomScrollView(
        slivers: [
          includeAppBar(),
          SliverList(
            delegate: SliverChildListDelegate([
              autoSlider(),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // const Text('ARKA JAIN UNIVERSITY',
                    // style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                    Image.asset('assets/images/jain.png'),
                    const SizedBox(height: 10),
                    const Text('It is fastest growing university of Jharkhand and the 1st Private University of Kolhan Region, is a unit of JAIN Group, Bengaluru. ARKA JAIN University, Jharkhand is established by the JHARKHAND State Legislature under “The ARKA JAIN University Act”, recognized by UGC , is an example of excellence.',
                        maxLines: 7,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Colors.blueGrey, fontSize: 15, fontWeight: FontWeight.w500)),
                    const SizedBox(height: 15),
                    const Text('INSTITUTES / SCHOOLS',
                        style: TextStyle(color: Colors.black, fontSize: 26, fontWeight: FontWeight.w600)),
                    const SizedBox(height: 20),
                    InkWell(
                      onTap: (){
                        //Navigator.of(context).pushNamed(HomeScreen.id);
                      },
                      child: Image.asset('assets/images/commerce.jpg'),
                    ),
                    const Text('School of Commerce & Mgmt',
                        style: TextStyle(color: Colors.red, fontSize: 22, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 20),
                    InkWell(
                      onTap: (){},
                      child: Image.asset('assets/images/law.jpg'),
                    ),
                    const Text('School of Law',
                        style: TextStyle(color: Colors.red, fontSize: 22, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 20),
                    InkWell(
                      onTap: (){},
                      child: Image.asset('assets/images/engineering.jpg'),
                    ),
                    const Text('School of Engineering & IT',
                        style: TextStyle(color: Colors.red, fontSize: 22, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 20),
                    InkWell(
                      onTap: (){},
                      child: Image.asset('assets/images/humanities.jpg'),
                    ),
                    const Text('School of Humanities',
                        style: TextStyle(color: Colors.red, fontSize: 22, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 20),
                    InkWell(
                      onTap: (){},
                      child: Image.asset('assets/images/health.jpg'),
                    ),
                    const Text('School of Health & Allied',
                        style: TextStyle(color: Colors.red, fontSize: 22, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 20),
                    InkWell(
                      onTap: (){},
                      child: Image.asset('assets/images/research.jpg'),
                    ),
                    const Text('School of Research',
                        style: TextStyle(color: Colors.red, fontSize: 22, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text('CAMPUS ADDRESS',
                        style: TextStyle(color: Colors.black, fontSize: 26, fontWeight: FontWeight.w600)),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.only(left: 25, right: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('ARKA JAIN UNIVERSITY',
                        style: TextStyle(color: Colors.black45, fontSize: 22, fontWeight: FontWeight.bold)),
                    const Text('Mohanpur,Gamharia\nDist - Seraikela Karsawan,\nState - Jharkhand, Pin - 832108',
                        style: TextStyle(color: Colors.blueGrey, fontSize: 20, fontWeight: FontWeight.w400)),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text('CITY OFFICE',
                        style: TextStyle(color: Colors.black, fontSize: 26, fontWeight: FontWeight.w600)),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.only(left: 25, right: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('ARKA JAIN UNIVERSITY',
                        style: TextStyle(color: Colors.black45, fontSize: 22, fontWeight: FontWeight.bold)),
                    const Text('D-28, Danish Arcade,\nOpp Asian Inn Hotel,\nDhatkidih,\nJamshedpur - 831001',
                        style: TextStyle(color: Colors.blueGrey, fontSize: 20, fontWeight: FontWeight.w400)),
                  ],
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }

  Widget includeAppBar() => SliverAppBar(
    backgroundColor: Colors.lightBlueAccent,
    elevation: 0,
    title: Text('Dashboard',
        style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
    centerTitle: true,
  );

  Widget autoSlider() => CarouselSlider(
    options: CarouselOptions(
      aspectRatio: 16/9,
      enlargeCenterPage: true,
      autoPlay: true,
    ),
    items: [
      Image.asset('assets/images/a1.png'),
      Image.asset('assets/images/a4.png'),
      Image.asset('assets/images/a6.png'),
      Image.asset('assets/images/a9.png'),
      Image.asset('assets/images/a7.png'),
      Image.asset('assets/images/a8.png'),
    ],
  );

}
