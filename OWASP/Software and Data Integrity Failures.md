## Lỗi về tính toàn vẹn phần mềm và dữ liệu

**Tính toàn vẹn là gì?**

Trong lĩnh vực an ninh mạng, tính toàn vẹn (integrity) là khả năng đảm bảo rằng dữ liệu không bị thay đổi trái phép. Việc duy trì tính toàn vẹn của dữ liệu là vô cùng quan trọng, giúp ngăn chặn các sửa đổi không mong muốn hoặc độc hại.

Để kiểm tra tính toàn vẹn của một tệp, ta thường sử dụng **hash** (giá trị băm). Hash là một chuỗi ký tự duy nhất được tạo ra bằng cách áp dụng một thuật toán băm (như MD5, SHA1, SHA256) lên dữ liệu. Bằng cách so sánh hash của tệp gốc với hash của tệp đã tải xuống, ta có thể xác định liệu tệp có bị thay đổi hay không.
Hãy lấy WinSCP làm ví dụ để hiểu rõ hơn về cách chúng ta có thể sử dụng hash để kiểm tra tính toàn vẹn của tệp. Nếu bạn truy cập vào **kho lưu trữ Sourceforge** của họ, bạn sẽ thấy rằng đối với mỗi tệp có sẵn để tải xuống, có một số hash được công bố cùng:

Các hash này đã được tính toán trước bởi những người tạo ra WinSCP để bạn có thể kiểm tra tính toàn vẹn của tệp sau khi tải xuống. Nếu chúng tôi tải xuống tệp WinSCP-5.21.5-Setup.exe, chúng tôi có thể tính toán lại các hash và so sánh chúng với các hash được công bố trong Sourceforge. Để tính toán các hash khác nhau trong Linux, chúng ta có thể sử dụng các lệnh sau:

**Bash**

```jsx
AttackBoxuser@attackbox$ md5sum WinSCP-5.21.5-Setup.exe          20c5329d7fde522338f037a7fe8a84eb  WinSCP-5.21.5-Setup.exe

user@attackbox$ sha1sum WinSCP-5.21.5-Setup.exe c55a60799cfa24c1aeffcd2ca609776722e84f1b  WinSCP-5.21.5-Setup.exe

user@attackbox$ sha256sum WinSCP-5.21.5-Setup.exe e141e9a1a0094095d5e26077311418a01dac429e68d3ff07a734385eb0172bea  WinSCP-5.21.5-Setup.exe
```

Vì chúng tôi nhận được cùng một hash, chúng tôi có thể kết luận một cách an toàn rằng tệp chúng tôi đã tải xuống là một bản sao chính xác của tệp trên trang web.

## **Lỗi toàn vẹn phần mềm và dữ liệu**

Lỗ hổng này xảy ra khi phần mềm hoặc cơ sở hạ tầng sử dụng dữ liệu mà không kiểm tra tính toàn vẹn. Điều này cho phép kẻ tấn công sửa đổi phần mềm hoặc dữ liệu, gây ra những hậu quả không lường trước.

### **Lỗ hổng về tính toàn vẹn phần mềm (Software Integrity Failures)**

Lỗ hổng này thường xảy ra khi một trang web sử dụng các thư viện bên ngoài mà không kiểm tra tính toàn vẹn của chúng. Nếu kẻ tấn công có thể thay đổi nội dung của các thư viện này, họ có thể chèn mã độc hại vào trang web.

Để ngăn chặn lỗ hổng này, ta có thể sử dụng cơ chế **Subresource Integrity (SRI)**. SRI cho phép bạn chỉ định một hash cùng với URL của thư viện, đảm bảo rằng thư viện chỉ được thực thi nếu hash khớp với giá trị mong đợi.

### Lỗi về Tính Toàn Vẹn Dữ liệu (Data Integrity Failures)

#### Phiên Làm Việc và Mã Thông Báo Phiên (Session Tokens)

Các ứng dụng web thường sử dụng mã thông báo phiên để duy trì trạng thái đăng nhập của người dùng. Mã thông báo này, thường được lưu trữ trong cookie trên trình duyệt, được gửi kèm theo mỗi yêu cầu để ứng dụng xác định danh tính người dùng. Tuy nhiên, nếu không có cơ chế bảo vệ tính toàn vẹn, kẻ tấn công có thể giả mạo cookie và thay đổi dữ liệu bên trong, dẫn đến lỗi về tính toàn vẹn dữ liệu.

#### JSON Web Tokens (JWT)

JWT là một giải pháp để giải quyết vấn đề này. JWT cung cấp tính toàn vẹn dữ liệu bằng cách sử dụng chữ ký số. Cấu trúc của JWT gồm ba phần:

1. **Tiêu đề (Header):** Chứa siêu dữ liệu về loại mã thông báo và thuật toán ký (ví dụ: HS256).
2. **Phần tải trọng (Payload):** Chứa các cặp khóa-giá trị với dữ liệu cần lưu trữ (ví dụ: tên người dùng).
3. **Chữ ký (Signature):** Được tạo ra bằng cách sử dụng thuật toán ký và một khóa bí mật. Chữ ký đảm bảo rằng phần tải trọng không bị thay đổi.
![alt text](<img/16.png>)

#### Lỗ hổng Thuật toán None

Một số thư viện JWT đã từng có lỗ hổng cho phép kẻ tấn công bỏ qua xác thực chữ ký bằng cách:

1. Thay đổi phần tiêu đề để `alg` (thuật toán) có giá trị là `none`.
2. Xóa phần chữ ký.
![alt text](<img/17.png>)

**Ta có thể sửa cookie tại đây**
![alt text](<img/18.png>)

Điều này cho phép kẻ tấn công sửa đổi phần tải trọng mà không bị phát hiện, gây ra lỗi về tính toàn vẹn dữ liệu nghiêm trọng.

### Tóm lại

Lỗi về tính toàn vẹn dữ liệu xảy ra khi ứng dụng web tin tưởng dữ liệu mà không kiểm tra tính toàn vẹn của nó. JWT là một giải pháp để bảo vệ tính toàn vẹn dữ liệu, nhưng cần cẩn thận với các lỗ hổng như thuật toán `none`. 


