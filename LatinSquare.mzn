% Latin Square Problem

% Parameters
int: n; % Size of the Latin Square

% Decision Variables
array[1..n, 1..n] of var 1..n: square;

% Custom Predicate for all_different
predicate all_different(array[int] of var int: arr) =
    forall(i, j in index_set(arr)) (i != j -> arr[i] != arr[j]);

% Constraints
constraint forall(i, j in 1..n) (
    % Each row is a permutation of {1,...,n}
    all_different([square[i, k] | k in 1..n]) /\
    % Each column is a permutation of {1,...,n}
    all_different([square[k, j] | k in 1..n])
);

% Solve
solve satisfy;

% Output
output [
    "Latin Square: \(square)",
    "Objective: \(sum([square[i, j] * 10^(n-i) * 10^(n-j) | i, j in 1..n]) )"
];
