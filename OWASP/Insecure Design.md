## **Thiết kế Không An toàn**

Thiết kế không an toàn đề cập đến các lỗ hổng vốn có trong kiến trúc của ứng dụng. Chúng không phải là các lỗ hổng liên quan đến việc triển khai hoặc cấu hình kém, mà là ý tưởng đằng sau toàn bộ ứng dụng (hoặc một phần của nó) đã bị sai ngay từ đầu. Hầu hết thời gian, những lỗ hổng này xảy ra khi mô hình hóa mối đe dọa không đúng cách được thực hiện trong giai đoạn lập kế hoạch của ứng dụng và lan truyền đến ứng dụng cuối cùng của bạn. Một số lần khác, các lỗ hổng thiết kế không an toàn cũng có thể do các nhà phát triển đưa vào trong khi thêm một số "lối tắt" xung quanh mã để giúp việc kiểm tra của họ dễ dàng hơn. Ví dụ: một nhà phát triển có thể tắt xác thực OTP trong giai đoạn phát triển để nhanh chóng kiểm tra phần còn lại của ứng dụng mà không cần nhập mã theo cách thủ công mỗi lần đăng nhập nhưng quên bật lại nó khi gửi ứng dụng vào sản xuất.

## **Đặt lại Mật khẩu Không An toàn**

Một ví dụ điển hình về các lỗ hổng như vậy đã xảy ra trên Instagram một thời gian trước. Instagram cho phép người dùng đặt lại mật khẩu đã quên bằng cách gửi cho họ mã gồm 6 chữ số đến số điện thoại di động của họ qua SMS để xác thực. Nếu kẻ tấn công muốn truy cập tài khoản của nạn nhân, hắn có thể thử tấn công brute-force mã gồm 6 chữ số. Đúng như dự đoán, điều này không thể thực hiện trực tiếp vì Instagram đã triển khai giới hạn tốc độ để sau 250 lần thử, người dùng sẽ bị chặn không cho thử thêm.

![alt text](<img/10.png>)

Tuy nhiên, người ta phát hiện ra rằng việc giới hạn tốc độ chỉ áp dụng cho các lần thử mã được thực hiện từ cùng một IP. Nếu kẻ tấn công có một số địa chỉ IP khác nhau để gửi yêu cầu, hắn ta có thể thử 250 mã trên mỗi IP. Đối với mã 6 chữ số, bạn có một triệu mã có thể, vì vậy kẻ tấn công sẽ cần 1000000/250 = 4000 IP để bao gồm tất cả các mã có thể. Điều này nghe có vẻ giống như một lượng IP quá lớn để có, nhưng các dịch vụ đám mây giúp bạn dễ dàng có được chúng với chi phí tương đối nhỏ, khiến cuộc tấn công này trở nên khả thi.

![alt text](<img/11.png>)

Lưu ý cách lỗ hổng liên quan đến ý tưởng rằng không có người dùng nào có khả năng sử dụng hàng nghìn địa chỉ IP để đưa ra các yêu cầu đồng thời để thử và tấn công brute-force một mã số. Vấn đề nằm ở thiết kế chứ không phải bản thân việc triển khai ứng dụng.

Vì các lỗ hổng thiết kế không an toàn được đưa vào ở giai đoạn đầu của quá trình phát triển, nên việc giải quyết chúng thường yêu cầu xây dựng lại phần dễ bị tấn công của ứng dụng từ đầu và thường khó thực hiện hơn bất kỳ lỗ hổng liên quan đến mã đơn giản nào khác. Cách tiếp cận tốt nhất để tránh những lỗ hổng như vậy là thực hiện mô hình hóa mối đe dọa ở giai đoạn đầu của vòng đời phát triển. Để biết thêm thông tin về cách triển khai vòng đời phát triển an toàn, hãy nhớ xem phòng SSDLC.