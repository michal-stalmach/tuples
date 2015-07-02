// Copyright (c) 2015, Michał Stalmach. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

library tuples.example;

import 'package:tuples/tuples.dart';

main() {
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
