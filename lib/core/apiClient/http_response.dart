// EventStatus
enum EventStatus { success, error, loading }

// Api Response
class HttpResponse<T> {
  EventStatus? eventStatus;
  T? data;
  String? message;

  HttpResponse(this.eventStatus, this.data, this.message);

  HttpResponse.loading(this.message) : eventStatus = EventStatus.loading;
  HttpResponse.completed(this.data) : eventStatus = EventStatus.success;
  HttpResponse.error(this.message) : eventStatus = EventStatus.error;
  
  @override
  String toString() {
    return "EventStatus : $eventStatus \n Message : $message \n Data : $data";
  }
}
