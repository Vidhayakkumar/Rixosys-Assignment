import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rixosys/views/show_details.dart';

import '../view_model/list_data_view_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();

    Provider.of<ListDataViewModel>(context, listen: false).getListData();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ListDataViewModel>(context);

    if (provider.isLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator(color: Colors.blue)),
      );
    }

    if (provider.listData == null ||
        provider.listData!.results == null ||
        provider.listData!.results!.isEmpty) {
      return const Scaffold(body: Center(child: Text("No data found")));
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView.builder(
          itemCount: provider.listData!.results!.length,
          itemBuilder: (context, index) {
            final data = provider.listData!.results![index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ShowDetails(index: index), // object pass
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(12),
                        ),
                        child: Image.network(
                          data.backgroundImage ?? "",
                          width: double.infinity,
                          height: 200,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              Container(
                                color: Colors.grey[300],
                                height: 200,
                                child: const Center(
                                  child: Icon(
                                    Icons.broken_image,
                                    size: 50,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12),
                        child: Text(
                          data.name ?? "Unknown",
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
