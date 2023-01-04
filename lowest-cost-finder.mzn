%mencari kampus paling hemat
include "table.mzn";
int: min_acc; %akreditas, input '1' jika A,input '2' jika B,.. etc
int: cat; %kategori univ, input '1' jika swasta,input '2' jika negri
int: max_price;%batas biaya persemester (k)
int: max_fare;%batas ongkos perhari (k)

set of UNIVERSITY: unis;
set of int: FEATURES = 1..6;%jumlah data row .... tambah aja angkanya kalo mau lebih
int: name = 1; int: accreditation = 2; int: category = 3; int: semester_prc = 4; int: entry_fee = 5; int: fare = 6;
int: nu; %jumlah pilihan univ
set of int: UNIVERSITY = 1..nu;
array[UNIVERSITY] of string: nama_univ; %nama univ

array[UNIVERSITY,FEATURES] of int: major ;%pilihan jurusan

%database berdasrkan pilihan jurusan
array[UNIVERSITY,FEATURES] of int: informatics; 
array[UNIVERSITY,FEATURES] of int: business; 
array[UNIVERSITY,FEATURES] of int: psychology; 
array[UNIVERSITY,FEATURES] of int: doctor;
% ....  tambah lagi aja kalo bisa

array[FEATURES] of var int: uni;
var int: budget;
var int: total_budget;

constraint uni[name] in unis;
constraint table(uni, major);
constraint uni[accreditation] <= min_acc;
constraint uni[category] = cat;
constraint uni[fare] <= max_fare;
constraint uni[semester_prc] <= max_price;

%perhitungan constraint dan output masih pending perkembangannya
constraint budget = uni[fare]*25*4+uni[semester_prc];
constraint total_budget = (uni[fare]*25*4+uni[semester_prc])*8 + uni[entry_fee];
%solve satisfy;
%solve maximize budget;
solve minimize total_budget;
output ["University with the lowest cost that fit with your criteria is ",nama_univ[fix(uni[name])],
" with entry fee ",show(uni[entry_fee]),
", expected budget/semester is ",show(budget), "\n and expected total payment until graduatin with 8 semester is ",show(total_budget)];

nu = 6;% jumlahnya ganti aja kalo mau tambahin
unis = {1,2,3,4,5,6};
nama_univ = ["Universitas Bina Nusantara","Universitas Esa Unggul","Universitas Trisakti","Universitas LSPR","Universitas Al Azhar Indonesia","Universitas Kristen Krida Wacana"];

% bawah ini aja isi datanya

%database berdsarkan jurusan
informatics = 
%nama,acrdtn,ctgry,semester,uang_pangkal,fare
[| 1, 1, 1, 21300000, 38000000, 5000      %Universitas Bina Nusantara
|  2, 1, 1, 11600000, 18500000, 10000     %Universitas Esa Unggul
|  3, 2, 1, 9000000, 14500000, 20000      %Universitas Trisakti
|  4, 2, 1, 13000000, 10000,15000      %Universitas LSPR
|  5, 2, 1, 6000000, 3000,5000       %Universitas Al Azhar Indonesia
|  6, 2, 1, 10000000, 20000000,30000 |]; %Universitas Kristen Krida Wacana

business = 
%nama,acrdtn,ctgry,semester,u_pangkal,fare
[| 1, 1, 1, 19300000, 38000000, 5000     %Universitas Bina Nusantara
|  2, 1, 1, 12000000, 18500000, 10000    %Universitas Esa Unggul
|  3, 1, 1, 9500000, 21500000, 20000     %Universitas Trisakti
|  4, 2, 2, 13000000,10000,15000      %Universitas LSPR
|  5, 2, 1, 10000000, 3000,5000       %Universitas Universitas Al Azhar Indonesia
|  6, 1, 1, 12000000, 20000000,30000 |]; %Universitas Kristen Krida Wacana

doctor = 
%nama,acrdtn,ctgry,semester,U_pangkal,fare
[| 1, 1, 1, 25200000, 38000000, 5000       %Universitas Bina Nusantara
|  2, 2, 1, 5000, 5000,10      %Universitas Esa Unggul
|  3, 1, 1, 25500000, 350000000, 20000     %Universitas Trisakti
|  4, 2, 1, 10000,10000,15      %Universitas LSPR
|  5, 3, 1, 3000, 3000,5       %Universitas Universitas Al Azhar Indonesia
|  6, 2, 1, 40000000, 350000000,30 |]; %Universitas Kristen Krida Wacana



psychology = 
%nama,acrdtn,ctgry,semester,U_pangkal,fare
[| 1, 1, 1, 18700000, 38000000 ,5000       %Universitas Bina Nusantara
|  2, 2, 1, 11600000, 18000000 ,10000      %Universitas Esa Unggul
|  3, 1, 1, 9000, 9000,30000     %Universitas Trisakti
|  4, 2, 1, 13000000,10000,15000      %Universitas LSPR
|  5, 2, 1, 12000000, 3000,5000       %Universitas Universitas Al Azhar Indonesia
|  6, 1, 1, 12000000, 20000000,30000 |]; %Universitas Kristen Krida Wacana




