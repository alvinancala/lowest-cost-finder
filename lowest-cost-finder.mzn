%mencari kampus paling hemat
include "table.mzn";
int: min_acc;%akreditas, input '1' jika A,input '2' jika B,.. etc
int: cat;%kategori univ, input '1' jika swasta,input '2' jika negri
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
nama_univ = ["Universitas Negeri Gunaguna","Universitas Jalanjalan","Institut Teknik Jawa","Universitas Negeri Swasta","Universitas Sekitaran Sini","Universitas Jarakjauh"];

% bawah ini aja isi datanya

%database berdsarkan jurusan
informatics = 
%nama,acrdtn,ctgry,semester,uang_pangkal,fare
[| 1, 3, 2, 6000, 6000,5       %Universitas Negeri Gunaguna
|  2, 2, 1, 5000, 5000,10      %Universitas Jalan jalan
|  3, 1, 1, 9000, 9000,30     %Institut Teknik Jawa
|  4, 2, 2, 10000,10000,15      %Universitas Negeri Swasta
|  5, 3, 1, 3000, 3000,5       %Universitas Sekitaran Sini
|  6, 3, 1, 7000, 7000,30 |]; %Universitas Jarak jauh

business = 
%nama,acrdtn,ctgry,semester,u_pangkal,fare
[| 1, 3, 2, 6000, 6000,5       %Universitas Negeri Gunaguna
|  2, 2, 1, 5000, 5000,10      %Universitas Jalan jalan
|  3, 1, 1, 9000, 9000,30     %Institut Teknik Jawa
|  4, 2, 2, 10000,10000,15      %Universitas Negeri Swasta
|  5, 3, 1, 3000, 3000,5       %Universitas Sekitaran Sini
|  6, 3, 1, 7000, 7000,30 |]; %Universitas Jarak jauh

doctor = 
%nama,acrdtn,ctgry,semester,U_pangkal,fare
[| 1, 3, 2, 6000, 6000,5       %Universitas Negeri Gunaguna
|  2, 2, 1, 5000, 5000,10      %Universitas Jalan jalan
|  3, 1, 1, 9000, 9000,30     %Institut Teknik Jawa
|  4, 2, 2, 10000,10000,15      %Universitas Negeri Swasta
|  5, 3, 1, 3000, 3000,5       %Universitas Sekitaran Sini
|  6, 3, 1, 7000, 7000,30 |]; %Universitas Jarak jauh



psychology = 
%nama,acrdtn,ctgry,semester,U_pangkal,fare
[| 1, 3, 2, 6000, 6000,5       %Universitas Negeri Gunaguna
|  2, 2, 1, 5000, 5000,10      %Universitas Jalan jalan
|  3, 1, 1, 9000, 9000,30     %Institut Teknik Jawa
|  4, 2, 2, 10000,10000,15      %Universitas Negeri Swasta
|  5, 3, 1, 3000, 3000,5       %Universitas Sekitaran Sini
|  6, 3, 1, 7000, 7000,30 |]; %Universitas Jarak jauh




