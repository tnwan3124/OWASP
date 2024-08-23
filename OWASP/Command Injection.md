## **Lỗ hổng Injection**

Lỗ hổng Injection rất phổ biến trong các ứng dụng hiện nay. Những lỗ hổng này xảy ra do ứng dụng diễn giải đầu vào do người dùng kiểm soát dưới dạng các lệnh hoặc tham số. Các cuộc tấn công Injection phụ thuộc vào công nghệ được sử dụng và cách các công nghệ này diễn giải đầu vào. Một số ví dụ phổ biến bao gồm:

- **SQL Injection:** Điều này xảy ra khi đầu vào do người dùng kiểm soát được truyền vào các truy vấn SQL. Kết quả là, kẻ tấn công có thể truyền vào các truy vấn SQL để thao túng kết quả của các truy vấn đó. Điều này có khả năng cho phép kẻ tấn công truy cập, sửa đổi và xóa thông tin trong cơ sở dữ liệu khi đầu vào này được truyền vào các truy vấn cơ sở dữ liệu. Điều này có nghĩa là kẻ tấn công có thể đánh cắp thông tin nhạy cảm như thông tin cá nhân và thông tin đăng nhập.
- **Command Injection:** Điều này xảy ra khi đầu vào của người dùng được truyền vào các lệnh hệ thống. Kết quả là, kẻ tấn công có thể thực thi các lệnh hệ thống tùy ý trên các máy chủ ứng dụng, có khả năng cho phép họ truy cập vào hệ thống của người dùng.

**Cách phòng thủ chính để ngăn chặn các cuộc tấn công Injection là đảm bảo rằng đầu vào do người dùng kiểm soát không được diễn giải dưới dạng các truy vấn hoặc lệnh. Có nhiều cách khác nhau để thực hiện việc này:**

- **Sử dụng danh sách cho phép (allow list):** Khi đầu vào được gửi đến máy chủ, đầu vào này được so sánh với danh sách các đầu vào hoặc ký tự an toàn. Nếu đầu vào được đánh dấu là an toàn, thì nó sẽ được xử lý. Nếu không, nó sẽ bị từ chối và ứng dụng sẽ đưa ra lỗi.
- **Loại bỏ đầu vào (Stripping input):** Nếu đầu vào chứa các ký tự nguy hiểm, chúng sẽ bị loại bỏ trước khi xử lý.

Các ký tự hoặc đầu vào nguy hiểm được phân loại là bất kỳ đầu vào nào có thể thay đổi cách thức xử lý dữ liệu cơ bản. Thay vì tự xây dựng danh sách cho phép hoặc loại bỏ đầu vào, có nhiều thư viện khác nhau có thể thực hiện các hành động này cho bạn.

## Lỗ hổng Command Injection
Lỗ hổng Command Injection xảy ra khi mã phía máy chủ (như PHP) trong ứng dụng web gọi một hàm tương tác trực tiếp với console của máy chủ. Lỗ hổng này cho phép kẻ tấn công lợi dụng cuộc gọi đó để thực thi tùy ý các lệnh hệ điều hành trên máy chủ. Từ đây, kẻ tấn công có thể liệt kê tệp, đọc nội dung, chạy các lệnh cơ bản để do thám máy chủ hoặc bất cứ điều gì họ muốn, giống như thể họ đang ngồi trước máy chủ và nhập lệnh trực tiếp vào dòng lệnh.

Một khi kẻ tấn công có chỗ đứng trên máy chủ web, họ có thể bắt đầu liệt kê các hệ thống của bạn và tìm cách di chuyển xung quanh.

**PHP**

```jsx
<?php
    if (isset($_GET["mooing"])) {
        $mooing = $_GET["mooing"];
        $cow = 'default';

        if(isset($_GET["cow"]))
            $cow = $_GET["cow"];
        
        passthru("perl /usr/bin/cowsay -f $cow $mooing");
    }?>
```

Nói một cách đơn giản, đoạn mã trên thực hiện như sau:

- Kiểm tra xem tham số "mooing" có được đặt hay không. Nếu có, biến `$mooing` sẽ nhận giá trị được truyền vào trường nhập liệu.
- Kiểm tra xem tham số "cow" có được đặt hay không. Nếu có, biến `$cow` sẽ nhận giá trị được truyền qua tham số.
- Chương trình sau đó thực thi hàm `passthru("perl /usr/bin/cowsay -f $cow $mooing");`. Hàm passthru chỉ đơn giản thực thi một lệnh trong console của hệ điều hành và gửi đầu ra trở lại trình duyệt của người dùng. Bạn có thể thấy rằng lệnh của chúng ta được hình thành bằng cách nối các biến `$cow` và `$mooing` vào cuối nó. Vì chúng ta có thể thao tác các biến đó, chúng ta có thể thử tiêm thêm các lệnh bằng cách sử dụng các thủ thuật đơn giản. Nếu bạn muốn, bạn có thể đọc tài liệu về `passthru()` trên trang web của PHP để biết thêm thông tin về chính hàm này.
![alt text](<img/9.png>)

## Basic Command
    $(whoami), $(pwd), $(grep root), $(uname -a), $(ls), $(cat /etc/hosts), $(cat /etc/passwd), ...
Tham khảo tại: 
**https://github.com/payloadbox/command-injection-payload-list**