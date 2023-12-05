import 'package:flutter/material.dart';
import 'package:house/src/data/models/hotel_models.dart';
import 'package:house/src/data/provider/providers.dart';

import 'widgets/list_item_widgets.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  HotelModels? hotelModels;
  TextEditingController controller = TextEditingController();
  List<Entry> items = [];
  String query = '';

  @override
  void initState() {
    // TODO: implement initState
    fetchData();
    super.initState();
  }

  Future<HotelModels> fetchData() async {
    return hotelModels = await DataProviders().fetchData();
  }

  void searchItem(String searchText) {
    setState(() {
      query = searchText;
      items = hotelModels!.entries!.where((element) {
        return (element.hotelName != null &&
                element.hotelName!
                    .toLowerCase()
                    .contains(query.toLowerCase())) ||
            (element.city != null &&
                element.city!.toLowerCase().contains(query.toLowerCase())) ||
            (element.price != null &&
                element.price!.toString().contains(query));
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Book a Room'),
        ),
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              toolbarHeight: 130,
              flexibleSpace: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Column(
                  children: [
                    TextFormField(
                      controller: controller,
                      onChanged: (value) {
                        searchItem(value);
                      },
                      decoration: const InputDecoration(
                          icon: Icon(Icons.place),
                          suffixIcon: Icon(Icons.gps_fixed)),
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            searchItem(controller.text);
                          });
                        },
                        child: const Text(
                          'Search',
                          style: TextStyle(color: Colors.white),
                        ))
                  ],
                ),
              ),
            ),
            SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                sliver: FutureBuilder(
                    future: fetchData(),
                    initialData: hotelModels,
                    builder: (context, snapshot) {
                      final data = snapshot.data?.entries ?? [];

                      if (data.isNotEmpty) {
                        return SliverList(
                            delegate: SliverChildBuilderDelegate(
                                (context, index) =>
                                    items.isNotEmpty || query.isNotEmpty
                                        ? items.isEmpty
                                            ? const Center(
                                                child: Text('Not found'),
                                              )
                                            : ListItemWidgets(
                                                data: items[index],
                                              )
                                        : ListItemWidgets(data: data[index]),
                                childCount: items.length));
                      } else {
                        return SliverList(
                            delegate: SliverChildBuilderDelegate(
                                (context, index) => const Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                childCount: 0));
                      }
                    }))
          ],
        ));
  }
}
