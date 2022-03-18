enum Status { success, fail, loading }

class Resource<T> {
  T? data;
  Status status = Status.loading;
  Exception? error;

  Resource.loading()
      : data = null,
        error = null,
        status = Status.loading;

  Resource.fail({this.error})
      : data = null,
        status = Status.fail;

  Resource.success({this.data}) : status = Status.success;
}
