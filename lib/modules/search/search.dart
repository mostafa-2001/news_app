import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/components/components.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';

class search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<APP_cubit, states>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = APP_cubit.get(context).search;
        return Scaffold(
          appBar: AppBar(),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                TextFormField(
                  keyboardType: TextInputType.text,
                  onChanged: (value) {
                    APP_cubit.get(context).Getsearch(value);
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'search',
                      prefixIcon: Icon(Icons.search)),
                ),
                SizedBox(
                  height: 25,
                ),

                    Expanded(
                        child: ListView.separated(
                            physics: BouncingScrollPhysics(),
                            itemBuilder: (context, index) =>
                                builditem(list[index], context),
                            separatorBuilder: (context, index) => separator(),
                            itemCount: list.length),
                      )

              ],
            ),
          ),
        );
      },
    );
  }
}
