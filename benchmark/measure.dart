library tuples.benchmark;

import 'package:benchmark_harness/benchmark_harness.dart';
import 'package:tuples/tuples.dart';

final int REPETITIONS = 100000;

class ListElementAtBenchmark extends BenchmarkBase {
    ListElementAtBenchmark() : super("List - element access");

    Set list;

    static void main() {
        new ListElementAtBenchmark().report();
    }

    void run() {
        for (int i = 0; i < REPETITIONS; i++) {
            list.elementAt(9);
        }
    }

    void setup() {
        list = new Set.from([0, 1, 2, 3, 4, 5, 6, 7, 8, 9]);
    }

    void teardown() {
        list = null;
    }
}

class TupleBenchmark extends BenchmarkBase {
    TupleBenchmark() : super("Tuple - element access");

    Tuple tuple;

    static void main() {
        new TupleBenchmark().report();
    }

    void run() {
        for (int i = 0; i < REPETITIONS; i++) {
            tuple.elementAt(9);
        }
    }

    void setup() {
        tuple = newTuple(1, 2, 3, 4, 5, 6, 7, 8, 9, 10);
    }

    void teardown() {
        tuple = null;
    }
}

main() {
    TupleBenchmark.main();
    ListElementAtBenchmark.main();
}