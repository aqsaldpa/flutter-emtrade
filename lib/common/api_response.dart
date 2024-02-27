import 'view_state.dart';

class ApiResponse<T> {
  ViewState? status;
  T? data;
  String? message;
  ApiResponse(this.status, this.data, this.message);

  ApiResponse.initial(this.message) : status = ViewState.initial;
  ApiResponse.loading() : status = ViewState.loading;
  ApiResponse.completed(this.data) : status = ViewState.completed;
  ApiResponse.error(this.message) : status = ViewState.error;
}
