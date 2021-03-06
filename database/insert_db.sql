ALTER TABLE orders
MODIFY COLUMN description TEXT;

insert into role(code,name) values('ADMIN','Quản trị');
insert into role(code,name) values('USER','Người dùng');

insert into user(username,password,fullname,status, phone, email)
values('admin','$2a$10$/RUbuT9KIqk6f8enaTQiLOXzhnUkiwEJRdtzdrMXXwU7dgnLKTCYG','Cong Thoai',1, '0983583845', '16521191@gm.uit.edu.vn');
insert into user(username,password,fullname,status, phone, email)
values('user','$2a$10$/RUbuT9KIqk6f8enaTQiLOXzhnUkiwEJRdtzdrMXXwU7dgnLKTCYG','Người dùng 1',1, '0983583845', '16521191@gm.uit.edu.vn');
insert into user(username,password,fullname,status, phone, email)
values('congthoai','$2a$10$/RUbuT9KIqk6f8enaTQiLOXzhnUkiwEJRdtzdrMXXwU7dgnLKTCYG','Công Thoại',1, '0983583845', '16521191@gm.uit.edu.vn');

INSERT INTO user_role(userid,roleid) VALUES (1,1);
INSERT INTO user_role(userid,roleid) VALUES (2,2);
INSERT INTO user_role(userid,roleid) VALUES (3,2);

INSERT INTO item (name, code) VALUES("BĂNG RÔN", "bang-ron");
INSERT INTO item (name, code) VALUES("BẢNG HIỆU", "bang-hieu");
INSERT INTO item (name, code) VALUES("BẢNG HIỆU BẠT DÀY", "bang-hieu-bat-day");
INSERT INTO item (name, code) VALUES("DECAL", "decal");
INSERT INTO item (name, code) VALUES("DECAL BẾ", "decal-be");
INSERT INTO item (name, code) VALUES("DECAL CÁN BÓNG", "decal-can-bong");
INSERT INTO item (name, code) VALUES("DECAL CÁN BÓNG BẾ", "decal-can-bong-be");
INSERT INTO item (name, code) VALUES("DECAL TRONG", "decal-trong");
INSERT INTO item (name, code) VALUES("DECAL TRONG BẾ", "decal-trong-be");
INSERT INTO item (name, code) VALUES("DECAL TRONG CÁN BÓNG", "decal-trong-can-bong");
INSERT INTO item (name, code) VALUES("DECAL TRONG CÁN BÓNG BẾ", "decal-trong-can-bong-be");
INSERT INTO item (name, code) VALUES("DECAL TRONG CÁN TRẮNG", "decal-trong-can-trang");
INSERT INTO item (name, code) VALUES("PP", "pp");
INSERT INTO item (name, code) VALUES("PP CÁN BÓNG", "pp-can-bong");
INSERT INTO item (name, code) VALUES("BẠT TRẮNG", "bat-trang");
INSERT INTO item (name, code) VALUES("DECAL TRẮNG", "decal-trang");
INSERT INTO item (name, code) VALUES("MÀNG BÓNG", "mang-bong");
INSERT INTO item (name, code) VALUES("CẮT DECAL", "cat-decal");
INSERT INTO item (name, code) VALUES("BẠT XÁM", "bat-xam");
INSERT INTO item (name, code) VALUES("BẠT MÁI CHE", "bat-mai-che");
INSERT INTO item (name, code) VALUES("DECAL THÁNH GIÁ", "decal-thanh-gia");
INSERT INTO item (name, code) VALUES("1 HỘP CARD", "1-hop-card");
INSERT INTO item (name, code) VALUES("2 HỘP CARD", "2-hop-card");
INSERT INTO item (name, code) VALUES("5 HỘP CARD", "5-hop-card");
INSERT INTO item (name, code) VALUES("BẢNG HIỆU IN MÁY NHỎ", "bang-hieu-in-may-nho");
INSERT INTO item (name, code) VALUES("DECAL CÁN BÓNG TỐT", "decal-can-bong-tot");
INSERT INTO item (name, code) VALUES("TEM LỚN", "tem-lon");
INSERT INTO item (name, code) VALUES("TEM NHỎ", "tem-nho");
INSERT INTO item (name, code) VALUES("NHÃN OFFSET", "nhan-offset");
INSERT INTO item (name, code) VALUES("IN VẢI SILK", "in-vai-silk");
INSERT INTO item (name, code) VALUES("CẮT DECAL CÁN BÓNG", "cat-decal-can-bong");
INSERT INTO item (name, code) VALUES("5 CUỐN HÓA ĐƠN", "5-cuon-hoa-don");
INSERT INTO item (name, code) VALUES("CẮT DECAL GIA CÔNG", "cat-decal-gia-cong");
INSERT INTO item (name, code) VALUES("RỬA HÌNH", "rua-hinh");


INSERT INTO customertype(name, code) VALUES("Đặc biệt", "dac-biet");
INSERT INTO customertype(name, code) VALUES("VIP 23-33", "vip-23-33");
INSERT INTO customertype(name, code) VALUES("VIP 23", "vip-23");
INSERT INTO customertype(name, code) VALUES("VIP 20", "vip-20");
INSERT INTO customertype(name, code) VALUES("VIP 27", "vip-27");
INSERT INTO customertype(name, code) VALUES("Thân thiết", "than-thiet");
INSERT INTO customertype(name, code) VALUES("Khách lẻ", "khach-le");
INSERT INTO customertype(name, code) VALUES("Trại hòm", "trai-hom");
INSERT INTO customertype(name, code) VALUES("Thân thiết 25", "than-thiet-25");
INSERT INTO customertype(name, code) VALUES("Lúa giống", "lua-giong");
INSERT INTO customertype(name, code) VALUES("VỎ LÃI", "vo-lai");
INSERT INTO customertype(name, code) VALUES("Chả lụa", "cha-lua");

-- XX

INSERT INTO pricelist(item_id, customertype_id, price) VALUES(2,4,25000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(1,4,20000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(18,1,50000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(17,1,12000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(16,1,19000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(15,1,12000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(14,1,60000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(13,1,40000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(12,1,70000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(11,1,90000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(10,1,60000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(9,1,70000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(8,1,40000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(7,1,90000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(6,1,60000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(5,1,70000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(4,1,40000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(3,1,25000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(2,1,19000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(1,1,19000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(3,4,30000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(4,4,45000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(5,4,70000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(6,4,60000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(7,4,90000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(8,4,45000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(9,4,70000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(10,4,60000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(11,4,90000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(12,4,70000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(13,4,45000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(14,4,60000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(15,4,12000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(16,4,20000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(17,4,12000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(18,4,50000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(1,3,23000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(2,3,23000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(3,3,30000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(4,3,45000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(5,3,70000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(6,3,60000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(7,3,80000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(8,3,45000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(9,3,70000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(10,3,60000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(11,3,80000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(12,3,70000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(13,3,45000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(14,3,60000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(15,3,12000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(16,3,19000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(17,3,12000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(18,3,50000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(19,3,20000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(1,2,23000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(2,2,23000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(3,2,33000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(4,2,45000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(5,2,70000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(6,2,65000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(7,2,90000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(8,2,45000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(9,2,70000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(10,2,65000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(11,2,90000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(12,2,80000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(13,2,45000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(14,2,65000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(15,2,12000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(16,2,20000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(17,2,12000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(18,2,50000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(19,2,15000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(1,5,27000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(2,5,27000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(3,5,37000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(4,5,50000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(5,5,80000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(6,5,70000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(7,5,100000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(8,5,50000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(9,5,80000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(10,5,70000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(11,5,100000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(12,5,80000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(13,5,50000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(14,5,70000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(15,5,15000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(16,5,20000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(17,5,12000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(18,5,50000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(19,5,20000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(1,6,30000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(2,6,30000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(3,6,40000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(4,6,50000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(5,6,70000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(6,6,70000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(7,6,90000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(8,6,50000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(9,6,70000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(10,6,70000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(11,6,90000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(12,6,80000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(13,6,50000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(14,6,70000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(15,6,15000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(16,6,20000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(17,6,12000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(18,6,60000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(19,6,20000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(1,7,35000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(2,7,35000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(3,7,45000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(4,7,60000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(5,7,90000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(6,7,80000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(7,7,110000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(8,7,60000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(9,7,90000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(10,7,80000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(11,7,110000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(12,7,90000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(13,7,60000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(14,7,80000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(15,7,17000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(16,7,25000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(17,7,15000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(18,7,70000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(19,7,25000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(1,8,35000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(2,8,40000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(3,8,50000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(4,8,60000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(5,8,90000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(6,8,80000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(7,8,110000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(8,8,60000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(9,8,90000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(10,8,80000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(11,8,110000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(12,8,90000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(13,8,60000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(14,8,80000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(15,8,20000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(16,8,25000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(17,8,15000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(18,8,60000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(19,8,25000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(1,9,25000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(2,9,25000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(3,9,33000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(4,9,50000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(5,9,80000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(6,9,70000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(7,9,100000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(8,9,50000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(9,9,80000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(10,9,70000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(11,9,100000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(12,9,80000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(13,9,50000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(14,9,70000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(15,9,15000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(16,9,25000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(17,9,12000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(18,9,60000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(19,9,20000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(20,3,60000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(20,2,70000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(20,5,70000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(20,6,70000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(20,7,80000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(20,8,80000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(21,8,10000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(22,6,50000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(23,6,150000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(24,6,250000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(25,3,35000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(26,3,66000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(22,7,80000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(23,7,150000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(24,7,250000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(28,7,300);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(27,7,450);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(5,10,90000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(29,6,4600000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(30,6,50000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(7,11,100000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(31,11,120000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(4,11,60000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(6,11,80000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(32,11,20000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(20,1,60000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(22,2,50000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(20,11,80000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(5,12,70000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(33,7,40000);
INSERT INTO pricelist(item_id, customertype_id, price) VALUES(34,7,5000);

-- XX

INSERT INTO customer(code, name, customertype_id) VALUES("KH200826235330","A CHÍ CỜ ĐỎ",4);
INSERT INTO customer(code, name, customertype_id) VALUES("KH200826235349","A ĐĂNG TÂN HIỆP",2);
INSERT INTO customer(code, name, customertype_id) VALUES("KH200826235400","A HOÀI",6);
INSERT INTO customer(code, name, customertype_id) VALUES("KH200826235410","A HOÀN THẠNH THẮNG",6);
INSERT INTO customer(code, name, customertype_id) VALUES("KH200826235415","A KHOA",6);
INSERT INTO customer(code, name, customertype_id) VALUES("KH200826235419","A LONG",6);
INSERT INTO customer(code, name, customertype_id) VALUES("KH200826235430","A NAM",6);
INSERT INTO customer(code, name, customertype_id) VALUES("KH200826235447","A NGUYÊN TÂN HIỆP",7);
INSERT INTO customer(code, name, customertype_id) VALUES("KH200826235511","A TÂM",6);
INSERT INTO customer(code, name, customertype_id) VALUES("KH200826235519","A THÉP",7);
INSERT INTO customer(code, name, customertype_id) VALUES("KH200826235523","A THƯƠNG",7);
INSERT INTO customer(code, name, customertype_id) VALUES("KH200826235527","BV",7);
INSERT INTO customer(code, name, customertype_id) VALUES("KH200826235539","CÔ TÂM PGD",8);
INSERT INTO customer(code, name, customertype_id) VALUES("KH200826235544","CÔNG THỨC",8);
INSERT INTO customer(code, name, customertype_id) VALUES("KH200826235559","CPA",3);
INSERT INTO customer(code, name, customertype_id) VALUES("KH200826235601","CTY TẤN HƯNG",3);
INSERT INTO customer(code, name, customertype_id) VALUES("KH200826235607","CTY TÂN THÀNH",3);
INSERT INTO customer(code, name, customertype_id) VALUES("KH200826235616","CTY VĨNH KIM",1);
INSERT INTO customer(code, name, customertype_id) VALUES("KH200826235620","CHỊ HẠNH",6);
INSERT INTO customer(code, name, customertype_id) VALUES("KH200826235630","CHỊ TÂM",3);
INSERT INTO customer(code, name, customertype_id) VALUES("KH200826235634","CHỊ TRINH_TT THẠNH AN",7);
INSERT INTO customer(code, name, customertype_id) VALUES("KH200826235645","CHÚ DUYÊN",5);
INSERT INTO customer(code, name, customertype_id) VALUES("KH200826235655","DECAL PHƯƠNG",6);
INSERT INTO customer(code, name, customertype_id) VALUES("KH200826235658","DUY TÂN",8);
INSERT INTO customer(code, name, customertype_id) VALUES("KH200826235707","ĐÔNG Á",7);
INSERT INTO customer(code, name, customertype_id) VALUES("KH200826235710","ĐỨC LIÊN",3);
INSERT INTO customer(code, name, customertype_id) VALUES("KH200826235729","ĐỨC TIẾN",8);
INSERT INTO customer(code, name, customertype_id) VALUES("KH200826235731","HẢI HÀ",8);
INSERT INTO customer(code, name, customertype_id) VALUES("KH200826235736","HOAN",6);
INSERT INTO customer(code, name, customertype_id) VALUES("KH200826235738","HOÀNG ĐĂNG",8);
INSERT INTO customer(code, name, customertype_id) VALUES("KH200826235751","HOÀNG LONG",5);
INSERT INTO customer(code, name, customertype_id) VALUES("KH200826235754","HUYỆN ĐOÀN",7);
INSERT INTO customer(code, name, customertype_id) VALUES("KH200826235806","HỮU NGHĨA",8);
INSERT INTO customer(code, name, customertype_id) VALUES("KH200826235816","KIM LÂM",8);
INSERT INTO customer(code, name, customertype_id) VALUES("KH200826235824","KHÁCH",7);
INSERT INTO customer(code, name, customertype_id) VALUES("KH200826235836","KHÁNH THY",6);
INSERT INTO customer(code, name, customertype_id) VALUES("KH200826235839","KHOA",1);
INSERT INTO customer(code, name, customertype_id) VALUES("KH200826235841","LÚA GIỐNG THÁI BÌNH",10);
INSERT INTO customer(code, name, customertype_id) VALUES("KH200826235855","MN TT THẠNH AN",7);
INSERT INTO customer(code, name, customertype_id) VALUES("KH200826235900","MN TT THẠNH AN 1",7);
INSERT INTO customer(code, name, customertype_id) VALUES("KH200826235905","MN THẠNH AN 1",7);
INSERT INTO customer(code, name, customertype_id) VALUES("KH200826235913","MN THẠNH AN 2",7);
INSERT INTO customer(code, name, customertype_id) VALUES("KH200826235917","MN THẠNH LỢI 1",7);
INSERT INTO customer(code, name, customertype_id) VALUES("KH200826235920","MN THẠNH LỢI 2",7);
INSERT INTO customer(code, name, customertype_id) VALUES("KH200826235925","MN THẠNH TIẾN",7);
INSERT INTO customer(code, name, customertype_id) VALUES("KH200826235942","MN THẠNH THẮNG 1",7);
INSERT INTO customer(code, name, customertype_id) VALUES("KH200826235952","MN THẠNH THẮNG 2",7);
INSERT INTO customer(code, name, customertype_id) VALUES("KH200826235956","MTK",3);
INSERT INTO customer(code, name, customertype_id) VALUES("KH200826235958","NGHI",7);
INSERT INTO customer(code, name, customertype_id) VALUES("KH200827000007","NGỌC LIÊN",7);
INSERT INTO customer(code, name, customertype_id) VALUES("KH200827000012","QC MINH CHIẾN",5);
INSERT INTO customer(code, name, customertype_id) VALUES("KH200827000016","TTVH",5);
INSERT INTO customer(code, name, customertype_id) VALUES("KH200827000027","TH TT THẠNH AN 1",7);
INSERT INTO customer(code, name, customertype_id) VALUES("KH200827000037","TH THẠNH AN 3",7);
INSERT INTO customer(code, name, customertype_id) VALUES("KH200827000054","TH THẠNH TIẾN 1",7);
INSERT INTO customer(code, name, customertype_id) VALUES("KH200827000058","TH THẠNH THẮNG 1",7);
INSERT INTO customer(code, name, customertype_id) VALUES("KH200827000101","TH THẠNH THẮNG 2",7);
INSERT INTO customer(code, name, customertype_id) VALUES("KH200827000106","THẦY CHUYÊN",5);
INSERT INTO customer(code, name, customertype_id) VALUES("KH200827000114","THẦY PHONG_THCS TT THẠNH AN",7);
INSERT INTO customer(code, name, customertype_id) VALUES("KH200827000121","THCS TT THẠNH AN 1",7);
INSERT INTO customer(code, name, customertype_id) VALUES("KH200827000134","THCS TT VĨNH THẠNH",9);
INSERT INTO customer(code, name, customertype_id) VALUES("KH200827000141","THCS THẠNH AN",7);
INSERT INTO customer(code, name, customertype_id) VALUES("KH200827000152","THCS THẠNH LỢI",7);
INSERT INTO customer(code, name, customertype_id) VALUES("KH200827000156","THCS THẠNH TIẾN",7);
INSERT INTO customer(code, name, customertype_id) VALUES("KH200827000207","THỊ ĐOÀN THẠNH AN",7);
INSERT INTO customer(code, name, customertype_id) VALUES("KH200827000215","THPT THẠNH AN",7);
INSERT INTO customer(code, name, customertype_id) VALUES("KH200827000225","THPT THẠNH THẮNG",7);
INSERT INTO customer(code, name, customertype_id) VALUES("KH200827000232","TRANG ĐÀI",6);
INSERT INTO customer(code, name, customertype_id) VALUES("KH200827000242","TRẦN KIỆT",2);
INSERT INTO customer(code, name, customertype_id) VALUES("KH200827000245","TRƯỜNG AN",5);
INSERT INTO customer(code, name, customertype_id) VALUES("KH200827000254","TRƯỜNG THỌ",8);
INSERT INTO customer(code, name, customertype_id) VALUES("KH200827000257","UBND XÃ THẠNH LỢI",7);
INSERT INTO customer(code, name, customertype_id) VALUES("KH200827000312","VẠN PHÚC",8);
INSERT INTO customer(code, name, customertype_id) VALUES("KH200827000320","VIETTEL",9);
INSERT INTO customer(code, name, customertype_id) VALUES("KH200827000323","VINAPHONE",9);
INSERT INTO customer(code, name, customertype_id) VALUES("KH200827000336","XÃ THẠNH AN",6);
INSERT INTO customer(code, name, customertype_id) VALUES("KH200827000346","XÃ THẠNH LỢI",7);
INSERT INTO customer(code, name, customertype_id) VALUES("KH200827000351","XÃ THẠNH QUỚI",6);
INSERT INTO customer(code, name, customertype_id) VALUES("KH200827000356","XÃ THẠNH TIẾN",6);
INSERT INTO customer(code, name, customertype_id) VALUES("KH200827000406","XUÂN PHONG",9);
INSERT INTO customer(code, name, customertype_id) VALUES("KH200828153302","CÔNG TÂN",8);
INSERT INTO customer(code, name, customertype_id) VALUES("KH200829173412","QUANG TUẤN",8);
INSERT INTO customer(code, name, customertype_id) VALUES("KH200916092702","SALON CHÂU",7);
INSERT INTO customer(code, name, customertype_id) VALUES("KH200921103306","THPT VĨNH THẠNH",7);
INSERT INTO customer(code, name, customertype_id) VALUES("KH201001082005","HOÀNG VÂN_SÓC TRĂNG",6);
INSERT INTO customer(code, name, customertype_id) VALUES("KH201001111907","ĐẠI",6);
INSERT INTO customer(code, name, customertype_id) VALUES("KH201006112811","VĂN HẢO",11);
INSERT INTO customer(code, name, customertype_id) VALUES("KH201014105044","CHỊ XUYẾN",7);
INSERT INTO customer(code, name, customertype_id) VALUES("KH201015155901","TRUNG TÍNH",11);
INSERT INTO customer(code, name, customertype_id) VALUES("KH201023105459","CHẢ LỤA KIM NGÂN",12);
INSERT INTO customer(code, name, customertype_id) VALUES("KH201110223132","XÃ THẠNH TRỊ (CHÚ THANH)",7);
INSERT INTO customer(code, name, customertype_id) VALUES("KH201116221806","MN TT VĨNH THẠNH",7);
INSERT INTO customer(code, name, customertype_id) VALUES("KH201204234000","TH VĨNH BÌNH 2",7);
INSERT INTO customer(code, name, customertype_id) VALUES("KH201221102849","TÍN",1);



INSERT INTO material(name, code, size, width) VALUES("Mực vàng ECO Singapore", "muc-vang-eco-singapore", 1,1);
INSERT INTO material(name, code, size, width) VALUES("Màng bóng tốt 1.27m x 50m", "mang-bong-tot-1-27m-x-50m", 1.27,50);
INSERT INTO material(name, code, size, width) VALUES("Decal đế đen 1.52m x 50m", "decal-de-den-1-52m-x-50m", 1.52,50);
INSERT INTO material(name, code, size, width) VALUES("Màng bóng 1.27m x 50m", "mang-bong-1-27m-x-50m", 1.27,50);
INSERT INTO material(name, code, size, width) VALUES("Giấy lót đầu phun", "giay-lot-dau-phun", 0,0);
INSERT INTO material(name, code, size, width) VALUES("Màng bóng 1.07m x 50m", "mang-bong-1-07m-x-50m", 1.07,50);
INSERT INTO material(name, code, size, width) VALUES("Decal đế đen 1.27m x 50m", "decal-de-den-1-27m-x-50m", 1.27,50);
INSERT INTO material(name, code, size, width) VALUES("Decal trắng 1.27m x 50m", "decal-trang-1-27m-x-50m", 1.27,50);
INSERT INTO material(name, code, size, width) VALUES("Decal trong 1.52m x 50m", "decal-trong-1-52m-x-50m", 1.52,50);
INSERT INTO material(name, code, size, width) VALUES("Bạt thường 3.2m x 80m", "bat-thuong-3-2m-x-80m", 3.2,80);
INSERT INTO material(name, code, size, width) VALUES("Bạt xám 3.2m x 70m", "bat-xam-3-2m-x-70m", 3.2,70);
INSERT INTO material(name, code, size, width) VALUES("Bạt thường 3.0m x 80m", "bat-thuong-3-0m-x-80m", 3,80);
INSERT INTO material(name, code, size, width) VALUES("Bạt thường 2.8m x 80m", "bat-thuong-2-8m-x-80m", 2.8,80);
INSERT INTO material(name, code, size, width) VALUES("Bạt thường 2.6m x 80m", "bat-thuong-2-6m-x-80m", 2.6,80);
INSERT INTO material(name, code, size, width) VALUES("Bạt dày 3.2m x 80m", "bat-day-3-2m-x-80m", 3.2,80);
INSERT INTO material(name, code, size, width) VALUES("Bạt thường 2.2m x 80m", "bat-thuong-2-2m-x-80m", 2.2,80);
INSERT INTO material(name, code, size, width) VALUES("Bạt dày 3.2m x 70m", "bat-day-3-2m-x-70m", 3.2,70);
INSERT INTO material(name, code, size, width) VALUES("Màng bóng tốt 1.52m x 50m", "mang-bong-tot-1-52m-x-50m", 1.52,50);
INSERT INTO material(name, code, size, width) VALUES("Mực xanh SK9", "muc-xanh-sk9", 1,1);
INSERT INTO material(name, code, size, width) VALUES("Mực xanh ECO Singapore", "muc-xanh-eco-singapore", 1,1);
INSERT INTO material(name, code, size, width) VALUES("Mực đen ECO Singapore", "muc-den-eco-singapore", 1,1);
INSERT INTO material(name, code, size, width) VALUES("Màng bóng 1.52m x 50m", "mang-bong-1-52m-x-50m", 1.52,50);
INSERT INTO material(name, code, size, width) VALUES("Decal đế đen 1.07m x 50m", "decal-de-den-1-07m-x-50m", 1.07,50);
INSERT INTO material(name, code, size, width) VALUES("Decal trắng 1.52m x 50m", "decal-trang-1-52m-x-50m", 1.52,50);
INSERT INTO material(name, code, size, width) VALUES("Decal trắng 1.07m x 50m", "decal-trang-1-07m-x-50m", 1.07,50);
INSERT INTO material(name, code, size, width) VALUES("Decal trong 1.27m x 50m", "decal-trong-1-27m-x-50m", 1.27,50);
INSERT INTO material(name, code, size, width) VALUES("Decal trong 1.07m x 50m", "decal-trong-1-07m-x-50m", 1.07,50);
INSERT INTO material(name, code, size, width) VALUES("Bạt xám 3.2m x 80m", "bat-xam-3-2m-x-80m", 3.2,80);
INSERT INTO material(name, code, size, width) VALUES("Mực vàng SK9", "muc-vang-sk9", 1,1);
INSERT INTO material(name, code, size, width) VALUES("Nước rửa máy lớn", "nuoc-rua-may-lon", 1,1);
INSERT INTO material(name, code, size, width) VALUES("Mực đỏ SK7", "muc-do-sk7", 1,1);
INSERT INTO material(name, code, size, width) VALUES("Mực đỏ ECO Singapore", "muc-do-eco-singapore", 1,1);
INSERT INTO material(name, code, size, width) VALUES("Mực đen SK7", "muc-den-sk7", 1,1);
INSERT INTO material(name, code, size, width) VALUES("Que chùi đầu phun", "que-chui-dau-phun", 1,1);
INSERT INTO material(name, code, size, width) VALUES("Nước rửa máy nhỏ", "nuoc-rua-may-nho", 1,1);
INSERT INTO material(name, code, size, width) VALUES("VAT", "vat", 1,1);
INSERT INTO material(name, code, size, width) VALUES("PP 1.27m x 50m", "pp-1-27m-x-50m", 1.27,50);
INSERT INTO material(name, code, size, width) VALUES("PP 1.07m x 50m", "pp-1-07m-x-50m", 1.07,50);
INSERT INTO material(name, code, size, width) VALUES("PP 0.914m x 50m", "pp-0-914m-x-50m", 0.914,50);
INSERT INTO material(name, code, size, width) VALUES("Máy cán màng", "may-can-mang", 1,1);
INSERT INTO material(name, code, size, width) VALUES("Bạt mái che Hàn Quốc", "bat-mai-che-han-quoc", 1.52,80);

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('1', 'anonymousUser', '2020-12-28 22:05:17', '20-12-28 10:05:17 Don hang duoc tao.&#13;', 'admin', '2020-12-29 18:35:45', '0.0609094', 'DH000D201228100517', 'note 1', null, '45000', '0.26147', '0', null, '45000', '1', 'unpaid', '45000', '0.23295', '1', '4');
INSERT INTO `orders` VALUES ('2', 'anonymousUser', '2020-12-28 22:05:27', '20-12-28 10:05:27 Don hang duoc tao.&#13;', 'anonymousUser', '2020-12-28 22:05:27', '0.121819', 'DH001D201228100527', 'note 2', null, '140000', '0.26147', '0', null, '70000', '2', 'unpaid', '140000', '0.23295', '2', '5');
INSERT INTO `orders` VALUES ('3', 'anonymousUser', '2020-12-28 22:05:32', '20-12-28 10:05:32 Don hang duoc tao.&#13;', 'anonymousUser', '2020-12-28 22:05:32', '0.182728', 'DH002D201228100532', 'note 2', null, '210000', '0.26147', '0', null, '70000', '3', 'unpaid', '210000', '0.23295', '2', '5');
INSERT INTO `orders` VALUES ('4', 'anonymousUser', '2020-12-28 22:05:43', '20-12-28 10:05:43 Don hang duoc tao.&#13;', 'anonymousUser', '2020-12-28 22:05:43', '0.182728', 'DH003D201228100543', 'note 4', null, '150000', '0.26147', '0', null, '50000', '3', 'unpaid', '150000', '0.23295', '6', '8');
INSERT INTO `orders` VALUES ('5', 'anonymousUser', '2020-12-28 22:05:49', '20-12-28 10:05:49 Don hang duoc tao.&#13;', 'anonymousUser', '2020-12-28 22:05:49', '0.182728', 'DH004D201228100549', 'note 5', null, '180000', '0.26147', '0', null, '60000', '3', 'unpaid', '180000', '0.23295', '11', '8');
INSERT INTO `orders` VALUES ('6', 'anonymousUser', '2020-12-28 22:05:55', '20-12-28 10:05:55 Don hang duoc tao.&#13;20-12-28 10:06:53 Thanh toan 1 phan: 5000 vnd.&#13;20-12-28 10:06:58 Thanh toan xong.&#13;', 'admin', '2020-12-28 22:06:58', '0.182728', 'DH005D201228100555', 'note 5', null, '0', '0.26147', '75000', '2020-12-28 22:06:58', '25000', '3', 'paid', '75000', '0.23295', '11', '19');

INSERT INTO `orders` VALUES (null, 'anonymousUser', '2020-12-31 22:05:55', '20-12-28 10:05:55 Don hang duoc tao.&#13;20-12-28 10:06:53 Thanh toan 1 phan: 5000 vnd.&#13;20-12-28 10:06:58 Thanh toan xong.&#13;', 'admin', '2020-12-28 22:06:58', '0.182728', 'DH005D201228100555', 'note 5', null, '0', '0.26147', '75000', '2020-12-28 22:06:58', '25000', '3', 'paid', '75000', '0.23295', '11', '19');
INSERT INTO `orders` VALUES (null, 'anonymousUser', '2020-12-31 22:05:55', '20-12-28 10:05:55 Don hang duoc tao.&#13;20-12-28 10:06:53 Thanh toan 1 phan: 5000 vnd.&#13;20-12-28 10:06:58 Thanh toan xong.&#13;', 'admin', '2020-12-28 22:06:58', '0.182728', 'DH005D201228100555', 'note 5', null, '0', '0.26147', '75000', '2020-12-28 22:06:58', '25000', '3', 'paid', '75000', '0.23295', '11', '19');
INSERT INTO `orders` VALUES (null, 'anonymousUser', '2020-12-31 22:05:55', '20-12-28 10:05:55 Don hang duoc tao.&#13;20-12-28 10:06:53 Thanh toan 1 phan: 5000 vnd.&#13;20-12-28 10:06:58 Thanh toan xong.&#13;', 'admin', '2020-12-28 22:06:58', '0.182728', 'DH005D201228100555', 'note 5', null, '0', '0.26147', '75000', '2020-12-28 22:06:58', '25000', '3', 'paid', '75000', '0.23295', '11', '19');
INSERT INTO `orders` VALUES (null, 'anonymousUser', '2020-12-31 22:05:55', '20-12-28 10:05:55 Don hang duoc tao.&#13;20-12-28 10:06:53 Thanh toan 1 phan: 5000 vnd.&#13;20-12-28 10:06:58 Thanh toan xong.&#13;', 'admin', '2020-12-28 22:06:58', '0.182728', 'DH005D201228100555', 'note 5', null, '0', '0.26147', '75000', '2020-12-28 22:06:58', '25000', '3', 'paid', '75000', '0.23295', '11', '19');
INSERT INTO `orders` VALUES (null, 'anonymousUser', '2020-12-31 22:05:55', '20-12-28 10:05:55 Don hang duoc tao.&#13;20-12-28 10:06:53 Thanh toan 1 phan: 5000 vnd.&#13;20-12-28 10:06:58 Thanh toan xong.&#13;', 'admin', '2020-12-28 22:06:58', '0.182728', 'DH005D201228100555', 'note 5', null, '0', '0.26147', '75000', '2020-12-28 22:06:58', '25000', '3', 'paid', '75000', '0.23295', '11', '19');


-- SELECT * from  orders where createddate >= ADDDATE(CURDATE(), 0 - WEEKDay(CURDATE())) AND createddate <= ADDDATE(CURDATE(), 5 - WEEKDay(CURDATE()));

SELECT DAYOFWEEK(createddate) as dayofweek, count(*), sum(paid) from  orders 
where createddate >= ADDDATE(CURDATE(), 0 - WEEKDay(CURDATE())) 
	AND createddate <= ADDDATE(CURDATE(), 5 - WEEKDay(CURDATE())) 
	AND status = "paid"
	GROUP BY DAYOFWEEK(createddate) ORDER BY dayofweek ASC