import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/controller/main_controller.dart';
import 'package:get/get.dart';
import 'package:weather_app/services/api_services.dart';
import 'package:weather_app/utils/images.dart';
import 'package:weather_app/utils/strings.dart';
import '../models/CurrentWeatherModel.dart';
import '../utils/colors.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller= Get.put(MainController());
    var date=DateFormat("yMMMMd").format(DateTime.now());
    return Scaffold(
      appBar: AppBar(

        title: Text(date,style: TextStyle(color: Colors.grey.shade700,fontSize: 18),),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: [
          IconButton(onPressed: (){
            Get.changeTheme(ThemeData.dark());
          }, icon: Icon(Icons.light_mode,color: Colors.grey.shade600,)),
          IconButton(onPressed: (){
          }, icon: Icon(Icons.more_vert,color: Colors.grey.shade600,)),
        ],
      ),
      body: Obx(()=>
          controller.isLoaded.value==true?
          Container(
          padding: const EdgeInsets.all(12),
          child: FutureBuilder(
            future: controller.currentWeatherData,
            builder: (context,AsyncSnapshot snapshot){
              if(snapshot.hasData){
                CurrentWeatherModel data=snapshot.data;
               return SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    "${data.name}".text.size(32).fontFamily("Poppins_bold").letterSpacing(2).bold.uppercase.make(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset("images/${data.weather![0].icon}.png",width: 80,height: 80,),
                          RichText(text:  TextSpan(
                              children: [
                                TextSpan(
                                    text: "${data.main!.temp}$degree",
                                    style: const TextStyle(
                                        color: Vx.gray900,
                                        fontSize: 50,
                                        fontFamily: "poppins"
                                    )
                                ),
                                TextSpan(
                                    text: "\t${data.weather![0].main}",
                                    style: const TextStyle(
                                        color: Vx.gray900,
                                        letterSpacing: 3,
                                        fontSize: 14,
                                        fontFamily: "poppins_light"
                                    )
                                ),
                              ]
                          ))
                        ],
                      ),
                      10.heightBox,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton.icon(onPressed: null, icon: const Icon(Icons.expand_less_rounded,color: Vx.gray400,),
                              label: "${data.main!.tempMax}$degree".text.make(),
                              style: null),
                          TextButton.icon(onPressed: null, icon: const Icon(Icons.expand_more_rounded,color: Vx.gray400,),
                              label: "${data.main!.tempMin}$degree".text.make(),
                              style: null),
                        ],
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: List.generate(3, (index) {
                            var values=["${data.clouds!.all}%","${data.main!.humidity}%","${data.wind!.speed} km/h"];
                            var iconList=[clouds,humidity,windSpeed];
                            return Column(
                              children: [
                                Image.asset(iconList[index],
                                  width: MediaQuery.of(context).size.width*0.1,
                                  height: MediaQuery.of(context).size.height*0.1,).box.gray200.padding(const EdgeInsets.all(8)).roundedSM.make(),
                                10.heightBox,
                                values[index].text.make()
                              ],
                            );
                          })
                      ),
                      const Divider(),
                      10.heightBox,
                      FutureBuilder(
                          future: controller.hourlyWeatherData,
                          builder: (context, AsyncSnapshot snapshot){
                            if (snapshot.hasData){
                              return SizedBox(
                                height: 150,
                                child: ListView.builder(
                                    physics: const BouncingScrollPhysics() ,
                                    scrollDirection: Axis.horizontal,
                                    shrinkWrap: true,
                                    itemCount: 8,
                                    itemBuilder: (context,index){
                                      var hourlyData=list[index];
                                      var time=DateFormat.jm().format(DateTime.fromMillisecondsSinceEpoch(hourlyData['dt']!.toInt()*1000));
                                      return Container(
                                        padding: const EdgeInsets.all(8),
                                        margin: const EdgeInsets.only(right: 4),
                                        decoration: BoxDecoration(
                                            color: cardColor,
                                            borderRadius: BorderRadius.circular(12)
                                        ),
                                        child: Column(
                                          children: [
                                            time.text.gray200.make(),
                                            Image.asset("images/${hourlyData['weather'][0]['icon']}.png",width: 80,),
                                            "${hourlyData['main']['temp']}$degree".text.white.make(),
                                          ],
                                        ),
                                      );
                                    }),
                              );
                            }
                            return const Center(child:  CircularProgressIndicator(),);
                      }),
                      10.heightBox,
                      const Divider(),
                      10.heightBox,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          "Next 7 Days".text.semiBold.size(16).make(),
                          TextButton(onPressed: (){}, child: "View All".text.make())
                        ],
                      ),
                      FutureBuilder(
                        future: controller.hourlyWeatherData,
                        builder: (context,snapshot){
                          if(snapshot.hasData){
                            return ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: 7,
                                itemBuilder: (context,index){
                                  var day=DateFormat("EEEE").format(DateTime.now().add(Duration(days: index+1)));
                                  var hourlyData=list[index+8];
                                  if(!snapshot.hasData){
                                    return const Center(child: CircularProgressIndicator(),);
                                  }else{
                                    return Card(
                                      shadowColor: Colors.grey,
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 12),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(child: day.text.semiBold.make()),
                                            TextButton.icon(onPressed: null,
                                                icon: Image.asset("images/${hourlyData['weather'][0]['icon']}.png",width: 40,),
                                                label: "${hourlyData['main']['temp']}$degree".text.gray800.make(),
                                                style: null),
                                            Expanded(
                                              child: RichText(text:  TextSpan(
                                                  children: [
                                                    TextSpan(
                                                        text:"${hourlyData['main']['temp_max']}$degree /",
                                                        style: const TextStyle(
                                                            color: Vx.gray800,
                                                            fontFamily: "poppins",
                                                            fontSize: 16
                                                        )

                                                    ),
                                                    TextSpan(
                                                        text:" ${hourlyData['main']['temp_min']}$degree",
                                                        style: const TextStyle(
                                                            color: Vx.gray400,
                                                            fontFamily: "poppins",
                                                            fontSize: 16
                                                        )

                                                    )
                                                  ]
                                              )),
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  }
                                });
                          }else{
                            return const Center(child: CircularProgressIndicator(),);
                          }
                        },
                      )
                    ],
                  ),
                );
              }else{
               return const Center(child: CircularProgressIndicator(),);
              }
            },
          )
        ):const Center(child: CircularProgressIndicator(),)
      ),
    );
  }
}
