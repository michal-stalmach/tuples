// Copyright (c) 2015, Michał Stalmach. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

library tuples.test;

import 'package:test/test.dart';

import 'package:tuples/tuples.dart';

void main() {

    group('Tuple', () {

        test('should accept NULLs', () {
            Tuple t = newTuple(null, 1, null);
            expect(t.toString(), equals('<null, 1, null>'));
            t = newTuple(null);
            expect(t.elementAt(0), isNull);
        });

        test('should serialize to String', () {
            Tuple t = newTuple(1, 'a', {}, []);
            expect(t.toString(), equals('<1, a, {}, []>'));
        });

        test('should be equal to itself', () {
            Tuple t1 = newTuple(1, 'a', {}, []);

            expect(t1 == t1, isTrue);
        });

        test('should be equal to the other one with the same values', () {
            Map m = new Map();
            List l = new List();
            Tuple t1 = newTuple(1, 'a', m, l, null);
            Tuple t2 = newTuple(1, 'a', m, l, null);
            Tuple t3 = newTuple(1, 'a', m, null, l);
            Tuple t4 = newTuple(l, m, 'b', 2);

            expect(t1 == t2, isTrue);
            expect(t1 == t3, isFalse);
            expect(t1 == t4, isFalse);
        });

        test('should provide iterator', () {
            Tuple t1 = newTuple(1, '2', true);
            Iterator it = t1.iterator;
            expect(it.current, equals(1));
            expect(it.moveNext(), isTrue);
            expect(it.current, equals('2'));
            expect(it.moveNext(), isTrue);
            expect(it.current, equals(true));
            expect(it.moveNext(), isFalse);
            expect(it.moveNext(), isFalse);

            it = t1.iterator;
            expect(it.current, equals(1));
        });

        test('should return element at certain position', () {
            Tuple nested = newTuple(3,2,1);
            Tuple t = newTuple(null, 1, '2', true, null, nested);
            expect(t.elementAt(0), isNull);
            expect(t.elementAt(1), equals(1));
            expect(t.elementAt(2), equals('2'));
            expect(t.elementAt(3), equals(true));
            expect(t.elementAt(4), isNull);
            expect(t.elementAt(5), equals(nested));
        });

        test('should provide number of elements', () {
            Tuple t1 = newTuple(null, 1, '2', true, null);
            expect(t1.length, equals(5));
            Tuple t2 = newTuple(null);
            expect(t2.length, equals(1));
        });

    });

    group('TupleIterator', () {

        test('should allow to iterate over values', () {
            Tuple t1 = newTuple(1, '2', true);
            TupleIterator it = new TupleIterator(t1);
            expect(it.current, equals(1));
            expect(it.moveNext(), isTrue);
            expect(it.current, equals('2'));
            expect(it.moveNext(), isTrue);
            expect(it.current, equals(true));
            expect(it.moveNext(), isFalse);
            expect(it.current, isNull);
            expect(it.moveNext(), isFalse);
            expect(it.current, isNull);
        });

    });

}
