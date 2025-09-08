import 'package:open_fashion/gen/assets.gen.dart';

class CoverModel {
  final AssetGenImage image;
  final String name;

  CoverModel({required this.image, required this.name});



 static List<CoverModel> covers = [
    CoverModel(image: Assets.cover.cover1, name: "New collection"),
    CoverModel(image: Assets.cover.cover2, name: "Black collection"),
    CoverModel(image: Assets.cover.cover3, name: "HAE BY HAEKIM"),
    ];
}
