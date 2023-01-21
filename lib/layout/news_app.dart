import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/modules/search/search.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';

class News_app extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<APP_cubit, states>(
      listener: (context, states) {},
      builder: (context, state) {
        APP_cubit cubit = APP_cubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text('News App'),
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => search()));
                  },
                  icon: Icon(Icons.search)),
              IconButton(
                  onPressed: () {
                    APP_cubit.get(context).changeAppMode();
                  },
                  icon: Icon(Icons.brightness_4_outlined))
            ],
          ),
          body: cubit.screens[cubit.current_index],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.current_index,
            onTap: (index) {
              cubit.changescreen(index);
            },
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.business_center_rounded), label: 'Business'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.sports), label: 'Sports'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.science), label: 'Science'),
            ],
          ),
        );
      },
    );
  }
}
