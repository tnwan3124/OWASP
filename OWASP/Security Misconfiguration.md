## **Cấu hình Bảo mật Không An toàn (Security Misconfiguration)**

Cấu hình Bảo mật Không An toàn là một trong những lỗ hổng phổ biến nhất trong danh sách OWASP Top 10. Đây là một vấn đề đặc biệt vì nó không liên quan đến lỗi trong mã nguồn hay thiết kế ứng dụng, mà là do cấu hình bảo mật không đầy đủ hoặc không chính xác. Ngay cả khi sử dụng phần mềm mới nhất, việc cấu hình không đúng có thể khiến hệ thống dễ bị tấn công.

**Các ví dụ về cấu hình bảo mật không an toàn:**

- Quyền truy cập không được kiểm soát chặt chẽ trên các dịch vụ đám mây (ví dụ: bucket S3 công khai).
- Các tính năng, dịch vụ, trang, tài khoản hoặc đặc quyền không cần thiết được kích hoạt.
- Sử dụng tài khoản mặc định với mật khẩu không được thay đổi.
- Thông báo lỗi quá chi tiết, tiết lộ thông tin nhạy cảm về hệ thống cho kẻ tấn công.
- Không sử dụng các tiêu đề bảo mật HTTP.

**Hậu quả:**

Cấu hình bảo mật không an toàn có thể tạo điều kiện cho các cuộc tấn công khác, như:

- Truy cập trái phép vào dữ liệu nhạy cảm thông qua thông tin đăng nhập mặc định.
- Tấn công XXE (XML External Entity) khai thác việc xử lý không an toàn các thực thể bên ngoài trong XML.
- Tiêm lệnh (Command Injection) trên các trang quản trị do cấu hình không đúng.

**Giao diện Gỡ lỗi (Debugging Interfaces)**

Một ví dụ phổ biến về cấu hình bảo mật không an toàn là việc để lộ các giao diện gỡ lỗi trong môi trường production. Các giao diện này thường được sử dụng trong quá trình phát triển để hỗ trợ việc tìm và sửa lỗi, nhưng nếu không được tắt trước khi đưa ứng dụng vào sản xuất, chúng có thể bị kẻ tấn công khai thác.

**Ví dụ thực tế:**

Vụ tấn công vào Patreon năm 2015 được cho là có liên quan đến việc để lộ một giao diện gỡ lỗi của Werkzeug, một thành phần quan trọng trong các ứng dụng web Python. Giao diện này cung cấp một console Python cho phép thực thi mã tùy ý, tạo điều kiện cho kẻ tấn công kiểm soát hệ thống.

**Phòng ngừa:**

- Thực hiện đánh giá bảo mật thường xuyên để phát hiện các cấu hình không an toàn.
- Tắt hoặc hạn chế truy cập vào các giao diện gỡ lỗi trong môi trường production.
- Sử dụng các công cụ tự động để quét và phát hiện các cấu hình không an toàn.
- Thực hiện quy trình phát triển phần mềm an toàn (SSDLC) để đảm bảo bảo mật ngay từ giai đoạn thiết kế và phát triển.


Ví dụ: khi ta có thể truy cập 1 trang web đang lỗi **Security Misconfiguration** 

![ALT text](<img/12.png>)

Ta có thể thử chạy các lệnh cơ bản

![ALT text](<img/13.png>)