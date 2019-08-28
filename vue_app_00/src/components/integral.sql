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
  member BOOLEAN             #是否为会员
);

/*添加用户信息数据*/
INSERT INTO integral_user VALUES
(NULL,'小明',123456,'xioaming@163.com',15697061916,'../img/bciusb.png','王大锤',532428199803126776,1,1),
(NULL,'小楚',123456,'xioachu@163.com',15697062918,'../img/bm.png','张楚岚',532428199806106976,0,1);

/**收货地址信息**/
CREATE TABLE integral_address(
  aid INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT,                #用户编号
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
(NULL,1,'张楚岚','重庆','重庆市','渝北区','重庆渝北区华山南路16号',15697062918,15697062918,'401135',1);

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






/*商品列表*/
CREATE TABLE integral_index_product(
  pid INT PRIMARY KEY AUTO_INCREMENT,
  img VARCHAR(64),
  title VARCHAR(64),
  integral INT,
  Price VARCHAR(16),
  frequency INT
);
/*添加商品列表*/
INSERT INTO integral_index_product VALUES
(NULL,'img/01.jpg','可口可乐瓶装600ml','3500','3.50',100),
(NULL,'img/02.jpg','维他柠檬茶250ml','3500','3.50',110),
(NULL,'img/03.jpg','元气森林白桃味苏打气泡水','5000','5.00',45),
(NULL,'img/04.jpg','天友利友核桃奶240ml','2200','2.20',78),
(NULL,'img/05.jpg','百事可乐摩登罐330ml','3000','3.00',89),
(NULL,'img/06.jpg','娃哈哈AD钙奶220g','2500','2.50',208),
(NULL,'img/07.jpg','红牛饮料250ml','6500','6.50',179),
(NULL,'img/08.jpg','统一阿萨姆奶茶','4500','4.50',149),
(NULL,'img/09.jpg','红牛饮料250ml','6500','6.50',179),
(NULL,'img/10.jpg','旺仔牛奶原味245ml','5500','6.50',68),