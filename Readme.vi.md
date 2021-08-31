The text below is in Vietnamese (vi-VN):

auto-power - tool tự động chọn giá trị điện cho trâu (rig) để có lợi nhuận cao nhất.

- Tự động OC để chọn được bộ chỉ số có hashrate cao nhất.
- Tự động giám sát khắc phục lỗi do nhiệt độ môi trường thay đổi gây ra, tự động điều chỉnh bộ số OC để tránh lỗi lặp lại những lần sau.
- Tự động điều khiển tốc độ quạt với mục tiêu: An toàn, thận trọng, thông minh, tối ưu, tiên lượng trước khi xuất hiện lỗi để đối phó sớm.
- Tự động điều chỉnh điện theo thời gian thực để vga hoạt động với lợi nhuận cao nhất với nhiệt độ môi trường ngày đêm khác biệt.
- Tự động nhận diện và tự động điều chỉnh OC khi danh sách VGA trong rig bị xáo trộn vị trí PCI, thêm vào hay lấy ra khỏi rig 1 hay nhiều vga để bảo trì.

Tool hiện tại hỗ trợ trên HiveOS, các hệ điều hành khác cần 1 vài thay đổi trong file cấu hình là có thể sử dụng được nhưng chưa test thực tế. Riêng RaveOS hiện tại chưa biết cách để cài đặt tool vào, simple mining khó sử dụng tool này do quyền truy cập vào các chức năng cần thiết của OS bị ngăn cản khắp nơi.
Tool hiện tại mới chỉ hỗ trợ miner là nbminer.
Tool hiện tại mới chỉ hỗ trợ coin là ETH.
Tool hiện tại mới chỉ hỗ trợ NVIDIA VGA.
Tool cần đánh giá xem nhu cầu của các Miners để cân nhắc xem có nên mở rộng hỗ trợ các coin khác, miner khác hay không. Nếu nhiều người quan tâm có thể phát triển 1 OS riêng để tránh phụ thuộc vào HiveOS hay các OS đang có.
DevFee 1%: Mỗi ngày 24h tương đương 14.4 phút devfee, Đủ 60 phút trở lên mới thu. Chỉ thu khi rig phát sinh lỗi cần khắc phục, không thu khi rig đang hoạt động bình thường. Sau khi fix hết lỗi nếu máy chạy cả tháng, cả năm không ngừng cũng sẽ không cắt ngang để thu phí. Lệnh thu phí sẽ kích hoạt khi nào rig phát sinh lỗi, kiểm tra đủ 60 phút trở lên mới thu. Thông tin thu phí xem trong file log trong thư mục /auto-power/logs/. Mọi người có thể cân nhắc dùng thử, bỏ ra 1% devfee để nhận lại được lợi nhuận nhiều hơn nhiều lần 1% devfee thì đó là mối làm ăn có lãi, có thể dùng thử và cân nhắc nếu không muốn có thể ngừng trước khi devfee đủ 60 phút sẽ không bị thu phí. Thậm chí hi sinh 1% devfee để quét được bộ số tối ưu cho rig rồi ngừng sử dụng cũng là 1 con đường sáng. Khi dùng auto-power, nó giúp fix triệt để mọi lỗi giúp VGA chạy bền bỉ hơn, tăng tuổi thọ VGA, đó cũng là lợi ích hiếm có.

Download auto-power tại địa chỉ: https://github.com/ptn611/auto-power-release/releases

Hướng dẫn cài đặt:
Dưới đây toàn bộ hướng dẫn cài đặt và sử dụng lấy HiveOS làm ví dụ:
Sau khi download và giải nén copy file install-auto-power.sh vào ổ đĩa (partition) chứa file config của OS (ví dụ hiveOS là ổ đĩa có tên Hive).
Đây là file chứa tập hợp nhiều lệnh, giống như trên Windows thì đây là file *.bat, *.cmd. Cũng có thể copy chạy từng lệnh tuần tự.
Để chạy file install-auto-power.sh: 
Trước khi chạy file install-auto-power.sh để ý chờ LA < 1 mới nên bắt đầu. LA là chỉ số tải toàn bộ hệ thống, nếu có bất kỳ 1 bộ phận nào đang quá tải thì LA > 1 (chẳng hạn như CPU quá tải, quá nóng hoặc north bridge, VGA, USB/SSD/HDD, ...).
Sau khi LA < 1, tắt watchdog của OS nếu đang bật.
Sau khi LA < 1, watchdog off, Tìm shellinabox hoặc bất cứ 1 app gì tương tự mà OS hỗ trợ trên web để nhập lệnh từ xa. Đối với HiveOS gõ vào:
sudo bash /hive-config/install-auto-power.sh
Sau khi toàn bộ lệnh chạy xong nếu không xuất hiện ngoài ý muốn dotnet core 3.1 LTS runtime đã được cài đặt, thư mục /auto-power trên đó đã được shared full quyền.
Từ Windows truy cập vào thư mục đã được share bằng lệnh \\IP\auto-power (IP là LAN IP có thể tìm thấy trên web quản lý OS)
copy toàn bộ file bên trong thư mục auto-power\ đã giải nén lúc trước vào thư mục đã shared \\IP\auto-power\
Từ HiveOS web tắt autoFan (nếu có) gỡ hết OC trên HiveOS để tránh 2 bên tranh nhau cài đặt OC.
Sau khi đã gỡ autoFan, gỡ OC, tắt watchdog của HiveOS, quay lại shellinabox chạy lệnh: sudo bash /auto-power/set-service.sh để cài đặt tool auto-power khởi động cùng với OS và ngay bây giờ khởi động auto-power.
Có thể tìm file auto-power.runtimeconfig.json để sửa bộ số OC cho phù hợp với rig hiện tại hoặc xuất phát từ bộ số mặc định là 0, chờ khoảng 3 - 5 ngày, 1 bộ số tối ưu nhất sẽ quét xong. Ngoài ra còn nhiều chỉ số khác có thể cài đặt theo hướng dẫn ở phần dưới cùng.

Tài liệu tra cứu:
Dưới đây là giải thích các chỉ số trong file cấu hình auto-power.runtimeconfig.json và các file cấu hình sinh ra trong quá trình chạy auto-power là currentOC.json và currentPowers.json:
- file auto-power.runtimeconfig.json có 1 số chỉ số tự tool thay đổi sẽ lưu lại bên currentOC.json riêng chỉ số điện thay đổi thường xuyên nên lưu lại file riêng currentPowers.json.
- Những chỉ số nào có trong 1 trong 2 file sau, tool sẽ ưu tiên sử dụng nó, những chỉ số không tồn tại ở 2 file sau, tool sẽ sử dụng trong file auto-power.runtimeconfig.json
- Mỗi khi người sử dụng sửa file nào, tool sẽ tải lại chỉ số toàn bộ file đó, chỉ số nào được tool sử dụng vãn theo quy luật ưu tiên sử dụng chỉ số như quy tắc trên.

Các chỉ số trong file auto-power.runtimeconfig.json:
Trong file auto-power.runtimeconfig.json các chỉ số bên ngoài mục "userConfigProperties" đừng đụng vào, điều chỉnh bên trong "userConfigProperties" được giải thích như sau:
- "defaultCoreMHz": [0, 50, 100, 150]: là core clock offset Mhz, các số cách nhau bởi dấu phẩy "," có thể nhiều hơn số lượng VGA cũng có thể ít hơn số lượng VGA, ít nhất là 1 số. Nếu nhiều hơn số lượng VGA, những số sau bị bỏ qua, nếu ít hơn, số nào nhỏ nhất sẽ được sử dụng bổ sung vào cho VGA chưa có số, trường hợp này các VGA thứ 5 trở về sau nhận giá trị 0, trường hợp trong dãy số có số nhỏ hơn 0 có thể xem ví dụ này để suy ra: dãy số [-150, 100, -50, 150] với 6 VGA thì 2 VGA sau thiếu cài đặt sẽ lấy số -50, [-150, 100, -50, 30, 150] thì 1 VGA chưa có số sẽ lấy số 30. Đối với các dãy số của chỉ số khác ở bất kỳ file nào cũng tuân theo quy luật này. Chỉ số này sẽ được copy sang currentOC.json.
- "LockedCoreClock": [0]: Chỉ số này dành cho RTX, nó chính là Absolute Core Clock MHz, khi dùng chỉ số này thì không cần đến "defaultCoreMHz" và "PowerLimitW" ở bên dưới. Ở phiên bản đầu tiên tool đã auto điều chỉnh chỉ số này thay chỉ số power nhưng chưa test thực tế mới chỉ code chay. Chỉ số này sẽ được copy sang currentPowers.json.
- "defaultMemoryMHz":[500]: Chỉ số này là Memory Clock Mhz trong HiveOS. Chỉ số này sẽ được copy sang currentOC.json.
- "PowerLimitW":[80]: Power Limit W trong HiveOS. Chỉ số này sẽ được copy sang currentPowers.json.
- "AutoPowerLimitBool": [true]: Đối với dãy true/false, nếu VGA nào chưa có giá trị, giá trị mặc định sẽ là giá trị của VGA đầu tiên. "AutoPowerLimitBool" để bật tắt VGA nào sẽ tự động điều chỉnh điện. true là bật, false là nhận giá trị power cố định không thay đổi theo thời gian.
- "autoPowerIntervalMin": 4: Mỗi 4 phút sẽ tăng hoặc giảm 1W cho mỗi VGA, tùy vào tình hình cụ thể. Những chỉ số không có cặp [] là giá trị đơn, có cặp [] là dãy số, dãy true/false, hoặc dãy kiểu nào đó thường tương ứng mỗi giá trị trong đó là 1 VGA.
- "minerApiUrl": "http://127.0.0.1:22333/api/v1/status", Thông số này của nbminer, khi hỗ trợ miner khác sẽ thay giá trị khác, hiện tại mới chỉ hỗ trợ nbminer, thay giá trị khác cho miner khác thì miner khác cũng chưa hoạt động được.
- "MinerName": "nbMiner", tương tự chỉ số liền trước, hiện tại thay đổi chưa có tác dụng.
- "refreshSecond": 120, Mỗi 120 giây in ra log file bảng thông tin các chỉ số của tool.
- "extraPowerW": 115, Chỉ số này là công suất ước tính của: tổng công suất rig trừ đi công suất các VGA. Chẳng hạn như lòng mề + quạt 4u, ... Chẳng hạn case 4u NVIDIA VGA có thể tính lòng mề 35W, 4 quạt 1.6A = 1.6A x 12V x 4fans = 35W + 76.8 = 111.8W
- "WriteToLogFile": true, true là có ghi log file, false là không ghi log file.
- "isEffWattMode": false, false là tối ưu điện để mang lại lợi nhuận lớn nhất, true là tối ưu điện để mang lại hiệu quả sử dụng điện tốt nhất, true sử dụng trong trường hợp giá coin xuống thấp, cần tối ưu để giảm thiểu lỗ tiền điện.
- "PowerPriceUSD": 0.14, là giá điện tùy từng quốc gia, từng vùng miền, từng bảng giá. Đơn vị đo là USD/kW.
- "delLogAfterXdays": 3, File log sau mấy ngày tồn tại thì bị xóa?
- "smartAutoFan": [true], Bật tắt từng VGA xem quạt nào sử dụng auto fan, quạt nào không dùng.
- "defaultTargetCoreTemp": [65], Tốc độ quạt sẽ được điều chỉnh để nhiệt độ GPU không bao giờ vượt qua chỉ số này. Chỉ số này sẽ được copy sang currentOC.json.
- "defaultMinFanSpeedPercent": [60], % tốc độ quạt tối thiểu, % tốc độ quạt không bao giờ thấp hơn số này để giữ lượng gió ổn định không những làm mát GPU mà còn để làm mát VRAM, nếu không đủ mát VRAM, chỉ số này sẽ tăng lên bên file currentOC.json.
- "MaxFanSpeedPercent": [90], Chỉ số này tối đa 100%, mặc định 90%. Nếu đặt 100% hoặc gần đó, quạt nóng động cơ, mau khô nhớt, cần bảo trì nhiều. Nếu đặt quá thấp lãng phí năng lực hoạt động của VGA. Cân nhắc giá trị từ 90-95% là hợp lý.
- "autoUpMinFanSpeedWhenErrorMax": [ 80 ], Giá trị này cần nhỏ hơn "MaxFanSpeedPercent", nên để thấp hơn "MaxFanSpeedPercent" 10% để tool có khoảng trống lựa chọn đúng phương án sửa lỗi khi VGA phát sinh lỗi. Chỉ số này đặt giới hạn khi VRAM cần thêm gió thì "defaultMinFanSpeedPercent" sẽ tăng lên không vượt quá chỉ số "autoUpMinFanSpeedWhenErrorMax" này.
- "autoFanIntervalSecond": 10, Mỗi 10 giây sẽ kiểm tra và điều chỉnh tốc độ quạt nếu cần thiết.
- "autoFixRejectShare": [true], Tự sửa lỗi nếu vga gặp lỗi share.
- "autoFixHashrateEqual0": [true], Tự sửa lỗi nếu vga gặp lỗi không có hashrate.
- "autoFixPowerEqual0": [true], tự sửa lỗi nếu vga gặp lỗi giá trị power = 0.
- "autoDownTargetCoreTempWhenError": [true], Cho phép giảm "defaultTargetCoreTemp" nếu trường hợp lỗi cụ thể đó nên giảm "defaultTargetCoreTemp", nếu "defaultTargetCoreTemp" không được cho phép, phương án cho phép khác sẽ thực hiện, nhưng độ chính xác của fix lỗi có thể bị giảm đi.
- "autoDownMemoryMHzWhenError": [true], Cho phép giảm MemoryMHz, cũng tương tự như trên, true là khuyên dùng.
- "autoFixRebootRigAfterMinutes": 5, Cho phép tool có 5 phút để theo dõi lỗi, Sau 5 phút sẽ ra quyết định phương án xử lý và reboot rig nếu cần thiết. Số này càng nhỏ càng kém chính xác, số càng lớn càng lãng phí. Mặc định là 5 phút.
- "autoOcCoreMHz": [11], Giá trị > 0 biểu thị auto OC đang sẵn sàng hoặc đang auto OC, giá trị < 0 biểu thị đã auto OC xong, đang theo dõi để hạ OC nếu cần thiết, trong vòng 24h không phát sinh lỗi sẽ chuyển về giá trị 0. Giá trị 0 biểu thị đã OC xong hoàn toàn không còn lỗi lầm gì. 11 là 1 số nguyên tố, giá trị đơn vị là 1 để dễ dàng đoán xem giá trị cũ đã thay đổi như thế nào. Ví dụ ban đầu giá trị là 110, bây giờ là 198 thì nhìn vào số 8 ở hàng đơn vị sẽ biết được auto OC đã tăng 8 lần. 198 - 8 x 11 = 110 sẽ nhớ lại giá trị ban đầu trước khi auto OC là 110.
- "autoOcMemoryMHz": [61], Tương tự như vậy chỉ số này dùng để auto OC MemoryMHz.
- "StopMinerCmd": ["/hive/bin/miner","stop"], Đây là lệnh để dừng miner trong những trường hợp fix lỗi cần thiết. Tùy vào mỗi OS có từng lệnh riêng, giá trị thấy ở đây là của HiveOS.
- "XidBlackList": [79], là danh sách các mã lỗi phát sinh của VGA, những mã lỗi đưa vào đây thì tool nhìn thấy mã lỗi này sẽ không auto fix. 79 là lỗi: GPU has fallen off the bus, đây là lỗi vật lý lỏng khe PCI tool không xử lý được. Ai thấy lỗi nào khác có thể tự bổ sung vào. Bảng tra mã lỗi: https://docs.google.com/spreadsheets/d/1RFSV59IB7sp-5qwB-mJ7uoMVXfoBYxr4uvqDlPfyVXQ/edit#gid=0 . Trong quá trình tool hoạt động tất cả lỗi VGA phát sinh sẽ in thêm ra 1 file riêng /auto-power/ErrXid.txt để mọi người tiện tra cứu.

Các chỉ số trong file currentOC.json:
Các chỉ số bên file auto-power.runtimeconfig.json có tiền tố default ví dụ defaultCoreMHz khi chuyển sang file currentOC.json sẽ có tiền tố current (CurrentCoreMHz) không cần phải giải thích thêm, các chỉ số có tên giống nhau giữa 2 file cũng không cần phải giải thích thêm. File currentOC.json chỉ được sinh ra sau khi rig phát sinh lỗi đầu tiên hoặc tool cần lưu lại chỉ số. Mặc định là 1h sau mới xuất hiện.
- "UUIDs": là các chuỗi ký tự duy nhất để nhận dạng GPU của NVIDIA, Từ khi NVIDIA ra đời đến nay sẽ không tồn tại 2 VGA có cùng 1 chuỗi số này. Dùng để nhận dạng khi VGA trong 1 rig có sự xáo trộn vị trí PCI, để không OC nhầm bộ chỉ số này cho VGA kia sau mỗi lần sửa chữa, bảo trì rig. Chỉ số này do tool tự lưu lại, không nên động chạm vào.
- "LastAutoOcTime": Chỉ số này cũng do tool tự tạo ra, hiểu là được không nên động vào. Ghi lại thời điểm chỉ số OC của VGA bị thay đổi, để những lần sau tham chiếu vào để ra các quyết định chính xác hơn.
- "AutoOC":[false], Mặc định là false, nếu ở tình trạng false, AutoOC sẽ kiểm tra "LastAutoOcTime" nếu thời điểm sửa giá trị OC của VGA quá 24h sẽ đảo giá trị "AutoOC" về true cho VGA đó để bắt đầu autoOC, sau khi autoOC xong giá trị vẫn giữ true mãi mãi không cần thay đổi. Trường hợp AutoOC không cần thiết để false mà người dùng chuyển ngay sang true khi core, mem đều đặt 0 để quét chọn giá trị mới từ đầu, nếu sử dụng bộ OC cũ đang ổn định nên chọn false mặc định để nghiêm ngặt tuân thủ 24h không lỗi mới bắt đầu autoOC nếu không tool có thể autoOC và fix lỗi sai tùm lum, nếu có lỗi trong vòng 24h tool sẽ fix lỗi và đợi ổn định đủ 24h mới tiến hành autoOC.
- "LastAutoFix0MHs": Đây cũng là 1 dãy thời gian. Số phần tử là số lượng VGA. chỉ số này để tránh trường hợp vòng lặp fix lỗi 0 Mh, Nếu gặp lỗi này mỗi 1h, chỉ thử fix lỗi 1 lần, tránh trường hợp lỗi phần cứng đi fix lỗi phần mềm làm rig khởi động lại liên tục mà không lo làm ăn gì.

Các chỉ số trong file currentPowers.json: file currentPowers.json chỉ xuất hiện sau mặc định là 8 phút, khi power có sự điều chỉnh cần lưu lại chỉ số.
- "PowerLimits": là chỉ số "PowerLimitW" trong file auto-power.runtimeconfig.json
- "LockedCoreClock": chỉ số copy từ file auto-power.runtimeconfig.json
- "UUIDs": giống như "UUIDs" bên file currentOC.json

ErrXid.txt file: 1 dòng trong file ErrXid.txt có dạng:
Aug 27 11:52:10 Worker1 kernel: NVRM: Xid (PCI:0000:06:00): 43, pid=2863, Ch 00000010
Thời điểm lỗi Aug 27 11:52:10, tên rig Worker1, PCI index: 6, mã lỗi: 43. Bảng tra mã lỗi: https://docs.google.com/spreadsheets/d/1RFSV59IB7sp-5qwB-mJ7uoMVXfoBYxr4uvqDlPfyVXQ/edit#gid=0
