
**Lỗi Mã hóa (Cryptographic Failures)**

Lỗi mã hóa là bất kỳ lỗ hổng nào phát sinh từ việc sử dụng không đúng cách hoặc không sử dụng các thuật toán mã hóa để bảo vệ thông tin nhạy cảm. Các ứng dụng web hiện đại cần mã hóa để đảm bảo tính bảo mật cho người dùng ở nhiều cấp độ.

**Ví dụ điển hình: Ứng dụng email bảo mật**

* **Mã hóa dữ liệu đang truyền:** Khi bạn truy cập email qua trình duyệt, thông tin liên lạc giữa bạn và máy chủ cần được mã hóa để ngăn chặn kẻ nghe lén đánh cắp nội dung email của bạn.
* **Mã hóa dữ liệu đang lưu trữ:** Email của bạn được lưu trữ trên máy chủ của nhà cung cấp. Mã hóa dữ liệu khi lưu trữ giúp đảm bảo rằng ngay cả nhà cung cấp cũng không thể đọc được email của bạn.

**Hậu quả của lỗi mã hóa**

* **Lộ dữ liệu nhạy cảm:** Lỗi mã hóa có thể dẫn đến việc vô tình tiết lộ thông tin cá nhân của khách hàng (tên, ngày sinh, thông tin tài chính) hoặc thông tin kỹ thuật (tên người dùng, mật khẩu).
* **Tấn công Man-in-the-Middle (MitM):** Kẻ tấn công có thể chặn kết nối của người dùng, lợi dụng mã hóa yếu hoặc không có mã hóa để truy cập thông tin đang được truyền.
* **Lỗ hổng đơn giản:** Đôi khi, dữ liệu nhạy cảm có thể bị lộ trực tiếp trên máy chủ web do cấu hình sai hoặc các lỗi sơ đẳng khác.

**Ví dụ về lưu trữ dữ liệu lớn trong cơ sở dữ liệu**

* Cơ sở dữ liệu là cách phổ biến để lưu trữ và truy cập một lượng lớn dữ liệu từ nhiều vị trí, phù hợp cho các ứng dụng web.
* Cơ sở dữ liệu tệp phẳng (flat-file database) được lưu trữ dưới dạng một tệp duy nhất trên máy tính, thường thấy trong các ứng dụng web nhỏ hơn.
* Nếu cơ sở dữ liệu tệp phẳng được lưu trữ bên dưới thư mục gốc của trang web, nó có thể bị tải xuống và truy vấn, dẫn đến việc tiết lộ dữ liệu nhạy cảm.
* SQLite là một định dạng phổ biến của cơ sở dữ liệu tệp phẳng, có thể được truy vấn bằng công cụ sqlite3.

## Ví dụ
![alt text](<Screenshot 2024-08-23 123541.png>)
ta có trang web như này và thử kiểm tra source của web xem có gì bất thường
![alt text](<Screenshot 2024-08-23 123621.png>)
Ta có thể thấy có id=login và ta có thể truy cập thử
![alt text](<Screenshot 2024-08-23 123652-1.png>)
Bây giờ ta lại phát hiện thêm 1 thư mục có tên là /assets, và kiểm tra xem thư mục này có gì
![alt text](<Screenshot 2024-08-23 123746-1.png>)
Có 1 thư mục database trong này hãy thử tải và xem trong đây có gì  
![alt text](<Screenshot 2024-08-23 123907-1.png>)
Thử dùng công cụ sqlite3 xem trong đây có gì
![alt text](<Screenshot 2024-08-23 123945-1.png>)
Có 2 thư mục là sessions và users, ta kiểm tra các cột của users có gì
![alt text](<Screenshot 2024-08-23 124127-1.png>)
Vậy ta đã có tài khoảng admin và đăng nhập thử
![alt text](<Screenshot 2024-08-23 124215-1.png>)