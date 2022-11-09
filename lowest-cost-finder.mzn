%mencari kampus paling hemat
include "table.mzn";
int: min_acc;%akreditas (a=1,b=2,...)
int: cat;%swasta=1 / negeri=2
int: max_distance;%jarak (m)
int: max_price;%batas biaya persemester (k)
int: max_fare;%batas ongkos perhari (k)

set of UNIVERSITY: unis;
set of int: FEATURES = 1..6;
int: name = 1; int: accreditation = 2; int: category = 3;
int: distance = 4; int: price = 5; int: fare = 6;
int: nu; %jumla pilihan
set of int: UNIVERSITY = 1..nu;
array[UNIVERSITY] of string: n; %nama
array[UNIVERSITY,FEATURES] of int: dd; %database
array[FEATURES] of var int: uni;
var int: budget;

constraint uni[name] in unis;
constraint table(uni, dd);
constraint uni[accreditation] <= min_acc;
constraint uni[category] = cat;
constraint uni[distance]  <= max_distance;
constraint uni[fare] <= max_fare;
constraint uni[price] <= max_price;
constraint budget = uni[fare]*25*4+uni[price];
%solve satisfy;
%solve maximize budget;
solve minimize budget;

output ["University with the lowest cost that fit with your criteria is ",n[fix(uni[name])],
", expected budget/semester is ",show(budget), "\n"];

%input
nu = 6;
n = ["k1","k2","k3","k4","k5","k6"];
dd = 
%nam,acc,cat,dist,prc,fare
[| 1, 1, 1, 5000, 9000, 10      %k1
|  2, 2, 1, 8000, 9000, 12      %k2
|  3, 1, 1, 6000, 9000, 10      %k3
|  4, 1, 2, 4600, 9000, 8       %k4
|  5, 1, 1, 7000, 9000, 8       %k5
|  6, 1, 1, 6800, 9000, 10 |];  %k6

cat = 1;
min_acc = 2;
max_distance = 8000;
max_price = 9000;
max_fare = 10;
unis = {1,2,3,4,5,6};
