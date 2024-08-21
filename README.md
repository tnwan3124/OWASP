# Các lệnh hữu ích Linux

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