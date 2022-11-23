%mencari kampus paling hemat
include "table.mzn";
int: min_acc;%akreditas (a=1,b=2,...)
int: cat;%swasta=1 / negeri=2
int: max_price;%batas biaya persemester (k)
int: max_fare;%batas ongkos perhari (k)

set of UNIVERSITY: unis;
set of int: FEATURES = 1..5;
int: name = 1; int: accreditation = 2; int: category = 3; int: price = 4; int: fare = 5;
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
constraint uni[fare] <= max_fare;
constraint uni[price] <= max_price;
constraint budget = uni[fare]*25*4+uni[price];
%solve satisfy;
%solve maximize budget;
solve minimize budget;

output ["University with the lowest cost that fit with your criteria is ",n[fix(uni[name])],
", expected budget/semester is ",show(budget), "\n"];

nu = 6;
n = ["Universitas Negeri Gunaguna","Universitas Jalanjalan","Institut Teknik Jawa","Universitas Negeri Swasta","Universitas Sekitaran Sini","Universitas Jarakjauh"];
dd = 
%nam,acc,cat,dist,prc,fare
[| 1, 3, 2, 6000, 5       %Universitas Negeri Gunaguna
|  2, 2, 1, 5000, 10      %Universitas Jalan jalan
|  3, 1, 1, 9000, 30     %Institut Teknik Jawa
|  4, 2, 2, 10000, 15      %Universitas Negeri Swasta
|  5, 3, 1, 3000, 5       %Universitas Sekitaran Sini
|  6, 3, 1, 7000, 30 |]; %Universitas Jarak jauh

