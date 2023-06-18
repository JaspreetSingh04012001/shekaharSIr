import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../Services/Storage/outletMenu.dart';
import '../../common/app_styles_colors.dart';

class DeleteItem extends StatefulWidget {
  const DeleteItem({Key? key}) : super(key: key);

  @override
  _DeleteItemState createState() => _DeleteItemState();
}

class _DeleteItemState extends State<DeleteItem> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  List _items = [];
  List _filteredItems = [];
  final obj = Stroge();
  menuFromStorage() async {
    var data = obj.box.read("OutletID");
    if (data is List) {
      setState(() {
        // _items = [...data];
        _items = data.toSet().toList();

        _filteredItems.addAll(_items);
      });
    }
    // obj.box.listenKey("OutletID", (value) {
    //   // print(value);
    //   if (value is List) {
    //     setState(() {
    //       _items = [...value];
    //       _filteredItems.addAll(_items);
    //     });
    //   }
    // });
  }

  @override
  void dispose() {
    _filteredItems;
    _items;
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void initState() {
    menuFromStorage();

    super.initState();
  }

  void _filterItems(String query) {
    setState(() {
      _filteredItems = _items.where((item) {
        if (item["SName"].toString().contains(query) ||
            item["item"].toLowerCase().contains(query.toLowerCase())) {
          return true;
        } else {
          return false;
        }
      }).toList();
    });
  }

  // void _addItem() {
  //   final newIndex = _items.length;
  //   //_items.add('Item ${newIndex + 1}');
  //   _filteredItems.add(_items[newIndex]);
  //   _listKey.currentState?.insertItem(newIndex);
  // }

  void _removeItem(int index) {
    _listKey.currentState?.removeItem(index, (context, animation) {
      if (index < _filteredItems.length) {
        return _buildListItem(context, _filteredItems[index], animation);
      } else {
        return Container();
      }
    }
        // _buildListItem(context, _filteredItems[index], animation),
        );
    _filteredItems.removeAt(index);
    _items.removeAt(index);
    Stroge().box.write("OutletID", _items);
  }

  Widget _buildListItem(
      BuildContext context, var item, Animation<double> animation) {
    double width = MediaQuery.of(context).size.width;
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(-1, 0),
        end: Offset.zero,
      ).animate(animation),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 3),
        child: Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: Styles.myradius),
            child: Row(
              children: [
                Container(
                  alignment: Alignment.center,
                  width: width * 0.1,
                  child: Text(
                    "${item["SName"]}.",
                    style: Styles.poppins14,
                  ),
                ),
                Container(
                  //color: Colors.amber,
                  alignment: Alignment.center,
                  width: width * 0.45,
                  child: Text(
                    "${item["item"]}",
                    style: Styles.poppins14,
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  width: width * 0.15,
                  child: Text(
                    "${item["RATE"]}",
                    style: Styles.poppins14,
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  width: width * 0.2,
                  child: Text(
                    "${item["Qtx"]}",
                    style: Styles.poppins14,
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  width: width * 0.1,
                  child: IconButton(
                    icon: Icon(
                      Icons.delete,
                      color: Styles.primaryColor,
                    ),
                    onPressed: () => _removeItem(_filteredItems.indexOf(item)),
                  ),
                ),
              ],
            )),
      ),

      //  ListTile(
      //   title: Text(
      //     "${item["SName"]}. ${item["item"]}",
      //     style: Styles.poppins14,
      //   ),
      //   trailing: IconButton(
      //     icon: const Icon(
      //       Icons.delete,
      //       color: Colors.red,
      //     ),
      //     onPressed: () => _removeItem(_filteredItems.indexOf(item)),
      //   ),
      // ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Remove Item in Menu",
          style: Styles.poppins18w600,
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: _filterItems,
              decoration: InputDecoration(
                //errorBorder: const InputBorder(),

                errorStyle: Styles.poppins16w400.copyWith(color: Colors.red),
                labelText: 'Search',
                labelStyle: Styles.poppins16w400,
                filled: true,
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.black,
                ),
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ),
          const Gap(10),
          Row(
            children: [
              Container(
                alignment: Alignment.center,
                width: width * 0.1,
                child: Text(
                  "Sno.",
                  style:
                      Styles.poppins16w400.copyWith(color: Styles.primaryColor),
                ),
              ),
              Container(
                //color: Colors.amber,
                alignment: Alignment.center,
                width: width * 0.45,
                child: Text(
                  "Item",
                  style:
                      Styles.poppins16w400.copyWith(color: Styles.primaryColor),
                ),
              ),
              Container(
                alignment: Alignment.center,
                width: width * 0.15,
                child: Text(
                  "Rate",
                  style:
                      Styles.poppins16w400.copyWith(color: Styles.primaryColor),
                ),
              ),
              Container(
                alignment: Alignment.center,
                width: width * 0.2,
                child: Text(
                  "Qtx",
                  style:
                      Styles.poppins16w400.copyWith(color: Styles.primaryColor),
                ),
              ),
              Container(
                alignment: Alignment.center,
                width: width * 0.1,
              ),
            ],
          ),
          const Gap(10),
          Expanded(
            child: _filteredItems.isEmpty
                ? Center(
                    child: Text(
                    "No Items Found",
                    style: Styles.poppins14,
                  ))
                : AnimatedList(
                    key: _listKey,
                    initialItemCount: _filteredItems.length,
                    itemBuilder: (context, index, animation) {
                      if (index < _filteredItems.length) {
                        return _buildListItem(
                            context, _filteredItems[index], animation);
                      } else {
                        return Container();
                      }
                    },
                  ),
          ),
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _addItem,
      //   child: const Icon(Icons.add),
      // ),
    );
  }
}
