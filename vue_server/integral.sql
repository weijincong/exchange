SET NAMES UTF8;
DROP DATABASE IF EXISTS integral;
CREATE DATABASE integral CHARSET=UTF8;
USE integral;

/**用户信息**/
CREATE TABLE integral_user(
  uid INT PRIMARY KEY AUTO_INCREMENT,
  uname VARCHAR(32),          #用户名
  upwd VARCHAR(32),           #用户密码
  email VARCHAR(64),          #用户邮箱
  phone VARCHAR(16),          #用户电话
  avatar VARCHAR(128),        #头像图片路径
  user_name VARCHAR(32),      #用真实户名，如王小明
  id_card VARCHAR(32),        #用户身份证
  gender INT,                 #性别  0-女  1-男
  integral INT,               #个人积分
  birthday VARCHAR(32)            #生日
);

/*添加用户信息数据*/
INSERT INTO integral_user VALUES
(NULL,'小明',123456,'xioaming@163.com',15697061916,'../img/bciusb.png','王大锤',532428199803126776,1,12000,'2019-09-09'),
(NULL,'小楚',123456,'xioachu@163.com',15697062918,'../img/bm.png','张楚岚',532428199806106976,0,10000,'1998-03-15');

/**收货地址信息**/
CREATE TABLE integral_address(
  aid INT PRIMARY KEY AUTO_INCREMENT,
  uid INT,                #用户编号
  receiver VARCHAR(16),       #接收人姓名
  province VARCHAR(16),       #省
  city VARCHAR(16),           #市
  county VARCHAR(16),         #县区
  address VARCHAR(128),       #详细地址
  cellphone VARCHAR(16),      #手机
  fixedphone VARCHAR(16),     #固定电话
  postcode CHAR(6),           #邮编

  is_default BOOLEAN          #是否为当前用户的默认收货地址
);

/*添加用户地址信息*/
INSERT INTO integral_address VALUES
(NULL,1,'王大锤','重庆','重庆市','渝北区','重庆渝北区华山南路16号',15697061916,15697061916,'401135',1),
(NULL,2,'张楚岚','重庆','重庆市','渝北区','重庆渝北区华山南路16号',15697062918,15697062918,'401135',1);

/*首页轮播图片*/
CREATE TABLE integral_carousel(
  cid INT PRIMARY KEY AUTO_INCREMENT,
  img VARCHAR(128),
  title VARCHAR(64)
);
/*添加轮播图片*/
INSERT INTO integral_carousel VALUES
(NULL,"image/banner1.jpg",'轮播图商品1'),
(NULL,"image/banner2.jpg",'轮播图商品2'),
(NULL,"image/banner3.jpg",'轮播图商品3'),
(NULL,"image/banner4.jpg",'轮播图商品4');

/**用户订单**/
CREATE TABLE integral_order(
  did INT PRIMARY KEY AUTO_INCREMENT,
  order_id INT,           #订单编号
  product_id INT,         #产品编号
  count INT               #购买数量
);

/*添加用户订单*/





/*饮料商品列表*/
CREATE TABLE integral_product_Drinks(
  pid INT PRIMARY KEY AUTO_INCREMENT,
  img VARCHAR(64),
  title VARCHAR(64),
  integral INT,
  Price VARCHAR(16),
  frequency INT
);

/*添加饮料商品列表*/
INSERT INTO integral_product_Drinks VALUES
(NULL,'img/01.jpg','可口可乐瓶装600ml','350','3.50',100),
(NULL,'img/02.jpg','维他柠檬茶250ml','350','3.50',110),
(NULL,'img/03.jpg','元气森林白桃味苏打气泡水','500','5.00',45),
(NULL,'img/04.jpg','天友利友核花生奶240ml','220','2.20',78),
(NULL,'img/05.jpg','百事可乐','300','3.00',89),
(NULL,'img/06.jpg','娃哈哈AD钙奶220g','250','2.50',208),
(NULL,'img/07.jpg','红牛饮料250ml','650','6.50',179),
(NULL,'img/08.jpg','统一阿萨姆奶茶','450','4.50',149),
(NULL,'img/09.jpg','脉动（Mizone）水蜜桃口味 迷你便携低糖维生素运动功能','450','4.50',179),
(NULL,'img/10.jpg','旺仔牛奶原味245ml','650','6.50',68);

/*零食商品列表*/
CREATE TABLE integral_product_snacks(
  pid INT PRIMARY KEY AUTO_INCREMENT,
  img VARCHAR(64),
  title VARCHAR(64),
  integral INT,
  Price VARCHAR(16),
  frequency INT
);
/*添加零食商品列表*/
INSERT INTO integral_product_snacks VALUES
(NULL,'img/11.jpg','港荣蒸蛋糕整箱','3750','37.50',89),
(NULL,'img/12.jpg','友臣肉松饼整箱','4450','44.50',109),
(NULL,'img/13.jpg','奥利奥休闲食品网红零食','9950','99.50',270),
(NULL,'img/14.jpg','三只松鼠_零食大礼包','4980','49.80',89),
(NULL,'img/15.jpg','旺旺大米饼1000g*2袋','3580','35.80',399),
(NULL,'img/16.jpg','口水娃麻辣卤藕600g','1380','13.80',279),
(NULL,'img/17.jpg','源氏老式大辣片','1480','14.80',179),
(NULL,'img/18.jpg','乐事薯片40g*10包','2890','28.90',146),
(NULL,'img/19.jpg','达利园瑞士卷蛋糕混合装1500g','1500','15.00',306),
(NULL,'img/20.jpg','嘉华鲜花饼经典玫瑰饼300g','9600','96.00',257);
/*水果商品列表*/
CREATE TABLE integral_product_Fruits(
  pid INT PRIMARY KEY AUTO_INCREMENT,
  img VARCHAR(64),
  title VARCHAR(64),
  integral INT,
  Price VARCHAR(16),
  frequency INT
);
/*添加水果商品列表*/
INSERT INTO integral_product_Fruits VALUES
(NULL,'img/21.jpg','国产水蜜桃 新鲜桃子 精选特级果3kg装  铂金果 新鲜','3990','39.90',374),
(NULL,'img/22.jpg','美国进口车厘子带箱3斤大樱桃','19900','199.00',394),
(NULL,'img/23.jpg','泰国莲雾果带箱5斤装','12900','129.00',400),
(NULL,'img/24.png','泰国进口红毛丹带箱5斤','7900','79.00',267),
(NULL,'img/25.jpg','比利时Truval啤梨12只','8900','89.00',398),
(NULL,'img/26.jpg','菲律宾都乐无冠菠萝2只装','4600','46.00',287),
(NULL,'img/27.jpg','南非进口西柚 9个装单果重200-300g','6800','68.00',217),
(NULL,'img/28.jpg','墨西哥进口牛油果8个新鲜当季水果190-240g','5790','57.90',287),
(NULL,'img/29.jpg','榴鲜生金枕头榴莲果肉净重900g','20700','207.00',232),
(NULL,'img/30.jpg','菲律宾进口非转基因木瓜','3900','39.00',232);

/*家居家纺商品列表*/
CREATE TABLE integral_product_furniture(
  pid INT PRIMARY KEY AUTO_INCREMENT,
  img VARCHAR(64),
  title VARCHAR(64),
  integral INT,
  Price VARCHAR(16),
  frequency INT
);
/*添加家居家纺商品列表*/
INSERT INTO integral_product_furniture VALUES
(NULL,'img/31.jpg','南极人（NanJiren）  高支印花全棉床上用品套件学生纯棉四件套床单被罩1.5米/1.8米床 被套200*230cm','14900','149.00',232),
(NULL,'img/32.jpg','乐贴卫生间免打孔肥皂盒浴室不锈钢香皂盒洗手间免钉沥水肥皂架','6900','69.00',102),
(NULL,'img/33.jpg','名创优品（MINISO）呆萌小夜灯 可爱可捏 硅胶外壳 宿舍神器卧室床头灯白色','1990','19.90',89),
(NULL,'img/34.jpg','蔓斯菲尔（MSFE）电脑桌 台式家用简约书桌办公桌带书架学习桌','19900','199.00',189),
(NULL,'img/35.jpg','栳石木匠 实木圆凳家用时尚小凳子换鞋凳浴室方凳子小椅子茶几凳垫脚凳脚踏木花架','2990','29.90',79),
(NULL,'img/36.jpg','美厨（maxcook）不锈钢盆筛五件套 加大加厚调料盆沥水篮洗菜盆沙拉盆 米筛味斗套装MCPW-5','6900','69.00',109),
(NULL,'img/37.jpg','苏泊尔（SUPOR）小红圈系列铲勺六件套 锅铲不锈钢漏勺汤勺火锅勺刨皮刀套装 TK1823Q','33900','339.00',149),
(NULL,'img/38.jpg','美之扣 家用土豆丝切丝器','4990','49.90',269),
(NULL,'img/39.jpg','阳光飞歌 不锈钢防烫取盘器  多功能提盘器夹碗器夹盘器 防烫手','890','8.90',79),
(NULL,'img/40.jpg','美厨（maxcook）锅盖架 太空铝','4390','43.90',49);

/*化妆品列表*/
CREATE TABLE integral_product_huazhuangping(
  pid INT PRIMARY KEY AUTO_INCREMENT,
  img VARCHAR(64),
  title VARCHAR(64),
  integral INT,
  Price VARCHAR(16),
  frequency INT
);
/*添加化妆品列表*/
INSERT INTO integral_product_huazhuangping VALUES
(NULL,'img/41.jpg','网红爆款  防晒霜喷雾男女学生军训防紫外线隔离霜防水素颜喷雾','4900','49.00',232),
(NULL,'img/42.jpg','抖音同款 正品蘑菇头气垫bb霜cc棒遮瑕防水粉底液保湿花妆品女','1558','15.58',269),
(NULL,'img/43.jpg','男士护肤品套装 控油补水护肤品去黑头面膜面霜祛痘化妆品学生','3900','39.00',339),
(NULL,'img/44.jpg','正品男士沐浴露洗发持久留香古龙香水味清爽醒肤沐浴乳液套装500g','4990','49.90',269),
(NULL,'img/45.jpg','礼盒 玻尿酸保湿六件套化妆品水乳套装可以清洁补水护肤品','16990','169.90',166),
(NULL,'img/46.jpg','美宝莲口红小样迷1.5g不脱色持久保湿防水唇膏专柜品牌','2600','26.00',466),
(NULL,'img/47.jpg','小迷糊少女肌密水嫩亮颜黑膜21片补水保湿女学生面膜官方正品热门','3990','39.90',262),
(NULL,'img/48.jpg','33色眼影初学者防水韩版珠光眼影盘套装多色彩妆套装送网红同款刷','1900','19.00',166),
(NULL,'img/49.jpg','正品八杯水护肤6件套 补水保湿嫩白控油化妆品','3600','36.00',166),
(NULL,'img/50.jpg','超声波负离子导入仪导出美容仪家用脸部排毒仪补水保湿清洁按摩器','1000','10.00',506);

/*礼品列表*/
CREATE TABLE integral_product_liping(
  pid INT PRIMARY KEY AUTO_INCREMENT,
  img VARCHAR(64),
  title VARCHAR(64),
  integral INT,
  Price VARCHAR(16),
  frequency INT
);
/*添加礼品列表*/
INSERT INTO integral_product_liping VALUES
(NULL,'img/51.jpg','创意台灯小夜灯中秋节教师节闺蜜七夕礼物毕业女生生日礼物男生','760','7.60',232),
(NULL,'img/52.jpg','生日礼物女生七夕情人节少女心小夜灯送女友送男友闺蜜教师节礼物','2800','28.00',232),
(NULL,'img/53.jpg','音乐台灯创意蓝牙音响小夜灯卧室床头节能插电圣诞节生日礼物送男女','3900','39.00',266),
(NULL,'img/54.jpg','定制情侣照片发光创意女生生日礼物少女送女朋友闺蜜老婆小礼品','1900','19.00',520),
(NULL,'img/55.jpg','正方形大号礼品盒','1899','18.99',132),
(NULL,'img/55.jpg','','2800','28.00',232),
(NULL,'img/56.jpg','定制变色水杯情侣','10000','100.00',232),
(NULL,'img/57.jpg','投影100种语言我爱一路有你项链','9999','99.99',666 ),
(NULL,'img/58.jpg','夜光石合心项链定制','1390','13.9',232),
(NULL,'img/59.jpg','吉猫堂 招财猫摆件开业 店铺礼品金色发财猫电动摇手自动招手猫','13800','138.00',232),
(NULL,'img/60.jpg','泰迪熊公仔布娃娃毛绒玩具熊大号熊猫玩偶可爱抱枕女孩生日礼物','2800','28.00',232);

CREATE TABLE integral_product_list(
  pid INT PRIMARY KEY AUTO_INCREMENT,
  img VARCHAR(64),
  title VARCHAR(64)
);
INSERT INTO integral_product_list VALUES
(NULL,'img/01.jpg','饮品'),
(NULL,'img/11.jpg','零食'),
(NULL,'img/21.jpg','水果'),
(NULL,'img/31.jpg','家居'),
(NULL,'img/41.jpg','化妆品'),
(NULL,'img/51.jpg','礼品');

CREATE TABLE integral_product(
  pid INT PRIMARY KEY AUTO_INCREMENT,
  img VARCHAR(64),      #商品图片
  title VARCHAR(64),    #商品标题
  integral INT,         #商品积分
  count INT,            #商品数量
  frequency INT,        #商品兑换次数
  fmily_id INT          #所属家族编号
);
INSERT INTO integral_product VALUES
(NULL,'img/01.jpg','可口可乐瓶装600ml','350',1,100,1),
(NULL,'img/02.jpg','维他柠檬茶250ml','350',1,110,1),
(NULL,'img/03.jpg','元气森林白桃味苏打气泡水','500',1,45,1),
(NULL,'img/04.jpg','天友利友核花生奶240ml','220',1,78,1),
(NULL,'img/05.jpg','百事可乐','300',1,89,1),
(NULL,'img/06.jpg','娃哈哈AD钙奶220g','250',1,208,1),
(NULL,'img/07.jpg','红牛饮料250ml','650',1,179,1),
(NULL,'img/08.jpg','统一阿萨姆奶茶','450',1,149,1),
(NULL,'img/09.jpg','脉动（Mizone）水蜜桃口味 迷你便携低糖维生素运动功能','450',1,179,1),
(NULL,'img/10.jpg','旺仔牛奶原味245ml','650',1,68,1),
(NULL,'img/11.jpg','港荣蒸蛋糕整箱','3750',1,89,2),
(NULL,'img/12.jpg','友臣肉松饼整箱','4450',1,109,2),
(NULL,'img/13.jpg','奥利奥休闲食品网红零食',1,'99.50',270,2),
(NULL,'img/14.jpg','三只松鼠_零食大礼包','4980',1,89,2),
(NULL,'img/15.jpg','旺旺大米饼1000g*2袋','3580',1,399,2),
(NULL,'img/16.jpg','口水娃麻辣卤藕600g','1380',1,279,2),
(NULL,'img/17.jpg','源氏老式大辣片','1480',1,179,2),
(NULL,'img/18.jpg','乐事薯片40g*10包','2890',1,146,2),
(NULL,'img/19.jpg','达利园瑞士卷蛋糕混合装1500g','1500',1,306,2),
(NULL,'img/20.jpg','嘉华鲜花饼经典玫瑰饼300g','9600',1,257,2),
(NULL,'img/21.jpg','国产水蜜桃 新鲜桃子 精选特级果3kg装  铂金果 新鲜','3990',1,374,3),
(NULL,'img/22.jpg','美国进口车厘子带箱3斤大樱桃','19900',1,394,3),
(NULL,'img/23.jpg','泰国莲雾果带箱5斤装','12900',1,400,3),
(NULL,'img/24.png','泰国进口红毛丹带箱5斤','7900',1,267,3),
(NULL,'img/25.jpg','比利时Truval啤梨12只','8900',1,398,3),
(NULL,'img/26.jpg','菲律宾都乐无冠菠萝2只装','4600',1,287,3),
(NULL,'img/27.jpg','南非进口西柚 9个装单果重200-300g','6800',1,217,3),
(NULL,'img/28.jpg','墨西哥进口牛油果8个新鲜当季水果190-240g','5790',1,287,3),
(NULL,'img/29.jpg','榴鲜生金枕头榴莲果肉净重900g','20700',1,232,3),
(NULL,'img/30.jpg','菲律宾进口非转基因木瓜','3900',1,232,3),
(NULL,'img/31.jpg','南极人（NanJiren）  高支印花全棉床上用品套件学生纯棉四件套床单被罩1.5米/1.8米床 被套200*230cm','14900',1,232,4),
(NULL,'img/32.jpg','乐贴卫生间免打孔肥皂盒浴室不锈钢香皂盒洗手间免钉沥水肥皂架','6900',1,102,4),
(NULL,'img/33.jpg','名创优品（MINISO）呆萌小夜灯 可爱可捏 硅胶外壳 宿舍神器卧室床头灯白色','1990',1,89,4),
(NULL,'img/34.jpg','蔓斯菲尔（MSFE）电脑桌 台式家用简约书桌办公桌带书架学习桌','19900',1,189,4),
(NULL,'img/35.jpg','栳石木匠 实木圆凳家用时尚小凳子换鞋凳浴室方凳子小椅子茶几凳垫脚凳脚踏木花架','2990',1,79,4),
(NULL,'img/36.jpg','美厨（maxcook）不锈钢盆筛五件套 加大加厚调料盆沥水篮洗菜盆沙拉盆 米筛味斗套装MCPW-5','6900',1,109,4),
(NULL,'img/37.jpg','苏泊尔（SUPOR）小红圈系列铲勺六件套 锅铲不锈钢漏勺汤勺火锅勺刨皮刀套装 TK1823Q','33900',1,149,4),
(NULL,'img/38.jpg','美之扣 家用土豆丝切丝器','4990',1,269,4),
(NULL,'img/39.jpg','阳光飞歌 不锈钢防烫取盘器  多功能提盘器夹碗器夹盘器 防烫手','890',1,79,4),
(NULL,'img/40.jpg','美厨（maxcook）锅盖架 太空铝','4390',1,49,4),
(NULL,'img/41.jpg','网红爆款  防晒霜喷雾男女学生军训防紫外线隔离霜防水素颜喷雾','4900',1,232,5),
(NULL,'img/42.jpg','抖音同款 正品蘑菇头气垫bb霜cc棒遮瑕防水粉底液保湿花妆品女','1558',1,269,5),
(NULL,'img/43.jpg','男士护肤品套装 控油补水护肤品去黑头面膜面霜祛痘化妆品学生','3900',1,339,5),
(NULL,'img/44.jpg','正品男士沐浴露洗发持久留香古龙香水味清爽醒肤沐浴乳液套装500g','4990',1,269,5),
(NULL,'img/45.jpg','礼盒 玻尿酸保湿六件套化妆品水乳套装可以清洁补水护肤品','16990',1,166,5),
(NULL,'img/46.jpg','美宝莲口红小样迷1.5g不脱色持久保湿防水唇膏专柜品牌','2600',1,466,5),
(NULL,'img/47.jpg','小迷糊少女肌密水嫩亮颜黑膜21片补水保湿女学生面膜官方正品热门','3990',1,262,5),
(NULL,'img/48.jpg','33色眼影初学者防水韩版珠光眼影盘套装多色彩妆套装送网红同款刷','1900',1,166,5),
(NULL,'img/49.jpg','正品八杯水护肤6件套 补水保湿嫩白控油化妆品','3600',1,166,5),
(NULL,'img/50.jpg','超声波负离子导入仪导出美容仪家用脸部排毒仪补水保湿清洁按摩器','1000',1,506,5),
(NULL,'img/51.jpg','创意台灯小夜灯中秋节教师节闺蜜七夕礼物毕业女生生日礼物男生','760',1,232,6),
(NULL,'img/52.jpg','生日礼物女生七夕情人节少女心小夜灯送女友送男友闺蜜教师节礼物','2800',1,232,6),
(NULL,'img/53.jpg','音乐台灯创意蓝牙音响小夜灯卧室床头节能插电圣诞节生日礼物送男女','3900',1,266,6),
(NULL,'img/54.jpg','定制情侣照片发光创意女生生日礼物少女送女朋友闺蜜老婆小礼品','1900',1,520,6),
(NULL,'img/55.jpg','正方形大号礼品盒','1899',1,132,6),
(NULL,'img/55.jpg','','2800',1,232,6),
(NULL,'img/56.jpg','定制变色水杯情侣','10000',1,232,6),
(NULL,'img/57.jpg','投影100种语言我爱一路有你项链','9999',1,666,6),
(NULL,'img/58.jpg','夜光石合心项链定制','1390',1,232,6),
(NULL,'img/59.jpg','吉猫堂 招财猫摆件开业 店铺礼品金色发财猫电动摇手自动招手猫','13800',1,232,6),
(NULL,'img/60.jpg','泰迪熊公仔布娃娃毛绒玩具熊大号熊猫玩偶可爱抱枕女孩生日礼物','2800',1,232,6);


/*购物车列表*/
CREATE TABLE integral_cart(
  eid INT PRIMARY KEY AUTO_INCREMENT,
  uid INT,   /*用户id值*/
  lid INT,   /*商品pid值*/
  img VARCHAR(64),/*商品图片*/
  title VARCHAR(64),/*商品标题*/
  count INT,/*商品数量*/
  integral INT,
  Total_Integral INT
);
INSERT INTO integral_cart VALUES
(NULL,1,1,'img/01.jpg','可口可乐瓶装600ml',1,350,350),
(NULL,1,2,'img/02.jpg','维他柠檬茶250ml',1,350,350),
(NULL,2,2,'img/02.jpg','维他柠檬茶250ml',1,350,350),
(NULL,2,1,'img/01.jpg','可口可乐瓶装600ml',1,350,350),
(NULL,1,3,'img/03.jpg','元气森林白桃味苏打气泡水',1,350,350),
(NULL,1,4,'img/04.jpg','天友利友核花生奶240ml',1,220,222),
(NULL,1,5,'img/05.jpg','百事可乐',1,300,300),
(NULL,1,6,'img/06.jpg','娃哈哈AD钙奶220g',1,250,250),
(NULL,1,7,'img/07.jpg','红牛饮料250ml',1,650,650),
(NULL,1,8,'img/08.jpg','统一阿萨姆奶茶',1,450,450),
(NULL,1,9,'img/09.jpg','脉动（Mizone）水蜜桃口味 迷你便携低糖维生素运动功能',1,450,450),
(NULL,1,8,'img/10.jpg','统一阿萨姆奶茶',1,450,450);

CREATE TABLE integral_orders(
  eid INT PRIMARY KEY AUTO_INCREMENT,
  uid INT,   /*用户id值*/
  lid INT,   /*商品pid值*/
  img VARCHAR(64),/*商品图片*/
  title VARCHAR(64),/*商品标题*/
  count INT,/*商品数量*/
  integral INT,/*一件商品的积分*/
  Total_Integral INT  /*总积分*/
);