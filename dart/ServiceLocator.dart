void main() {
  //使えるようにインスタンス化
  GetIt getIt = GetIt.instance;
//シングルトンに保存する。
  getIt.registerLazySingleton(() => PersonA());
  getIt.registerLazySingleton(() => PersonB());
  //普通のインスタンス化
  var s1 = PersonA();
  var s2 = PersonA();
//これはシングルトンクラスじゃないからfalseになる
  print(s1 == s2); // false

  s1 = getIt.get<PersonA>();
  s2 = getIt.get<PersonA>();
  //これはシングルトンクラスになってて同じインスタンスやからtrue
  print(s1 == s2); // true

//これはもちろん別のクラスのシングルトンインスタンスやからfalseになる。
  var s3 = getIt.get<PersonB>();
  print(s2 == s3); // false

  var s4 = getIt.get<PersonB>();
  print(s3 == s4); // true
}

class PersonA {}

class PersonB {}

//FactoryFunc は、ジェネリック型 T を引数に取り、型 T のインスタンスを返す関数型です。
//つまり、任意の型のインスタンスを生成するためのファクトリ関数を表しています。
typedef FactoryFunc<T> = T Function();

/// Very simple and easy to use service locator
/// You register your object creation or an instance of an object with [registerFactory],
/// [registerSingleton] or [registerLazySingleton]
/// And retrieve the desired object using [get] or call your locator das as function as its a
/// callable class
class GetIt {
  final _factories = <Type, _ServiceFactory>{};

//このプライベートコンストラクタは、GetIt クラスのインスタンスを作成します。
//外部からこのクラスのインスタンスを作成できないようにするため、プライベートになっています。
//_internal();、これは _();でも構わない。_internal()という名前は必ずしもこの名前である必要はない。
  GetIt._internal();

  static final GetIt _instance = GetIt._internal();

  static GetIt get instance {
    return _instance;
  }

  static GetIt get I => instance;

  /// retrieves or creates an instance of a registered type [T] depending on the registration function used for this type or based on a name.
  /// [get]は、登録されたクラスのインスタンスを取得するために使用されます。もし登録されたクラスのインスタンスがなければ、例外がスローされます。

  T get<T>() {
    assert(!(T == dynamic),
        'You have to provide either a type or a name. Did you accidentally do  `var sl=GetIt.instance();` instead of var sl=GetIt.instance;');
    final object = _factories[T];
    if (object == null) {
      throw Exception(
          "Object of type ${T.toString()} is not registered inside GetIt");
    }
    return object.getObject() as T;
  }

  ///[call]は、[get]と同様の機能を持ちますが、関数呼び出しのように記述することができます。
  T call<T>() {
    return get<T>();
  }

  /// registers a type so that a new instance will be created on each call of [get] on that type
  /// [T] type to register
  /// [func] factory function for this type
  /// //[registerFactory]は、クラスの新しいインスタンスを作成するためのファクトリ関数を登録します。
  void registerFactory<T>(
    FactoryFunc<T> func,
  ) {
    _register<T>(type: _ServiceFactoryType.alwaysNew, factoryFunc: func);
  }

  /// registers a type as Singleton by passing a factory function that will be called on the first call of [get] on that type
  /// [T] type to register
  /// [func] factory function for this type
  /// [registerLazySingleton]は、最初の呼び出し時にクラスの新しいインスタンスを作成するためのファクトリ関数を登録しますが、
  /// 2回目以降は以前に作成されたインスタンスを返します。
  void registerLazySingleton<T>(
    FactoryFunc<T> func,
  ) {
    _register<T>(type: _ServiceFactoryType.lazy, factoryFunc: func);
  }

  /// Clears all registered types. Handy when writing unit tests
  /// [reset]は、登録されたすべてのクラスをクリアするために使用されます。主にユニットテスト時に使用されます。
  void reset() {
    _factories.clear();
  }

  void _register<T>({
    required _ServiceFactoryType type,
    required FactoryFunc factoryFunc,
    T? instance,
  }) {
    var serviceFactory = _ServiceFactory<T>(type,
        creationFunction: factoryFunc, instance: instance);
    _factories[T] = serviceFactory;
  }
}

enum _ServiceFactoryType { alwaysNew, lazy }

///[_ServiceFactory]というクラスが定義されており、[registerFactory]、[registerLazySingleton]、で使用されます。
///これは、各インスタンスの作成方法を定義するために使用されます。
class _ServiceFactory<T> {
  final _ServiceFactoryType type;
  final FactoryFunc creationFunction;
  T? instance;

  _ServiceFactory(this.type, {required this.creationFunction, this.instance});

  T getObject() {
    try {
      switch (type) {
        case _ServiceFactoryType.alwaysNew:
          return creationFunction() as T;
          break;
        case _ServiceFactoryType.lazy:
          if (instance == null) {
            instance = creationFunction();
          }
          return instance as T;
          break;
      }
    } catch (e, s) {
      print("Error while creating ${T.toString()}");
      print('Stack trace:\n $s');
      rethrow;
    }
  }
}
