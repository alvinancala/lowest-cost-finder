%mencari kampus paling hemat
include "table.mzn";
int: min_acc; %akreditas, input '1' jika A,input '2' jika B,.. etc
int: cat; %kategori univ, input '1' jika swasta,input '2' jika negri
int: area; 
int: max_harga_semester;%batas biaya persemester (k)
int: max_harga_ongkos;%batas ongkos perhari (k)

set of UNIVERSITY: unis;
set of int: FEATURES = 1..7;%jumlah kolom
int: nama = 1; int: akreditasi = 2; int: kategori = 3; int: daerah = 4; 
int: harga_semester = 5; int: uang_pangkal = 6; int: ongkos = 7;

int: jumlah_data; %jumlah row table
set of int: UNIVERSITY = 1..jumlah_data;

array[UNIVERSITY] of string: nama_univ;%set nama univ
array[UNIVERSITY] of string: nama_informatika;
array[UNIVERSITY] of string: nama_sisteminformasi;
array[UNIVERSITY] of string: nama_sastrainggris;
array[UNIVERSITY] of string: nama_akuntansi;
array[UNIVERSITY] of string: nama_manajemen;
array[UNIVERSITY] of string: nama_tekniksipil;


array[UNIVERSITY,FEATURES] of int: jurusan;%pilihan jurusan
array[UNIVERSITY,FEATURES] of int: informatika; 
array[UNIVERSITY,FEATURES] of int: sastrainggris; 
array[UNIVERSITY,FEATURES] of int: sisteminformasi; 
array[UNIVERSITY,FEATURES] of int: akuntansi; 
array[UNIVERSITY,FEATURES] of int: manajemen; 
array[UNIVERSITY,FEATURES] of int: tekniksipil;

array[FEATURES] of var int: uni;
var int: budget;
var int: total_budget;

%constraint
constraint uni[nama] in unis;
constraint table(uni, jurusan);
constraint uni[akreditasi] <= min_acc;
constraint uni[kategori] = cat;
constraint uni[daerah] = area;
constraint uni[ongkos] <= max_harga_ongkos;
constraint uni[harga_semester] <= max_harga_semester;

constraint budget = uni[ongkos]*25*4+uni[harga_semester];
constraint total_budget = (uni[ongkos]*21*4+uni[harga_semester])*8 + uni[uang_pangkal];

solve minimize total_budget;

%output
output ["universitas dengan harga terendaha adalah ",nama_univ[fix(uni[nama])],
" dengan akreditasi ",show(uni[akreditasi]),
" dengan kategori ",show(uni[kategori]),
" dengan daerah ",show(uni[daerah]),
" dengan uang pangkal ",show(uni[uang_pangkal]),
" dengan uang semster ",show(uni[harga_semester]),
", ekspetasi budget yang harus dikeluarkan untuk tiap semester adalah ",show(budget), "\n dan totdal budget yang dibituhkan selama 8 semester adalah ",show(total_budget),"."];


unis = {1,2,3,4,5,6,7,8};

jumlah_data = 8;
nama_informatika = 
["UKRIDA","Universitas Esa Unggul","Universitas Bina Nusantara","Universitas Pelita Harapan","Universitas Tarumanagara","Universitas Pancasila","Universitas Negri Jakarta","UI"];
informatika = 
[| 1, 1, 1, 1, 20000000, 10000000, 10000      
|  2, 1, 1, 2, 11600000, 18500000, 10000    
|  3, 2, 1, 3, 18700000, 38000000, 10000      
|  4, 2, 1, 4, 131000000, 19500000,10000     
|  5, 2, 1, 5, 23000000, 12000000,10000 
|  6, 2, 1, 5, 20000000, 13000000,10000   
|  7, 2, 1, 5, 0, 7400000,10000 
|  8, 2, 1, 6, 40000000, 12500000,10000 |]; 


nama_sisteminformasi=["UKRIDA","Universitas Tarumanagara","Universitas Pelita Harapan","Universitas Gunadarma","BINA SARANA INFORMATIKA",
"UNIVERSITAS ESA UNGGUL","UNIVERSITAS ATMA JAYA","Universitas Islam Negeri Syarif Hidayatullah Jakarta"];

sisteminformasi = 
[| 1, 2, 1, 2, 10000000, 20000000, 10000      
|  2, 2, 1, 2, 8000000, 17000000, 10000    
|  3, 2, 1, 7, 20000000, 131000000, 10000      
|  4, 2, 1, 1, 15800000, 94800000,10000
|  5, 1, 1, 5, 2580000, 3600000,10000
|  6, 2, 1, 2, 11600000, 18100000,10000
|  7, 2, 1, 5, 4500000, 11000000,10000
|  8, 1, 2, 7, 2400000, 7900000,10000|];


nama_sastrainggris =["UKRIDA","Universitas Bina Sarana Informatika","Universitas Gunadarma","Universitas Esa Unggul","Universitas Bunda Mulia",
"Universitas Bina Nusantara","Universitas Kristen Indonesia","Universitas Islam Negeri Syarif Hidayatullah Jakarta"];
sastrainggris = 
[| 1, 2, 1, 2, 10000000, 20000000, 10000      
|  2, 2, 1, 5, 2580000, 3600000, 10000    
|  3, 2, 1, 3, 13600000, 82800000, 10000     
|  4, 2, 1, 2, 11600000, 18100000,10000
|  5, 2, 1, 5, 4500000, 19900000,10000
|  6, 1, 1, 4, 18700000, 38000000,10000
|  7, 2, 1, 2, 11100000, 17950000,10000
|  8, 1, 2, 7, 6400000, 2400000,10000|];

nama_akuntansi = 
["UKRIDA","Universitas Trisakti","Universitas Bina Sarana Informatika","Universitas Pelita Harapan","Universitas Atma Jaya","Universitas Gunadarma","Universitas Negri Jakarta","UI"];
akuntansi = 
[| 1, 1, 1, 2, 20000000, 12000000, 10000      
|  2, 1, 1, 2, 21500000, 9500000, 10000    
|  3, 2, 1, 5, 3600000, 2580000, 10000
|  4, 1, 1, 7, 188000000, 19000000,10000     
|  5, 1, 1, 5, 28000000, 7700000,10000 
|  6, 2, 1, 1, 84800000, 13800000,10000 
|  7, 1, 2, 3, 12000000, 6400000,10000 
|  8, 1, 2, 6, 25000000, 12000000,10000 |];

nama_manajemen = 
["UKRIDA","Universitas Pelita Harapan","Universitas Mercu Buana","Sekolah Tinggi Ilmu Ekonomi Indonesia Jakarta","Universitas Pancasila",
"Universitas Bina Nusantara","Universitas Negri Jakarta","UI"];
manajemen = 
[| 1, 1, 1, 2, 20000000, 12000000, 10000      
|  2, 1, 1, 7, 45000000, 19550000, 10000    
|  3, 1, 1, 2, 20000000, 2580000, 10000
|  4, 1, 1, 2, 41200000, 8081250,10000     
|  5, 1, 1, 5, 18000000, 16175000,10000 
|  6, 1, 1, 2, 38000000, 18700000,10000 
|  7, 1, 2, 3, 12000000, 6400000,10000 
|  8, 1, 2, 6, 25000000, 12000000,10000 |];

nama_tekniksipil = 
["UKRIDA","Universitas Trisakti","Universitas Tarumanagara","Universitas Pelita Harapan","Universitas Gunadarma",
"Universitas Mercu Buana","Universitas Negri Jakarta","UI"];
tekniksipil = 
[| 1, 2, 1, 2, 20000000, 10000000, 10000      
|  2, 1, 1, 2, 26000000, 11000000, 10000    
|  3, 1, 1, 2, 25000000, 12500000, 10000
|  4, 1, 1, 7, 131000000, 20000000,10000     
|  5, 1, 1, 1, 22000000, 13000000,10000 
|  6, 1, 1, 2, 20080000, 9000000,10000 
|  7, 2, 2, 3, 12300000, 7400000,10000 
|  8, 1, 2, 6, 50000000, 10000000,10000 |];
