// Copyright (c) 2015, Michał Stalmach. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

library tuples.base;

import 'package:quiver/core.dart';

class TupleFactory {

    call() {
        throw new ArgumentError('tuple cannot be empty');
    }

    noSuchMethod(Invocation invocation) {
        final arguments = invocation.positionalArguments;
        return new Tuple(arguments.first, arguments.skip(1));
    }

}

class Tuple {

    var _head;
    Tuple _tail;
    bool _nested;
    int _length;

    Tuple(this._head, Iterable tail, {bool nested: false}) : _length = 1 {
        this._nested = nested;
        if (tail != null && tail.isNotEmpty) {
            _tail = new Tuple(tail.first, tail.skip(1), nested: true);
            _length += tail.length;
        }
    }

    String toString() => "${_nested ? '' : '<'}${_head}${_tail is Tuple ? ', $_tail' : '>'}";

    bool operator ==(o) => o is Tuple && o.length == length && o._head == _head && o._tail == _tail;

    int get hashCode => hash2(_head.hashCode, _tail.hashCode);

    TupleIterator get iterator => new TupleIterator(this);

    elementAt(int index) {
        if (index < length) {
            int idx = 0;
            Tuple tuple = this;
            while (idx++ < index) {
                tuple = tuple._tail;
            }
            return tuple._head;
        }
        throw new RangeError.index(index, this);
    }

    int get length => _length;
}

class TupleIterator extends Iterator {

    final Tuple tuple;
    var _current;
    int _idx;

    TupleIterator(this.tuple) : _idx = 0 {
        _current = tuple.elementAt(_idx);
    }

    get current => _current;

    bool moveNext() => (_current = ++_idx < tuple.length ? tuple.elementAt(_idx) : null) != null;

}