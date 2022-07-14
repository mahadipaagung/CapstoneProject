# CapstoneProject

## Installation
Pastikan pada local machine telah terinstall ruby beserta ruby on rails, apabila telah terinstall dapat melakukan git clone seperti di bawah ini:

>git clone https://github.com/mahadipaagung/CapstoneProject

Setelah melakukan clone dari web github ke local machine, dapat melakukan command 

>bundle install

pada directory
Setelah itu pada command line interface dapat menjalankan command 

>rake db:migrate 

agar table database termigrasi pada directory local

## Create Data User
Untuk menambahkan data user dapat menggunakan format JSON berikut ini pada Postman:
```json
{
  "nama" : "",
  "email" : "",
  "password_digest" : "",
  "password_confirmation" : ""
}
```
Format di atas adalah untuk 3 user pada program, user yang dimaksud yaitu Penyalur, Pengumpul, serta Admin.

Kemudian akan mendapatkan response seperti di bawah ini apabila input/register data user berhasil:
```json
{
        "id": 1,
        "nama": "abdi",
        "email": "abdi@gmail.com",
        "password_digest": "$2a$12$VpYB/2P7qhqCBymIG8C3GuLJemdsBWepGY2B/.rO2RQwKEb3wa8oC",
        "created_at": "2022-07-11T07:20:18.889Z",
        "updated_at": "2022-07-11T07:20:18.889Z"
    }
```
## Orders
Fitur Order adalah fitur yang berfungsi untuk User Penyalur menyalurkan sampahnya ke sistem, kemudian User Pengumpul akan dapat melihat data sampah yang terdaftar kemudian akan mengambilnya sesuai dengan daftar beserta harga sampah yang akan dibayar oleh Pengumpul ke Penyalur
Untuk menambahkan data sampah pada order dapat menggunakan format JSON berikut ini pada Postman:
```json
{"order": {

    "penyalur_id": 2,
    "pengumpul_id": 1,
    "deskripsi" : "Liorem Ipsum",
    "wastes" : [
        {
            "id": 1,
            "quantity": 250
        }
    ]
}}
```
Kemudian apabila input data berhasil akan menampilkan response seperti berikut ini:
```json
{
    "status": "true",
    "code": 200,
    "message": "Berhasil menambah data",
    "data": {
        "id": 3,
        "deskripsi": "Liorem Ipsum",
        "total": 125000,
        "penyalur_id": 2,
        "pengumpul_id": 1,
        "created_at": "2022-07-11T23:58:37.892Z",
        "updated_at": "2022-07-11T23:58:37.892Z"
    }
}
```
