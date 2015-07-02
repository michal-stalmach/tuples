# tuples

A library that provides tuples for Dart.

## Usage

A simple usage example:

    import 'package:tuples/tuples.dart';

    void main() {
      Tuple tuple = newTuple(1, 'a', {});
    }

## Examples

    import 'package:tuples/tuples.dart';
    
    void main() {
        Tuple t1 = newTuple(1, 'a', {});
    
        print(t1); // outputs: <1, a, {}>
    
        print(t1.elementAt(1)); // outputs: a
    
        print(t1.length); // outputs: 3
    
        print(newTuple('a', 1, false) == newTuple('a', 1, false)); // outputs: true
    
        TupleIterator iterator = new TupleIterator(newTuple('a', 1, false));
        print(iterator.current); // outputs: a
        print(iterator.moveNext()); // outputs: true
        print(iterator.current); // outputs: 1
    }

## Features and bugs

Please file feature requests and bugs at the [issue tracker][tracker].

[tracker]: https://github.com/michal-stalmach/tuples/issues
