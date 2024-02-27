part of 'part.dart';

class GetHomeProvider with ChangeNotifier {
  final EmtradeRemoteDataSource gameRemoteDataSource;

  GetHomeProvider(this.gameRemoteDataSource);

  setListCardResponse(ApiResponse<CardModels> response) {
    cardResponse = response;
    listCard = response.data?.data ?? [];
    listCardFilter = response.data?.data ?? [];
    notifyListeners();
  }

  Future<void> getListCard() async {
    setListCardResponse(ApiResponse.loading());
    await Future.delayed(const Duration(seconds: 2));
    try {
      final model = await gameRemoteDataSource.getListCard();
      setListCardResponse(ApiResponse.completed(model));
    } catch (e) {
      setListCardResponse(ApiResponse.error(e.toString()));
    }
  }
}
