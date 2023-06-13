class Cache<T> {
  final _cache = <String, T>{};

  void insert(String key, T value) {
    _cache[key] = value;
  }

  T? fetch(String key) {
    return _cache[key];
  }

  void remove(String key) {
    _cache.remove(key);
  }

  bool contains(String key) {
    return _cache.containsKey(key);
  }
}
