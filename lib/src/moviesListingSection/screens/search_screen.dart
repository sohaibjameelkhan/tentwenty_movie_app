import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


import '../../../Utils/app_colors.dart';
import '../../../Utils/app_theme.dart';
import '../../../Utils/image_constants.dart';
import '../widgets/search_card_widget.dart';

class SearchScreen extends StatefulWidget {
  static String route = "/SearchScreen";

  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  bool showClearIcon = false;

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox(),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(25),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: InkWell(
                            onTap: () {
                              Navigator.maybePop(context);
                            },
                            child: SvgPicture.asset(ImageConstants.back))),
                    const SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      flex: 11,
                      child: Container(
                        height: 55,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(23),
                          color: AppColors.textFieldColor,
                        ),
                        child: TextFormField(
                          controller: searchController,
                          onChanged: (val) {
                            if (val.isNotEmpty) {
                              setState(() {
                                showClearIcon = true;
                              });
                            } else {
                              setState(() {
                                showClearIcon = false;
                              });
                            }
                          },
                          style: titleSmall(context)!.copyWith(
                              color: AppColors.blackColor,
                              fontSize: 15,
                              fontWeight: FontWeight.w400),
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Search here...",
                              suffixIcon: showClearIcon == true
                                  ? InkWell(
                                      onTap: () {
                                        setState(() {
                                          searchController.clear();
                                          showClearIcon = false;
                                        });
                                      },
                                      child: const Icon(Icons.close))
                                  : const SizedBox(),
                              hintStyle: titleSmall(context)!.copyWith(
                                  color: AppColors.lightBlackColor,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400),
                              contentPadding:
                                  EdgeInsets.only(left: 20, top: 15)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              )
            ],
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Top Results",
              style: titleMedium(context)!.copyWith(
                  color: AppColors.blackColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Divider(
              color: AppColors.lightBlackColor.withOpacity(0.4),
            ),
          ),
          Expanded(
            child: ListView.builder(
                padding: const EdgeInsets.only(top: 5, left: 8, right: 8),
                itemCount: 14,
                shrinkWrap: false,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return const SearchCardWidget();
                }),
          )
        ],
      ),
    );
  }
}
