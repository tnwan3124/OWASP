## **Thiếu sót trong Ghi nhật ký Bảo mật và Giám sát**

### **Tầm quan trọng của ghi nhật ký**

Khi thiết lập các ứng dụng web, mọi hành động của người dùng nên được ghi lại. Ghi nhật ký quan trọng vì, trong trường hợp xảy ra sự cố, các hoạt động của kẻ tấn công có thể được truy vết. Một khi hành động của chúng được truy vết, rủi ro và tác động của chúng có thể được xác định. Nếu không có nhật ký, sẽ không có cách nào để biết những hành động nào đã được thực hiện bởi kẻ tấn công nếu chúng có được quyền truy cập vào các ứng dụng web cụ thể. Các tác động đáng kể hơn của việc này bao gồm:

- **Thiệt hại về quy định:** Nếu kẻ tấn công có được quyền truy cập vào thông tin nhận dạng cá nhân của người dùng và không có hồ sơ về điều này, người dùng cuối sẽ bị ảnh hưởng và chủ sở hữu ứng dụng có thể bị phạt hoặc các hành động nghiêm khắc hơn tùy thuộc vào quy định.
- **Nguy cơ tấn công tiếp theo:** Sự hiện diện của kẻ tấn công có thể không bị phát hiện nếu không có nhật ký. Điều này có thể cho phép kẻ tấn công khởi động các cuộc tấn công tiếp theo chống lại chủ sở hữu ứng dụng web bằng cách đánh cắp thông tin đăng nhập, tấn công cơ sở hạ tầng và hơn thế nữa.

### **Thông tin trong nhật ký**

Thông tin được lưu trữ trong nhật ký nên bao gồm những điều sau:

- Mã trạng thái HTTP
- Dấu thời gian
- Tên người dùng
- Điểm cuối API/vị trí trang
- Địa chỉ IP

Những nhật ký này có một số thông tin nhạy cảm, vì vậy điều quan trọng là phải đảm bảo rằng chúng được lưu trữ an toàn và nhiều bản sao của những nhật ký này được lưu trữ ở các vị trí khác nhau.

### **Giám sát**

Như bạn có thể đã nhận thấy, ghi nhật ký quan trọng hơn sau khi một vi phạm hoặc sự cố đã xảy ra. Trường hợp lý tưởng là có giám sát để phát hiện bất kỳ hoạt động đáng ngờ nào. Mục đích của việc phát hiện hoạt động đáng ngờ này là để ngăn chặn hoàn toàn kẻ tấn công hoặc giảm tác động mà chúng đã gây ra nếu sự hiện diện của chúng được phát hiện muộn hơn nhiều so với dự đoán. Các ví dụ phổ biến về hoạt động đáng ngờ bao gồm:

- Nhiều lần thử không được phép cho một hành động cụ thể (thường là các lần thử xác thực hoặc truy cập vào các tài nguyên trái phép, ví dụ: trang quản trị)
- Yêu cầu từ các địa chỉ IP hoặc vị trí bất thường: mặc dù điều này có thể cho biết rằng người khác đang cố gắng truy cập vào tài khoản của một người dùng cụ thể, nhưng nó cũng có thể có tỷ lệ dương tính giả.
- Sử dụng các công cụ tự động: các công cụ tự động cụ thể có thể dễ dàng nhận dạng, ví dụ: sử dụng giá trị của tiêu đề User-Agent hoặc tốc độ của các yêu cầu. Điều này có thể cho biết rằng kẻ tấn công đang sử dụng công cụ tự động.
- Các tải trọng phổ biến: trong các ứng dụng web, kẻ tấn công thường sử dụng các tải trọng đã biết. Phát hiện việc sử dụng các tải trọng này có thể cho biết sự hiện diện của ai đó đang tiến hành thử nghiệm trái phép/độc hại trên các ứng dụng.

### **Đánh giá mức độ tác động**

Chỉ phát hiện hoạt động đáng ngờ là không hữu ích. Hoạt động đáng ngờ này cần được đánh giá theo mức độ tác động. Ví dụ, một số hành động sẽ có tác động cao hơn những hành động khác. Những hành động có tác động cao hơn này cần được phản hồi sớm hơn; do đó, chúng nên đưa ra cảnh báo để thu hút sự chú ý của các bên liên quan.