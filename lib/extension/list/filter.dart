extension Filter<T> on Stream<List<T>> {
  Stream<List<T>> filter(bool Function(T) where) =>
      map((items) => items.where(where).toList());
}


/*

The given code defines an extension method on a Stream<List<T>> in Dart, 
which allows you to filter the items in the stream based on a provided condition.

Extension method -> An extension method in Dart is a way to add new functionality
                      to existing classes without modifying the original class or creating a subclass. 
                      This is particularly useful when you want to add methods to classes that you don't 
                      own or can't modify, such as classes from the Dart SDK or third-party packages.
*/