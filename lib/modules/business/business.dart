import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/components/components.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';
class business_screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<APP_cubit,states>(
          listener: (context,state){},
          builder: (context,state){
             var list = APP_cubit.get(context).business;
             return state is ! getloadingbusiness ? ListView.separated(
                  physics: BouncingScrollPhysics(),
                 itemBuilder: (context,index)=>builditem(list[index],context),
                 separatorBuilder: (context,index)=>separator(),
                 itemCount: list.length): Center(child: CircularProgressIndicator());
          },
    );

  }
}
