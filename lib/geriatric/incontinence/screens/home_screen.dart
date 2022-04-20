// ignore_for_file: prefer_const_constructors
import 'package:easy_localization/easy_localization.dart';
import '../../../core/utilities/app_theme.dart';
import '../../../core/widgets/language_button.dart';
import '../../incontinence/screens/urinetrack.dart';
import '../screens/reminders_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import './pelvicexercises.dart';
import '../utilities/constantscolors.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

// Drawer kai metavash sthn demographics page mas.
class _HomeScreenState extends State<HomeScreen>{
  // Initiate ta dedomena poy diavasame apo ta 2 json(heart_rate_reads & responses_calories_read)
  // Auto ginetai edw mesw tis initState gia na mporoume na ta "Exoume" kai meta stis alles klaseis
  // poy kanoume navigate + oti ta xreiazomaste apo to homescreen gia na exoume ta graphs synced me vash ta JSON
  // edw sta Preview kathe staggeredGridview


  @override
  void initState() {
    //print(chartData);
    // print(chartData2[6].steps);

    super.initState();

  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: drawerColor,
      appBar: AppBar(
        actions:  [
          IconButton(
            padding: EdgeInsets.all(0),
            onPressed: () {},
            icon: Icon(Icons.notifications),
            color: AppTheme.black,
            iconSize: 32,
          ),
          LanguageButton()
        ],
      //  iconTheme: const IconThemeData(color: Color(0xFF17262A)),
        iconTheme: const IconThemeData(color: AppTheme.black),

        backgroundColor: AppTheme.background,
        // automaticallyImplyLeading: false,
        centerTitle: true,
        title:  Text(
          'geriatric.incontinence.urinaryTitle',
          style: TextStyle(fontSize: 25, color: AppTheme.black),
        ).tr(),
      /*  shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(15),
          ),
        ),*/
      ),
      /*drawer: Drawer(
        child: Column(
          children: [
            Container(
              height: 130,
              width: double.infinity,
              padding:  EdgeInsets.all(20),
              alignment: Alignment.centerLeft,
              color: Colors.blueGrey[500], //χρωμα του header του drawer
              // decoration:BoxDecoration(color:Colors.blue), διαφορετικος τροπος να περασουμε χρωμα
              child:  Text(
                "Cardiocare",
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                ),
              ),
            ),
            ListTile(
                title:  Text("Home"),
                leading:  Icon(Icons.home),
                onTap: () {
                  Navigator.pushReplacementNamed(context, '/home_screen');
                }),
          ],
        ),
      ),*/
      body: ListView(
        children: [
          SizedBox(height: 10),
          Padding(
            padding:  EdgeInsets.all(10.0),
            child: StaggeredGrid.count(
              crossAxisCount: 4,
              mainAxisSpacing: 4,
              crossAxisSpacing: 4,
              children: [
                StaggeredGridTile.count(

                  crossAxisCellCount: 2,
                  mainAxisCellCount: 2,
                  child: InkWell(
                      child: Card(

                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [
                                  //Color(0xFFd9d9d9),
                                  // Color(0xFFd9d9d9),
                                  // Colors.white,
                                  // Color(0xFFd9d9d9),

                                  AppTheme.green,
                                  AppTheme.green,
                                  AppTheme.green,
                                ],
                                begin: FractionalOffset(0.0, 0.0),
                                end: FractionalOffset(1.0, 0.0),
                                stops: [0.0, 0.5, 1],
                                tileMode: TileMode.clamp,
                              ),
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                     Padding(
                                      padding: EdgeInsets.all(5.0),
                                      child: Text('geriatric.incontinence.urineTrack',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(

                                              letterSpacing: 1.0,
                                              color:AppTheme
                                                  .background, //Color(0xFF2b8a68),
                                              fontSize: 25,
                                              fontWeight: FontWeight.w500)).tr(),
                                    ),
                                    //const SizedBox(height: 7,),/*  */
                                    Padding(
                                      padding: EdgeInsets.all(
                                          MediaQuery.of(context).size.height /
                                              9 *
                                              0.1),
                                      child: Container(
                                        height: 95,
                                        width: MediaQuery.of(context).size.height /
                                              9,
                                        decoration: const BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(
                                                "assets/images_incontinence/track.png"),
                                            fit: BoxFit.fitHeight,
                                            alignment: Alignment.center,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ]),
                            ),
                          )),
                      onTap: () {
                        {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) =>
                                      UrineTrackPage())));
                        }
                      }),
                ),
                StaggeredGridTile.count(
                  crossAxisCellCount: 2,
                  mainAxisCellCount: 2,
                  child: InkWell(
                      child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              boxShadow: const <BoxShadow>[
                                BoxShadow(
                                    color: AppTheme.orange,
                                    offset: Offset(1.1, 4.0),
                                    blurRadius: 8.0),
                              ],
                              gradient: const LinearGradient(
                                colors: <Color>[
                                  AppTheme.red,
                                  AppTheme.orange,
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              /*gradient: const LinearGradient(
                                                colors: [

                                                   Color(0xFFD86D30),
                                                  Color(0xFFf27710),
                                                  Color(0xFFf27710),
                                                  Color(0xFFD86D30),
                                                 /* Color(0xFF2b1d95),
                                                  Color(0xFF5d3d91),
                                                  Color(0xFF5d3d91),
                                                  Color(0xFF2b1d95),*/
                                                  // Color(0xFFd9d9d9),
                                                  // Color(0xFFd9d9d9),
                                                   //Colors.white,
                                                  // Color(0xFFd9d9d9),
                                                 /* Color(0xFF1E1466),
                                                  Color(0xFF2b1d95),
                                                  Color(0xFF251980),
                                                  Color(0xFF1E1466),*/
                                                  //Colors.red,
                                                  //Colors.redAccent
                                                ],
                                                begin: FractionalOffset(0.0, 0.0),
                                                end: FractionalOffset(1.0, 0.0),
                                                stops: [0.0,0.2,0.8,1],
                                                tileMode: TileMode.clamp,
                                            ),*/
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: Padding(
                              padding:  EdgeInsets.all(4.0),
                              child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                     Padding(
                                      padding: EdgeInsets.all(6.0),
                                      child: Text('geriatric.incontinence.reminders',
                                          style: TextStyle(
                                              letterSpacing: 1.0,
                                              color: AppTheme
                                                  .white, //Color(0xFFD86D30),
                                              fontSize: 25,

                                              fontWeight: FontWeight.w500)).tr(),
                                    ),
                                    //const SizedBox(height: 10,),/*  */
                                    Padding(
                                      padding: EdgeInsets.all(
                                          MediaQuery.of(context).size.height /
                                              9 *
                                              0.1),
                                      child: Container(
                                        height: 95,
                                        width: MediaQuery.of(context).size.height /
                                              9,
                                        decoration:  BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(
                                                "assets/images_incontinence/alert6.png"),
                                            fit: BoxFit.contain,
                                            alignment: Alignment.center,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ]),
                            ),
                          )),
                      onTap: () {

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) =>

                                    ReminderPage())));
                        //Navigator.pushReplacementNamed(context, '/details');
                        }),
                ),
              ],
            ),
          ),
          const Divider(
            height: 30,
            thickness: 3,
            indent: 20,
            endIndent: 20,
            color: AppTheme.black,
          ),
          //Text("", style:TextStyle(color:Color(0xFF17262A ),fontSize:30, fontWeight: FontWeight.bold)),
          /* Padding(
                          padding: const EdgeInsets.all(8.0),
                          child:  SizedBox(
                          height: 80.0,
                          child: ElevatedButton(
                                        child: const Text('About Pelvic Floor Exercises',
                                        style:TextStyle(
                                              color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),),
                                        onPressed: () {},
                                        style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                                            primary: const Color(0xFF999999),
                                           // padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                                            ),
                            ),
                            ),
                    
                  ),    */
          SafeArea(
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    /* SizedBox(
                              height: size.height * 0.05,
                            ),*/
                    Text("geriatric.incontinence.pelvicFloorExercises",
                        style: Theme.of(context)
                            .textTheme
                            .headline6!
                            .copyWith(fontWeight: FontWeight.bold,fontSize:25)).tr(),
                     SizedBox(height: 10),
                     Text("geriatric.incontinence.minutes",
                      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                    ).tr(),
                     SizedBox(height: 10),
                    Wrap(
                      spacing: 20,
                      runSpacing: 20,
                      children: <Widget>[
                        SeassionCard(
                            seassionNum: 1,
                            isDone: true,
                            color1: AppTheme.darkGrey,
                            color2: AppTheme.green,
                            txt: "geriatric.incontinence.session",
                            press: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const PelvicExercises(
                                        exercisenumber: "1")),
                              );
                            }
                            //Navigator.pushReplacementNamed(context, '/pelvicexercises');},
                            ),
                        SeassionCard(
                          seassionNum: 2,
                          isDone: true,
                          color1: AppTheme.green,
                          color2:AppTheme.green,
                          txt: "geriatric.incontinence.session",
                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const PelvicExercises(
                                      exercisenumber: "2")),
                            );
                          },
                        ),
                        SeassionCard(
                          seassionNum: 3,
                          isDone: true,
                          color1: AppTheme.green,
                          color2: AppTheme.purple,
                          txt: "geriatric.incontinence.session" ,
                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const PelvicExercises(
                                      exercisenumber: "3")),
                            );
                          },
                        ),
                        SeassionCard(
                          seassionNum: 4,
                          isDone: true,
                          color1:AppTheme.purple,
                          color2: AppTheme.blue,
                          txt: "geriatric.incontinence.session",
                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const PelvicExercises(
                                      exercisenumber: "4")),
                            );
                          },
                        ),
                        SeassionCard(
                          seassionNum: 5,
                          isDone: true,
                          color1: AppTheme.blue,
                          color2: AppTheme.red,
                          txt: "geriatric.incontinence.session",
                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const PelvicExercises(
                                      exercisenumber: "5")),
                            );
                          },
                        ),
                        SeassionCard(
                          seassionNum: 6,
                          isDone: true,
                          color1: AppTheme.red ,
                          color2: AppTheme.orange,
                          txt: "geriatric.incontinence.session",
                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const PelvicExercises(
                                      exercisenumber: "6")),
                            );
                          },
                        ),
                      ],
                    ),
                       SizedBox(height: 10),
                    Text("geriatric.incontinence.instructions",
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(fontWeight: FontWeight.bold,fontSize: 25)).tr(),
                     SizedBox(height: 10),
                    Stack(
                      children: <Widget>[
                        Container(
                          margin:  EdgeInsets.symmetric(vertical: 10),
                          padding:  EdgeInsets.all(10),
                          height: 110,
                          decoration: BoxDecoration(
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                  color: AppTheme.black.withOpacity(0.6),
                                  offset: const Offset(1.1, 4.0),
                                  blurRadius: 8.0),
                            ],
                            gradient: LinearGradient(
                              colors: <Color>[
                                AppTheme.white,
                                Colors.grey.shade300,
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: const BorderRadius.only(
                              bottomRight: Radius.circular(8.0),
                              bottomLeft: Radius.circular(8.0),
                              topLeft: Radius.circular(8.0),
                              topRight: Radius.circular(34.0),
                            ),
                          ),
                          child: Row(
                            children: <Widget>[
                              const SizedBox(width: 40),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    //   Text(
                                    //   "About",
                                    //   style: Theme.of(context).textTheme.subtitle1,
                                    //  ),
                                    /* const Divider(
                                              height: 20,
                                              thickness: 1,
                                              indent: 0,
                                              endIndent: 20,
                                              color: Colors.grey,
                                            ),
                                            */
                                    Text(
                                        "geriatric.incontinence.details",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2!.copyWith(fontSize: 20)).tr()
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          top: 0,
                          left: 0,
                          child: Container(
                            width: 84,
                            height: 84,
                            decoration: BoxDecoration(
                              color: AppTheme.white.withOpacity(0.2),
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 0,
                          left: 5,
                          child: SizedBox(
                            width: 50,
                            height: 50,
                            child: Image.asset('assets/images_incontinence/about2.png'),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),

          //  customElevatedButton("Exercise 1",0xFF999999,0xFF36ad83, '/pelvicexercises'),
          //  customElevatedButton("Exercise 2",0xFF2b8a68,0xFF36ad83, '/pelvicexercises'),
          //  customElevatedButton("Exercise 3",0xFF36ad83,0xFF786696, '/pelvicexercises'),
          //   customElevatedButton("Exercise 4",0xFF786696,0xFFD86D30, '/pelvicexercises'),
          //   customElevatedButton("Exercise 5",0xFFD86D30,0xFFc2185b, '/pelvicexercises'),
          //   customElevatedButton("Exercise 6",0xFFc2185b,0xFFc2185b, '/pelvicexercises'),
          /*ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(60.0)),
                             padding: const EdgeInsets.all(0.0),
                          ),
                          onPressed: () {},
                          
                          child: Ink(
                            decoration: BoxDecoration(
                                gradient: const LinearGradient(colors: [Color(0xFFEDF0F2), Color(0xFF2b8a68)],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                ),
                                borderRadius: BorderRadius.circular(30.0)
                            ),
                            child: Container(
                              constraints: const BoxConstraints(maxWidth: 400.0, minHeight: 50.0),
                              alignment: Alignment.center,
                              child: const Text(
                                "Exercise 1",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white
                                ),
                              ),
                            ),
                          ),
                        ),
                      

                  ElevatedButton(onPressed: (){ Navigator.pushReplacementNamed(context, '/urinetrack');}, child: const Text('Urine Track'),),
                  ElevatedButton(onPressed: (){ Navigator.pushReplacementNamed(context, '/pelvicexercises');}, child: const Text('Pelvic Floor Exercises'),),
                  ElevatedButton(onPressed: (){}, child: const Text('Alerts'),),
                  ElevatedButton(onPressed: (){}, child: const Text('About Pelvic Floor Exercises'),)*/
        ],
      ),
    );
  }

  Widget customElevatedButton(
      String title, int color1, int color2, String path) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(60.0)),
          padding: const EdgeInsets.all(0.0),
        ),
        onPressed: () {
          Navigator.pushReplacementNamed(context, path);
        },
        child: Ink(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(color1), Color(color2)],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              borderRadius: BorderRadius.circular(30.0)),
          child: Container(
            constraints: const BoxConstraints(maxWidth: 400.0, minHeight: 50.0),
            alignment: Alignment.center,
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(color: AppTheme.white),
            ),
          ),
        ),
      ),
    );
  }


}

class SeassionCard extends StatelessWidget {
  final int seassionNum;
  final bool isDone;
  final String txt;
  final Color color1;
  final Color color2;
  final Function() press;
  const SeassionCard({
    Key? key,
    required this.seassionNum,
    required this.txt ,
    required this.color1,
    required this.color2,
    this.isDone = false,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(13),
        child: Container(
          width: constraint.maxWidth / 2 -
              10, // constraint.maxWidth provide us the available with for this widget
          // padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppTheme.white,
            borderRadius: BorderRadius.circular(13),
            boxShadow: const [
              BoxShadow(
                offset: Offset(0, 17),
                blurRadius: 23,
                spreadRadius: -13,
                color: AppTheme.grey,
              ),
            ],
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: press,
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Row(
                  children: <Widget>[
                    Container(
                      height: 62,
                      width: 40,
                      decoration: BoxDecoration(
                        gradient: isDone
                            ? LinearGradient(
                                colors: [color1, color2])
                            : const LinearGradient(
                                colors: [AppTheme.white, AppTheme.white]),
                        color: isDone ? AppTheme.blue : AppTheme.white,
                        shape: BoxShape.circle,
                        //border: Border.all(color: kBlueColor),
                      ),
                      child: Icon(
                        Icons.play_arrow,
                        size:30.0,
                        color: isDone ? AppTheme.white : AppTheme.blue,
                      ),
                    ),
                    const SizedBox(width: 5),
                    Text(txt, style: const TextStyle(fontSize: 20)).tr(),
                    Text(" $seassionNum",
                        style: const TextStyle(fontSize: 20)
                        // style: Theme.of(context).textTheme.subtitle1,
                        )
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
