part of 'part.dart';

ApiResponse<CardModels> cardResponse = ApiResponse.initial("Data Kosong");
List<CardData> listCard = [];
List<CardData> listCardFilter = [];
String textResult = "";
List<String> listCategory = [
  "Insight",
  "Pemula",
  "Perencanaan",
  "Keuangan",
];
List<String> selectedCategory = [];
