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
                                                                                                                                    Hi


