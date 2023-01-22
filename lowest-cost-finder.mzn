%mencari kampus paling hemat
include "table.mzn";
int: min_acc; %akreditas, input '1' jika A,input '2' jika B,.. etc
int: cat; %kategori univ, input '1' jika swasta,input '2' jika negri
int: max_harga_semester;%batas biaya persemester (k)
int: max_harga_ongkos;%batas ongkos perhari (k)

set of UNIVERSITY: unis;
set of int: FEATURES = 1..7;%jumlah kolom
int: nama = 1; int: akreditasi = 2; int: kategori = 3; int: daerah = 4; 
int: harga_semester = 5; int: uang_pangkal = 6; int: ongkos = 7;

int: jumlah_data; %jumlah row table
int: jumlah_data_informatika;

set of int: UNIVERSITY = 1..jumlah_data;

array[UNIVERSITY] of string: nama_univ;%set nama univ
array[UNIVERSITY] of string: nama_informatika;

array[UNIVERSITY,FEATURES] of int: jurusan;%pilihan jurusan
array[UNIVERSITY,FEATURES] of int: informatika; 

array[FEATURES] of var int: uni;
var int: budget;
var int: total_budget;

%constraint
constraint uni[nama] in unis;
constraint table(uni, jurusan);
constraint uni[akreditasi] <= min_acc;
constraint uni[kategori] = cat;
constraint uni[ongkos] <= max_harga_ongkos;
constraint uni[harga_semester] <= max_harga_semester;

constraint budget = uni[ongkos]*25*4+uni[harga_semester];
constraint total_budget = (uni[ongkos]*25*4+uni[harga_semester])*8 + uni[uang_pangkal];

solve minimize total_budget;

%output nanti diganti lg
output ["University with the lowest cost that fit with your criteria is ",nama_univ[fix(uni[nama])],
" with entry fee ",show(uni[uang_pangkal]),
", expected budget/semester is ",show(budget), "\n and expected total payment until graduation with 8 semester is ",show(total_budget)];

jumlah_data_informatika = 11;
unis = {1,2,3,4,5,6,7,8,9,10,11};

nama_informatika = 
["UKRIDA","Esa Unggul","Binus","UPH","UNTAR","Gundar",
"UMB","UHAMKA","UPN","UNJ","UI"];
informatika = 
[| 1, 1, 1, 1, 20000000, 10000000, 10000      
|  2, 1, 1, 2, 11600000, 18500000, 10000    
|  3, 2, 1, 3, 9000000, 14500000, 20000      
|  4, 2, 1, 4, 6000000, 3000,5000     
|  5, 2, 1, 5, 6000000, 3000,5000 
|  6, 2, 1, 5, 6000000, 3000,5000 
|  7, 2, 1, 5, 6000000, 3000,5000 
|  8, 2, 1, 5, 6000000, 3000,5000 
|  9, 2, 1, 5, 6000000, 3000,5000   
|  10, 2, 1, 5, 6000000, 3000,5000 
|  11, 2, 1, 6, 10000000, 20000000,30000 |]; 
