import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rixosys/view_model/list_data_view_model.dart';

class ShowDetails extends StatefulWidget {
  final int index;

  const ShowDetails({super.key, required this.index});

  @override
  State<ShowDetails> createState() => _ShowDetailsState();
}

class _ShowDetailsState extends State<ShowDetails> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ListDataViewModel>(context, listen: false);
    final data = provider.listData?.results![widget.index];

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            width: 300,
            height: 300,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Image.network(
                    data!.backgroundImage!,
                    width: 290,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),

                ListTile(
                  title: Text(
                    "Ratings ${data?.rating}",
                    style: TextStyle(color: Colors.white),
                  ),
                  subtitle: Text(
                    "Ratings count ${data?.ratingsCount!}",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
