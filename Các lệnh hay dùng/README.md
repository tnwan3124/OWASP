# Các lệnh hay dùng

## chmod
    Mục đích: Đặt quyền truy cập cho file/thư mục (ai được đọc/ghi/thực thi).
    Đọc (r), ghi (w), thực thi (x)

* **chmod +x script.sh**: Cấp quyền thực thi cho tập lệnh.

* **chmod -x script.sh**: Loại bỏ quyền thực thi (không chạy được trực tiếp)

## find
    Tìm kiếm file trong hệ thống.
> find . -name "*.txt": Tìm tất cả file .txt trong thư mục hiện tại

    tryhackme@linux1:~$ find -name passwords.txt
    ./folder1/passwords.txt
    tryhackme@linux1:~$
---
    tryhackme@linux1:~$ find -name *.txt
    ./folder1/passwords.txt
    ./Documents/todo.txt
    tryhackme@linux1:~$

## grep
    Tìm kiếm và hiển thị các dòng chứa mẫu cụ thể trong file hoặc đầu ra của lệnh khác.
> grep "từ_khóa" file.txt: Tìm "từ_khóa" trong file.txt
 
> ps aux | grep "process_name": Tìm tiến trình có tên        "process_name"

    tryhackme@linux1:~$ grep "81.143.211.90" access.log
    81.143.211.90 - - [25/Mar/2021:11:17 + 0000] "GET / HTTP/1.1" 200 417 "-" "Mozilla/5.0 (Linux; Android 7.0; Moto G(4))"
    tryhackme@linux1:~$

## nano
    Để tạo hoặc sửa file

> Điều hướng: Mũi tên lên/xuống, Enter để xuống dòng mới

* Tính năng:

    > Tìm kiếm văn bản (Ctrl + W)

    > Sao chép/Dán (Ctrl + 6, Ctrl + U)

    > Nhảy đến dòng (Ctrl + _)

    > Xem số dòng (Ctrl + C)

    > Thoát: Ctrl + X


## wget
    Tải tệp tin là một tính năng cơ bản trong máy tính, cho phép bạn lấy chương trình, script, hoặc ảnh từ internet.

> wget https://assets.tryhackme.com/additionallinux-fundamentalspart3/myfile.txt   

## scp
    scp là một lệnh để sao chép tệp an toàn giữa hai máy tính
    Nó sử dụng giao thức SSH để xác thực và mã hóa

Đoạn văn giải thích về cách sử dụng lệnh `scp` để truyền tệp an toàn giữa hai máy tính, sử dụng giao thức SSH để xác thực và mã hóa dữ liệu. 

**Tóm tắt các điểm chính:**

* `scp` là một lệnh để sao chép tệp an toàn giữa hai máy tính
* Nó sử dụng giao thức SSH để xác thực và mã hóa
* `scp` hoạt động theo mô hình SOURCE (nguồn) và DESTINATION (đích), cho phép bạn:
    * Sao chép tệp & thư mục từ máy tính hiện tại đến máy tính từ xa
    * Sao chép tệp & thư mục từ máy tính từ xa về máy tính hiện tại
* Bạn cần biết tên người dùng và mật khẩu của cả hai máy tính để sử dụng

**Ví dụ 1: Sao chép từ máy tính hiện tại đến máy tính từ xa**

* Giả sử bạn có các thông tin sau:
    * Địa chỉ IP máy tính từ xa: `192.168.1.30`
    * Tên người dùng trên máy từ xa: `ubuntu`
    * Tên tệp trên máy tính hiện tại: `important.txt`
    * Tên bạn muốn đặt cho tệp trên máy tính từ xa: `transferred.txt`

* Lệnh `scp` sẽ như sau:
   ```bash
   scp important.txt ubuntu@192.168.1.30:/home/ubuntu/transferred.txt
   ```

**Ví dụ 2: Sao chép từ máy tính từ xa về máy tính hiện tại**

* Giả sử bạn có các thông tin sau:
    * Địa chỉ IP máy tính từ xa: `192.168.1.30`
    * Tên người dùng trên máy từ xa: `ubuntu`
    * Tên tệp trên máy tính từ xa: `documents.txt`
    * Tên bạn muốn đặt cho tệp trên máy tính hiện tại: `notes.txt`

* Lệnh `scp` sẽ như sau:
   ```bash
   scp ubuntu@192.168.1.30:/home/ubuntu/documents.txt notes.txt
   ```

**Giải thích cú pháp lệnh `scp`**

* `scp`: Tên lệnh
* `SOURCE`: Đường dẫn đến tệp/thư mục nguồn
* `DESTINATION`: Đường dẫn đến nơi lưu tệp/thư mục đích
* `username@remote_IP_address` : Thông tin đăng nhập vào máy tính từ xa
* `:/path/to/file`: Đường dẫn đến tệp/thư mục trên máy tính từ xa

## HTTPServer
`HTTPServer` giúp dễ dàng tạo một máy chủ web đơn giản

**Khởi động** 

    python3 -m http.server -b IP_Address Port

**Dừng http.server**
    
    ps aux | grep http.server
    root       18085  0.0  0.3  30424 18304 pts/1    T    05:16   0:00 python3 -m http.server

    ┌──(root㉿kali)-[~]
    └─# ps aux | grep http.server
        root       18085  0.0  0.3  30424 18304 pts/1    T    05:16 0:00 python3 -m http.server

    ┌──(root㉿kali)-[~]
    └─# kill -9 18085
    [1]  + killed     python3 -m http.server

## Crontab
    Một tệp đặc biệt chứa danh sách các tác vụ định kỳ (cron jobs) mà cron sẽ thực hiện.

* `MIN`: Phút thực hiện (0-59)
* `HOUR`: Giờ thực hiện (0-23)
* `DOM`: Ngày trong tháng thực hiện (1-31)
* `MON`: Tháng trong năm thực hiện (1-12)
* `DOW`: Ngày trong tuần thực hiện (0-7, 0 và 7 đều là Chủ nhật)
* `CMD`: Lệnh sẽ được thực thi

Sao lưu thư mục "Documents" của người dùng "cmnatic" vào thư mục "/var/backups/" cứ sau 12 giờ.

    0 */12 * * * cp -R /home/cmnatic/Documents /var/backups/

* Dấu "/" thêm vào dùng để thực thi vào cứ mỗi thời gian được đặt, nếu không có thì chỉ thực hiện 1 lần.

## sqlite3 
    Là một công cụ dòng lệnh (command-line tool) mạnh mẽ để tương tác với cơ sở dữ liệu SQLite. 


**Ví dụ cụ thể:**

1. **Tạo cơ sở dữ liệu và bảng:**

```bash
sqlite3 sinh_vien.db
CREATE TABLE sinhvien (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    ho_ten TEXT NOT NULL,
    tuoi INTEGER,
    diem_trung_binh REAL
);
.quit
```

2. **Chèn dữ liệu:**

```bash
sqlite3 sinh_vien.db
INSERT INTO sinhvien (ho_ten, tuoi, diem_trung_binh) VALUES ('Nguyễn Văn A', 20, 8.5);
INSERT INTO sinhvien (ho_ten, tuoi, diem_trung_binh) VALUES ('Trần Thị B', 21, 7.0);
.quit
```

3. **Truy vấn dữ liệu:**

```bash
sqlite3 sinh_vien.db
SELECT * FROM sinhvien;
.quit
```

Kết quả sẽ hiển thị danh sách sinh viên trong cơ sở dữ liệu.

### Giả sử chúng ta đã tải xuống thành công một cơ sở dữ liệu:
**Bash**

```jsx
user@linux$ ls -l 
-rw-r--r-- 1 user user 8192 Feb  2 20:33 example.db

user@linux$ file example.db 
example.db: SQLite 3.x database, last written using SQLite version 3039002, file counter 1, database pages 2, cookie 0x1, schema 4, UTF-8, version-valid-for 1
```

Chúng ta có thể thấy rằng có một cơ sở dữ liệu SQLite trong thư mục hiện tại.

Để truy cập nó, chúng ta sử dụng `sqlite3 <database-name>`:

**Bash**

```jsx
user@linux$ sqlite3 example.db                     
SQLite version 3.39.2 2022-07-21 15:24:47
Enter ".help" for usage hints.
sqlite>
```

Từ đây, chúng ta có thể xem các bảng trong cơ sở dữ liệu bằng cách sử dụng lệnh `.tables`:

**Bash**

```jsx
user@linux$ sqlite3 example.db                     
SQLite version 3.39.2 2022-07-21 15:24:47
Enter ".help" for usage hints.
sqlite> .tables
customers
```

Tại thời điểm này, chúng ta có thể kết xuất tất cả dữ liệu từ bảng, nhưng chúng ta sẽ không nhất thiết biết ý nghĩa của từng cột trừ khi chúng ta xem thông tin bảng. Đầu tiên, hãy sử dụng `PRAGMA table_info(customers);` để xem thông tin bảng. Sau đó, chúng tôi sẽ sử dụng `SELECT * FROM customers;` để kết xuất thông tin từ bảng:

**Bash**

```jsx
sqlite> PRAGMA table_info(customers);
0|cudtID|INT|1||1
1|custName|TEXT|1||0
2|creditCard|TEXT|0||0
3|password|TEXT|1||0

sqlite> SELECT * FROM customers;
0|Joy Paulson|4916 9012 2231 7905|5f4dcc3b5aa765d61d8327deb882cf99
1|John Walters|4671 5376 3366 8125|fef08f333cc53594c8097eba1f35726a
2|Lena Abdul|4353 4722 6349 6685|b55ab2470f160c331a99b8d8a1946b19
3|Andrew Miller|4059 8824 0198 5596|bc7b657bd56e4386e3397ca86e378f70
4|Keith Wayman|4972 1604 3381 8885|12e7a36c0710571b3d827992f4cfe679
5|Annett Scholz|5400 1617 6508 1166|e2795fc96af3f4d6288906a90a52a47f
```

Chúng ta có thể thấy từ thông tin bảng rằng có bốn cột: `custID`, `custName`, `creditCard` và `password`. Bạn có thể nhận thấy rằng điều này khớp với kết quả. Lấy hàng đầu tiên:

`0|Joy Paulson|4916 9012 2231 7905|5f4dcc3b5aa765d61d8327deb882cf99`

Chúng ta có `custID` (0), `custName` (Joy Paulson), `creditCard` (4916 9012 2231 7905) và băm mật khẩu (5f4dcc3b5aa765d61d8327deb882cf99).
