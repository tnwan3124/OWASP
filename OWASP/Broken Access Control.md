## Broken Access Control

**Broken Access Control là gì?**

Là lỗ hổng bảo mật cho phép người dùng trái phép truy cập vào các trang hoặc chức năng bị hạn chế trên website.

**Người truy cập trái phép có thể làm gì?**

* Xem thông tin nhạy cảm của người dùng khác
* Thực hiện các hành động không được phép
* Tái tạo video riêng tư (ví dụ về lỗ hổng trên Youtube năm 2019) 

**Kịch bản tấn công cụ thể:**

Tôi đăng nhập vào ngân hàng của mình với URL là https://bank/account?id=111 với số tiền là 10$. Tuy nhiên, tôi có thể thay đổi id thành 222 trong URL và truy cập vào tài khoản của người khác mà không cần biết tên người dùng hoặc mật khẩu của họ. Điều này chứng tỏ một lỗ hổng kiểm soát truy cập nghiêm trọng, cho phép tôi xem và có thể thao tác với thông tin tài khoản của người khác.

**Hậu quả:**

Hacker có thể chiếm quyền kiểm soát trang web: Nếu khai thác thành công, hacker có thể thực hiện các hành động như quản trị viên, từ thay đổi nội dung trang web đến đánh cắp dữ liệu người dùng.

Rò rỉ thông tin nhạy cảm: Người dùng trái phép có thể xem thông tin cá nhân, tài chính hoặc thông tin bí mật khác.
Thao túng dữ liệu: Kẻ tấn công có thể thay đổi dữ liệu hệ thống, gây ra hậu quả nghiêm trọng cho hoạt động kinh doanh hoặc người dùng.

**Phòng ngừa:**

Thực thi kiểm soát truy cập chặt chẽ: Đảm bảo rằng chỉ những người dùng được ủy quyền mới có thể truy cập vào các tài nguyên và chức năng cụ thể.

Xác thực và phân quyền mạnh mẽ: Sử dụng các cơ chế xác thực và phân quyền mạnh mẽ để xác minh danh tính người dùng và cấp quyền truy cập phù hợp.

Kiểm tra bảo mật thường xuyên: Thực hiện kiểm tra bảo mật thường xuyên để xác định và khắc phục các lỗ hổng kiểm soát truy cập tiềm ẩn.

Áp dụng nguyên tắc ít đặc quyền: Cấp cho người dùng mức truy cập tối thiểu cần thiết để thực hiện công việc của họ.
