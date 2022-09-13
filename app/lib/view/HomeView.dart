import 'package:app/logic/Collection/collection_cubit.dart';
import 'package:app/logic/Product/product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sizer/sizer.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 5.sp),
            child: Container(
              height: 100.h,
              width: 100.w,
              color: HexColor("#fffff"),
              child: ListView(children: [
                SerachBox(context),
                SizedBox(
                  height: 6.w,
                ),
                PostContainer(context),
                SizedBox(
                  height: 2.w,
                ),
                Section_title(),
                Collection(),
                section_title2(),
                SizedBox(
                  height: 6.w,
                ),
                BlocBuilder<ProductCubit, ProductState>(
                  builder: (context, state) {
                    if (state is ProductSuccessGet) {
                      return GridView.builder(
                          shrinkWrap: true,
                          itemCount: state.productModel.count,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10.sp,
                            mainAxisSpacing: 20.sp,
                          ),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  Container(
                                    width: 100.w,
                                    decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.black
                                                  .withOpacity(0.15),
                                              blurRadius: 12.sp,
                                              offset: Offset(0, 5.sp))
                                        ],
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(15.sp)),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 2.w, vertical: 2.w),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            state.productModel.results![index]
                                                .name
                                                .toString(),
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: GoogleFonts.roboto(
                                                color: Colors.black,
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: 5.sp, bottom: 5.sp),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                      color: HexColor("5CA19C"),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5.sp)),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.all(2.sp),
                                                    child: Text(
                                                      state.productModel
                                                          .results![index].price
                                                          .toString(),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: GoogleFonts.roboto(
                                                          color: Colors.white,
                                                          fontSize: 12.sp,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                ),
                                                GestureDetector(
                                                    onTap: () {},
                                                    child: SvgPicture.asset(
                                                      "assets/image/Heart.svg",
                                                      width: 20.sp,
                                                    ))
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                      top: -25.sp,
                                      right: 15.sp,
                                      left: 15.sp,
                                      child: Image(
                                          width: 25.w,
                                          image: NetworkImage(state.productModel
                                              .results![index].image
                                              .toString())))
                                ],
                              ),
                            );
                          });
                    }
                    return Container();
                  },
                )
              ]),
            )),
      ),
    );
  }

  Align section_title2() {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 2.w),
        child: Text(
          "Recommendation",
          style: GoogleFonts.roboto(
              fontSize: 20.sp,
              color: Colors.black,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  BlocBuilder<CollectionCubit, CollectionState> Collection() {
    return BlocBuilder<CollectionCubit, CollectionState>(
      builder: (context, state) {
        if (state is CollextionData) {
          return RefreshIndicator(
            onRefresh: () async {
              context.read<CollectionCubit>().Collection();
            },
            child: GridView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.sp,
                  mainAxisSpacing: 5.sp,
                  mainAxisExtent: 85.sp),
              children: List.generate(
                  state.collection.results!.length,
                  (index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 39.w,
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withOpacity(0.15),
                                    blurRadius: 12.sp,
                                    offset: Offset(0, 5.sp))
                              ],
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15.sp)),
                          child: Padding(
                            padding: EdgeInsets.all(8.0.sp),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Image(
                                    fit: BoxFit.cover,
                                    width: 15.w,
                                    image: NetworkImage(
                                      state.collection.results![index].image
                                          .toString(),
                                    )),
                                Text(
                                  state.collection.results![index].name
                                      .toString(),
                                  style: GoogleFonts.roboto(
                                      fontSize: 12.sp,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                        ),
                      )),
            ),
          );
        } else {
          return GridView(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.sp,
                mainAxisSpacing: 5.sp,
                mainAxisExtent: 75.sp),
            children: List.generate(
                4,
                (index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          width: 39.w,
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withOpacity(0.15),
                                    blurRadius: 12.sp,
                                    offset: Offset(0, 5.sp))
                              ],
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15.sp))),
                    )),
          );
        }
      },
    );
  }

  Container Section_title() {
    return Container(
      width: 100.w,
      alignment: Alignment.topLeft,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: TextButton.icon(
            onPressed: () {},
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: 18.sp,
            ),
            label: Text(
              "Categories",
              style: GoogleFonts.roboto(
                  fontSize: 18.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            )),
      ),
    );
  }

  Container PostContainer(BuildContext context) {
    return Container(
      height: 30.w,
      width: 100.w,
      // ignore: sort_child_properties_last
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.w),
            child: Align(
              alignment: Alignment.topLeft,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Hamburger Pizza Fast ",
                        textAlign: TextAlign.left,
                        style: GoogleFonts.roboto(
                            color: Colors.white,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold)),
                    Padding(
                      padding: EdgeInsets.only(right: 23.w),
                      child: Text(
                          "Need some refreshment in this sunny day? Very-berry Crepes is your go-to solution for your cravings.",
                          textAlign: TextAlign.left,
                          style: GoogleFonts.roboto(
                            color: Colors.white,
                            fontSize: 10.sp,
                          )),
                    ),
                  ]),
            ),
          ),
          Positioned(
              right: -15.sp,
              top: -30.sp,
              child: Image.asset(
                'assets/image/banner.png',
                width: 35.w,
              ))
        ],
      ),
      decoration: BoxDecoration(
          color: HexColor("#5CA19C"),
          borderRadius: BorderRadius.circular(15.sp),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.15),
                blurRadius: 12.sp,
                offset: Offset(0, 5.sp))
          ]),
    );
  }

  Container SerachBox(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.sp),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.15),
                blurRadius: 12.sp,
                offset: Offset(0, 5.sp))
          ]),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              cursorColor: Colors.black,
              decoration: InputDecoration(
                  hintText: "Search...",
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 15.sp),
                  prefixIcon: IconButton(
                      onPressed: () {},
                      iconSize: 20.sp,
                      icon: Icon(
                        Icons.search,
                        color: HexColor("#747474"),
                      )),
                  border:
                      const OutlineInputBorder(borderSide: BorderSide.none)),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              height: 15.w,
              width: 20.w,
              child: Image.asset("assets/image/filter.png"),
              decoration: BoxDecoration(
                  color: HexColor("#747474"),
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(15.sp),
                      topRight: Radius.circular(15.sp))),
            ),
          )
        ],
      ),
    );
  }
}
