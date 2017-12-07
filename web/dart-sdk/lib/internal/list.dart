// Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

part of dart._internal;

/**
 * Mixin that throws on the length changing operations of [List].
 *
 * Intended to mix-in on top of [ListMixin] for fixed-length lists.
 */
abstract class FixedLengthListMixin<E> {
  /** This operation is not supported by a fixed length list. */
  set length(int newLength) {
    throw new UnsupportedError(
        "Cannot change the length of a fixed-length list");
  }

  /** This operation is not supported by a fixed length list. */
  void add(E value) {
    throw new UnsupportedError("Cannot add to a fixed-length list");
  }

  /** This operation is not supported by a fixed length list. */
  void insert(int index, E value) {
    throw new UnsupportedError("Cannot add to a fixed-length list");
  }

  /** This operation is not supported by a fixed length list. */
  void insertAll(int at, Iterable<E> iterable) {
    throw new UnsupportedError("Cannot add to a fixed-length list");
  }

  /** This operation is not supported by a fixed length list. */
  void addAll(Iterable<E> iterable) {
    throw new UnsupportedError("Cannot add to a fixed-length list");
  }

  /** This operation is not supported by a fixed length list. */
  bool remove(Object element) {
    throw new UnsupportedError("Cannot remove from a fixed-length list");
  }

  /** This operation is not supported by a fixed length list. */
  void removeWhere(bool test(E element)) {
    throw new UnsupportedError("Cannot remove from a fixed-length list");
  }

  /** This operation is not supported by a fixed length list. */
  void retainWhere(bool test(E element)) {
    throw new UnsupportedError("Cannot remove from a fixed-length list");
  }

  /** This operation is not supported by a fixed length list. */
  void clear() {
    throw new UnsupportedError("Cannot clear a fixed-length list");
  }

  /** This operation is not supported by a fixed length list. */
  E removeAt(int index) {
    throw new UnsupportedError("Cannot remove from a fixed-length list");
  }

  /** This operation is not supported by a fixed length list. */
  E removeLast() {
    throw new UnsupportedError("Cannot remove from a fixed-length list");
  }

  /** This operation is not supported by a fixed length list. */
  void removeRange(int start, int end) {
    throw new UnsupportedError("Cannot remove from a fixed-length list");
  }

  /** This operation is not supported by a fixed length list. */
  void replaceRange(int start, int end, Iterable<E> iterable) {
    throw new UnsupportedError("Cannot remove from a fixed-length list");
  }
}

/**
 * Mixin for an unmodifiable [List] class.
 *
 * This overrides all mutating methods with methods that throw.
 * This mixin is intended to be mixed in on top of [ListMixin] on
 * unmodifiable lists.
 */
abstract class UnmodifiableListMixin<E> implements List<E> {
  /** This operation is not supported by an unmodifiable list. */
  void operator []=(int index, E value) {
    throw new UnsupportedError("Cannot modify an unmodifiable list");
  }

  /** This operation is not supported by an unmodifiable list. */
  set length(int newLength) {
    throw new UnsupportedError(
        "Cannot change the length of an unmodifiable list");
  }

  /** This operation is not supported by an unmodifiable list. */
  void setAll(int at, Iterable<E> iterable) {
    throw new UnsupportedError("Cannot modify an unmodifiable list");
  }

  /** This operation is not supported by an unmodifiable list. */
  void add(E value) {
    throw new UnsupportedError("Cannot add to an unmodifiable list");
  }

  /** This operation is not supported by an unmodifiable list. */
  void insert(int index, E element) {
    throw new UnsupportedError("Cannot add to an unmodifiable list");
  }

  /** This operation is not supported by an unmodifiable list. */
  void insertAll(int at, Iterable<E> iterable) {
    throw new UnsupportedError("Cannot add to an unmodifiable list");
  }

  /** This operation is not supported by an unmodifiable list. */
  void addAll(Iterable<E> iterable) {
    throw new UnsupportedError("Cannot add to an unmodifiable list");
  }

  /** This operation is not supported by an unmodifiable list. */
  bool remove(Object element) {
    throw new UnsupportedError("Cannot remove from an unmodifiable list");
  }

  /** This operation is not supported by an unmodifiable list. */
  void removeWhere(bool test(E element)) {
    throw new UnsupportedError("Cannot remove from an unmodifiable list");
  }

  /** This operation is not supported by an unmodifiable list. */
  void retainWhere(bool test(E element)) {
    throw new UnsupportedError("Cannot remove from an unmodifiable list");
  }

  /** This operation is not supported by an unmodifiable list. */
  void sort([Comparator<E> compare]) {
    throw new UnsupportedError("Cannot modify an unmodifiable list");
  }

  /** This operation is not supported by an unmodifiable list. */
  void shuffle([Random random]) {
    throw new UnsupportedError("Cannot modify an unmodifiable list");
  }

  /** This operation is not supported by an unmodifiable list. */
  void clear() {
    throw new UnsupportedError("Cannot clear an unmodifiable list");
  }

  /** This operation is not supported by an unmodifiable list. */
  E removeAt(int index) {
    throw new UnsupportedError("Cannot remove from an unmodifiable list");
  }

  /** This operation is not supported by an unmodifiable list. */
  E removeLast() {
    throw new UnsupportedError("Cannot remove from an unmodifiable list");
  }

  /** This operation is not supported by an unmodifiable list. */
  void setRange(int start, int end, Iterable<E> iterable, [int skipCount = 0]) {
    throw new UnsupportedError("Cannot modify an unmodifiable list");
  }

  /** This operation is not supported by an unmodifiable list. */
  void removeRange(int start, int end) {
    throw new UnsupportedError("Cannot remove from an unmodifiable list");
  }

  /** This operation is not supported by an unmodifiable list. */
  void replaceRange(int start, int end, Iterable<E> iterable) {
    throw new UnsupportedError("Cannot remove from an unmodifiable list");
  }

  /** This operation is not supported by an unmodifiable list. */
  void fillRange(int start, int end, [E fillValue]) {
    throw new UnsupportedError("Cannot modify an unmodifiable list");
  }
}

/**
 * Abstract implementation of a fixed-length list.
 *
 * All operations are defined in terms of `length`, `operator[]` and
 * `operator[]=`, which need to be implemented.
 */
abstract class FixedLengthListBase<E> = ListBase<E>
    with FixedLengthListMixin<E>;

/**
 * Abstract implementation of an unmodifiable list.
 *
 * All operations are defined in terms of `length` and `operator[]`,
 * which need to be implemented.
 */
abstract class UnmodifiableListBase<E> = ListBase<E>
    with UnmodifiableListMixin<E>;

class _ListIndicesIterable extends ListIterable<int> {
  List _backedList;

  _ListIndicesIterable(this._backedList);

  int get length => _backedList.length;
  int elementAt(int index) {
    RangeError.checkValidIndex(index, this);
    return index;
  }
}

class ListMapView<E> implements Map<int, E> {
  List<E> _values;

  ListMapView(this._values);

  E operator [](Object key) => containsKey(key) ? _values[key] : null;
  int get length => _values.length;

  Iterable<E> get values => new SubListIterable<E>(_values, 0, null);
  Iterable<int> get keys => new _ListIndicesIterable(_values);

  bool get isEmpty => _values.isEmpty;
  bool get isNotEmpty => _values.isNotEmpty;
  bool containsValue(Object value) => _values.contains(value);
  bool containsKey(Object key) => key is int && key >= 0 && key < length;

  void forEach(void f(int key, E value)) {
    int length = _values.length;
    for (int i = 0; i < length; i++) {
      f(i, _values[i]);
      if (length != _values.length) {
        throw new ConcurrentModificationError(_values);
      }
    }
  }

  /** This operation is not supported by an unmodifiable map. */
  void operator []=(int key, E value) {
    throw new UnsupportedError("Cannot modify an unmodifiable map");
  }

  /** This operation is not supported by an unmodifiable map. */
  E putIfAbsent(int key, E ifAbsent()) {
    throw new UnsupportedError("Cannot modify an unmodifiable map");
  }

  /** This operation is not supported by an unmodifiable map. */
  E remove(Object key) {
    throw new UnsupportedError("Cannot modify an unmodifiable map");
  }

  /** This operation is not supported by an unmodifiable map. */
  void clear() {
    throw new UnsupportedError("Cannot modify an unmodifiable map");
  }

  /** This operation is not supported by an unmodifiable map. */
  void addAll(Map<int, E> other) {
    throw new UnsupportedError("Cannot modify an unmodifiable map");
  }

  String toString() => Maps.mapToString(this);
}

class ReversedListIterable<E> extends ListIterable<E> {
  Iterable<E> _source;
  ReversedListIterable(this._source);

  int get length => _source.length;

  E elementAt(int index) => _source.elementAt(_source.length - 1 - index);
}

/**
 * Creates errors thrown by unmodifiable lists when they are attempted modified.
 *
 * This class creates [UnsupportedError]s with specialized messages.
 */
abstract class UnmodifiableListError {
  /** Error thrown when trying to add elements to an unmodifiable list. */
  static UnsupportedError add() =>
      new UnsupportedError("Cannot add to unmodifiable List");

  /** Error thrown when trying to add elements to an unmodifiable list. */
  static UnsupportedError change() =>
      new UnsupportedError("Cannot change the content of an unmodifiable List");

  /** Error thrown when trying to change the length of an unmodifiable list. */
  static UnsupportedError length() =>
      new UnsupportedError("Cannot change length of unmodifiable List");

  /** Error thrown when trying to remove elements from an unmodifiable list. */
  static UnsupportedError remove() =>
      new UnsupportedError("Cannot remove from unmodifiable List");
}

/**
 * Creates errors thrown by non-growable lists when they are attempted modified.
 *
 * This class creates [UnsupportedError]s with specialized messages.
 */
abstract class NonGrowableListError {
  /** Error thrown when trying to add elements to an non-growable list. */
  static UnsupportedError add() =>
      new UnsupportedError("Cannot add to non-growable List");

  /** Error thrown when trying to change the length of an non-growable list. */
  static UnsupportedError length() =>
      new UnsupportedError("Cannot change length of non-growable List");

  /** Error thrown when trying to remove elements from an non-growable list. */
  static UnsupportedError remove() =>
      new UnsupportedError("Cannot remove from non-growable List");
}

/**
 * Converts a growable list to a fixed length list with the same elements.
 *
 * For internal use only.
 * Only works on growable lists as created by `[]` or `new List()`.
 * May throw on any other list.
 *
 * The operation is efficient. It doesn't copy the elements, but converts
 * the existing list directly to a fixed length list.
 * That means that it is a destructive conversion.
 * The original list should not be used afterwards.
 *
 * The returned list may be the same list as the original,
 * or it may be a different list (according to [identical]).
 * The original list may have changed type to be a fixed list,
 * or become empty or been otherwise modified.
 * It will still be a valid object, so references to it will not, e.g., crash
 * the runtime if accessed, but no promises are made wrt. its contents.
 *
 * This unspecified behavior is the reason the function is not exposed to
 * users. We allow the underlying implementation to make the most efficient
 * conversion, at the cost of leaving the original list in an unspecified
 * state.
 */
external List makeListFixedLength(List growableList);

/**
 * Converts a fixed-length list to an unmodifiable list.
 *
 * For internal use only.
 * Only works for core fixed-length lists as created by `new List(length)`,
 * or as returned by [makeListFixedLength].
 *
 * The operation is efficient. It doesn't copy the elements, but converts
 * the existing list directly to a fixed length list.
 * That means that it is a destructive conversion.
 * The original list should not be used afterwards.
 *
 * The unmodifiable list type is similar to the one used by const lists.
 */
external List makeFixedListUnmodifiable(List fixedLengthList);
