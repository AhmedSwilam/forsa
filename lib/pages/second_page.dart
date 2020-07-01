import 'package:flutter/material.dart';
import 'package:forsa/Models/sub_category.dart';
import 'package:forsa/localization/localization_constant.dart';
import 'package:dio/dio.dart';


class SecondPage extends StatefulWidget {
  final int id;
  SecondPage(this.id);


  @override
  _SecondPageState createState() => _SecondPageState(id);
}

class _SecondPageState extends State<SecondPage> {
   int id;
  _SecondPageState(int id){
    this.id = id;
  }
   List<SubCategoriesModel> subCategoryModel;
   Future<List<SubCategoriesModel>> getSubCategories() async {
     Response response;
     Dio dio = new Dio();
     response = await dio.get("http://weddingapp-001-site1.atempurl.com/api/SubCategories/GetByCategoryId/"+id.toString());
     print(response.data.toString());
     if (response.statusCode == 200) {
       List<SubCategoriesModel> mainCategory =
       subCategoriesModelFromJson(response.data);
       return mainCategory;
//        MainCategoriesModel.fromJson(json.decode(response.body));
     } else {
       throw Exception('*please check your internet*');
     }

   }
   @override
  void initState() {
    super.initState();
    getSubCategories().then((allSubCategory){
      setState(() {
        subCategoryModel = allSubCategory;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle:true,
        title: Text(getTranslated(context, 'stores')),
        backgroundColor: Colors.lightGreenAccent,
      ),
      body: Center(
          child: FutureBuilder(
            future: getSubCategories(),
            builder: (BuildContext context,
                AsyncSnapshot<List<SubCategoriesModel>> snapshot) {
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemCount:
                null == subCategoryModel ? 0 : subCategoryModel.length,
                itemBuilder: (BuildContext context, int index) {
                  SubCategoriesModel categoriesModel =
                  subCategoryModel[index];
                  return Card(
                    color: Colors.lightGreenAccent,
//                    child: GestureDetector(
//                      onTap: (){
////                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SecondPage(categoriesModel.id)));
//                      },
                      child: Column(
                        children: <Widget>[
//                          Image(
//                            image: NetworkImage(
//                                "http://weddingapp-001-site1.atempurl.com" +
//                                    categoriesModel.photo),
//                            fit: BoxFit.fill,
//                          ),

                          Text("${categoriesModel.nameEn}"),
                          Text("${categoriesModel.nameAr}"),
                        ],
                      ),
//                    ),
                  );
                },
              );
              //          GestureDetector(onTap: () {},
//              child: Icon(Icons.search)),
            },
          ),
      ),
    );
  }
}


