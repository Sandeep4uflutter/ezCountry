// ignore_for_file: file_names
import 'package:ezcountry/functions/allCountries.dart';
import 'package:flutter/material.dart';
import '../../constant/colorConstant/colorConstants.dart';
import '../../constant/textConstants/appText.dart';
import '../../models/model.dart';
import '../widgets/countryListView.dart';
import '../widgets/searchAndFilterWidget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with GetAllCountries {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              elevation: 0,
              leadingWidth: 0,
              leading: const SizedBox(
                width: 10,
              ),
              backgroundColor: AppColor.dashboardAppAppBarColor,
              title: const Text(
                AppTextConstant.dashboardAppBarTitle,
                style: TextStyle(
                    fontSize: 18,
                    color: AppColor.dashboardTitleTextColor,
                    fontWeight: FontWeight.w500),
              ),
            ),
            backgroundColor: AppColor.appScaffoldColor,
            body: SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: FutureBuilder<List<Countrys>>(
                  future: future,
                  builder: (context, snapshot) {
                    return Column(
                      children: [
                        SearchFilter(filterVisible: false, snapshot: snapshot),
                        Expanded(
                          child:
                              snapshot.connectionState == ConnectionState.done
                                  ? CountryListView(snapshot: snapshot)
                                  : const Center(
                                      child: CircularProgressIndicator(),
                                    ),
                        )
                      ],
                    );
                  },
                ))));
  }
}
