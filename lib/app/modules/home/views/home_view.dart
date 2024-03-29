import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../data/model/response_buku.dart';
import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: controller.obx((state) => ListView.separated(
        itemCount: state!.length,
        itemBuilder: (context, index) {
          DataBuku dataBuku = state[index];
          return ListTile(
            title: Text("${dataBuku.judul}"),
            subtitle: Text(
                "Penulis ${dataBuku.penulis}\n${dataBuku.penerbit} - ${dataBuku.tahunTerbit}"),
          );
        },
        separatorBuilder: (context, index) => Divider(),
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(Routes.ADD_BOOK),
        child: Icon(Icons.add),
        backgroundColor: Color(0xFF0CBD63),
      ),
    );
  }
}
