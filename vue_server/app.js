//vue_server  app.js  node程序
//1、加载第三方模块
//web服务器
const express=require("express");
//mysql 驱动
const mysql=require("mysql");
//跨域
const cors=require("cors");
//session
const session =require("express-session");
//2、配置连接池：提高数据效率
var pool=mysql.createPool({
    host:"127.0.0.1",   //数据库地址
    user:"root",        //数据库用户名
    password:"",        //数据库密码
    port:3306,          //数据库端口
    database:"integral",//数据库名称
    connectionLimit:15  //连接数量
});
var server=express();
//3、配置跨域模块
server.use(cors({
    //允许跨域访问程序地址列表
    origin:["http://127.0.0.1:8080",
    "http://localhost:8080"],
    credentials:true //请求验证

}))
//4、配置session模块
server.use(session({
    secret:"128位字符串",  //安全字符串
    resave:true,          //请求时更新数据
    saveUninitialized:true//保存初始数据
}))
//启动监听
server.listen(3000);
//5、配置静态资源文件
server.use(express.static("public"));


//功能一:完成用户登录
server.get("/login",(req,res)=>{
    //获取网页传递两个数据  uname upwd
    var uname=req.query.uname;
    var upwd=req.query.upwd;
    //查询数据库
    var sql="select * from integral_user where uname=? and upwd=?";
    pool.query(sql,[uname,upwd],(err,result)=>{
        if(err)throw err;
        if(result.length===0){
            res.send({code:-1,msg:"用户名或者密码错误"});
        }else{
            //将登录成功凭据保存session
            req.session.uid=result[0].uid;
            // console.log(result[0].uid);
            //将成功消息发送到脚手架
            res.send({code:1,msg:"登录成功"})
        }
    })
}); 
//http://127.0.0.1:3000/login?uname=小明&upwd=123456

//功能二：完成用户注册
server.get("/reg",(req,res)=>{
    //获取网页传递数据
    var uname=req.query.uname;
    var upwd=req.query.upwd;
    console.log(req.query);
    //查询数据库sql语句
    var sql="INSERT INTO integral_user SET uname=?,upwd=?,integral=1000";
    pool.query(sql,[uname,upwd],(err,result)=>{
        if(err)throw err;
        res.send({code:1,msg:"注册成功"})
    });
});
//http://127.0.0.1:3000/reg?uname=tom&upwd=123123

//查询商品列表
server.get("/xphd",(req,res)=>{
    //接收用户参数
    //pno 页码 page页面大小
    var p=req.query.pno;
    var ps=req.query.page;
    //设置参数默认值 pno:1 page:6
    if(!p){p=1}
    if(!ps){ps=6}
    //创建变量 offset 计算数据库偏移量
    var offset=(p-1)*ps;
    //将offset转换为整形
    ps=parseInt(ps);
    //创建sql语句
    var sql=`select pid,img,title,integral,frequency from integral_product_drinks LIMIT ?,?`;
    pool.query(sql,[offset,ps],(err,result)=>{
        if(err)throw err;
        //将查询结果发送到客户端
        res.send({code:1,msg:"查询成功",data:result});
    })
});
//http://127.0.0.1:3000/xp?pno=1&page=6
server.get("/xpsg",(req,res)=>{  //新品水果
    //接收用户参数
    //pno 页码 page页面大小
    var a=req.query.pno;
    var as=req.query.page;
    //设置参数默认值 pno:1 page:6
    if(!a){a=20}
    if(!as){as=6}
    //创建sql语句
    var sql=`select pid,img,title,integral,frequency from integral_product LIMIT ?,?`;
    pool.query(sql,[a,as],(err,result)=>{
        if(err)throw err;
        //将查询结果发送到客户端
        res.send({code:1,msg:"查询成功",data:result});
    })
});

server.get("/xpls",(req,res)=>{  //新品零食
    //接收用户参数
    //pno 页码 page页面大小
    var b=req.query.pno;
    var bs=req.query.page;
    //设置参数默认值 pno:1 page:6
    if(!b){b=10}
    if(!bs){bs=6}
    //创建sql语句
    var sql=`select pid,img,title,integral,frequency from integral_product LIMIT ?,?`;
    pool.query(sql,[b,bs],(err,result)=>{
        if(err)throw err;
        //将查询结果发送到客户端
        res.send({code:1,msg:"查询成功",data:result});
    })
});

server.get("/xpsp",(req,res)=>{
    //接收用户参数
    //pno 页码 page页面大小
    var c=req.query.pno;
    var cs=req.query.page;
    //设置参数默认值 pno:1 page:6
    if(!c){c=30}
    if(!cs){cs=6}
    //创建sql语句
    var sql=`select pid,img,title,integral,frequency from integral_product LIMIT ?,?`;
    pool.query(sql,[c,cs],(err,result)=>{
        if(err)throw err;
        //将查询结果发送到客户端
        res.send({code:1,msg:"查询成功",data:result});
    })
});

server.get("/product",(req,res)=>{
    //接收用户参数
    var fmily_id=req.query.fmily_id;
    //创建sql语句
    var sql=`select pid,img,title,integral,frequency from integral_product WHERE fmily_id=?`;
    pool.query(sql,[fmily_id],(err,result)=>{
        if(err)throw err;
        //将查询结果发送到客户端
        res.send({code:1,msg:"查询成功",data:result});
    })
});

server.get("/pro",(req,res)=>{
    //接收用户参数
    //pno 页码 page页面大小
    var c=req.query.pno;
    var cs=req.query.page;
    //设置参数默认值 pno:1 page:6
    if(!c){c=1}
    if(!cs){cs=6}
    //创建变量 offset 计算数据库偏移量 
    var offset=(c-1)*cs;
    //将offset转换为整形
    cs=parseInt(cs);
    //创建sql语句
    var sql=`select pid,img,title from integral_product_list LIMIT ?,?`;
    pool.query(sql,[offset,cs],(err,result)=>{
        if(err)throw err;
        //将查询结果发送到客户端
        res.send({code:1,msg:"查询成功",data:result});
    })
});

server.get("/products",(req,res)=>{
    //获取页面传递的pid
    var pid=req.query.pid;
    //创建sql语句
    var sql=`select pid,img,title,integral,frequency from integral_product where pid=?`;
    pool.query(sql,[pid],(err,result)=>{
        if(err)throw err;
        res.send({code:1,msg:"查询成功",data:result});
    })
});
//http://127.0.0.1:3000/products?pid=1

server.get("/addcart",(req,res)=>{
    //2:参数
    //2.1:获取当前登录用户id值
    var uid = req.session.uid;
    //2.2:如果当前用户没有登录
    if(!uid){
    //2.3:返回错误消息  
      res.send({code:-1,msg:"请先登录"});
      return;
    }
    //2.4:获取商品编号 商品价格 商品名称
    var lid = req.query.pid;
    var img=req.query.img;
    var title=req.query.title;
    var integral=req.query.integral;
    var Total_Integral=req.query.integrals;
    console.log(lid,img,title,integral,Total_Integral);
    //3:查询指定用户是否添加过此商品
    var sql = "SELECT uid FROM integral_cart WHERE uid = ? AND lid = ?";
    pool.query(sql,[uid,lid],(err,result)=>{
        if(err)throw err;
        console.log(result);
        console.log(111);
        var sql = "";
        if(result.length==0){
            console.log(222);
        //4:没有购买过此商品添加
        sql=`INSERT INTO integral_cart SET uid=?,lid=?,img=?,title=?,count=?,integral=?,Total_Integral=?`;
        pool.query(sql,[uid,lid,img,title,1,integral,Total_Integral],(err,result)=>{
            if(err)throw err;
            console.log(result);
            res.send({code:1,msg:"添加成功",data:result})
        });
        }else{
            //5:再次添加此商品更新
            sql=`UPDATE integral_cart SET count=count+1 WHERE uid=${uid} AND lid=${lid}`;
            sqls=`UPDATE integral_cart SET Total_Integral=integral*count`;
            pool.query(sql,(err,result)=>{
                if(err)throw err;
                pool.query(sqls,(err,result)=>{
                    if(err)throw err;
                    console.log(result);
                    res.send({code:1,msg:"修改成功"})
                });
            });
        } 
    })
})
//http://127.0.0.1:3000/addcart?pid=4&img=04.jpg&title=天友利友核花生奶240ml&integral=220



//功能：完成查询购物车操作
server.get("/cart",(req,res)=>{
    //2:参数
    //2.1:获取当前登录用户id值
    var uid = req.session.uid;
    console.log(uid);
    //2.2:如果当前用户没有登录
    if(!uid){
    //2.3:返回错误消息  
      res.send({code:-1,msg:"请先登录"});
      return;
    }
    //创建sql语句查询用户购物车内容
    var sql =`SELECT eid,lid,img,title,count,integral FROM integral_cart WHERE uid=?`;
    pool.query(sql,[uid],(err,result)=>{
        if(err)throw err;
        res.send({code:1,msg:"查询成功",data:result});
    });
});

server.get("/order",(req,res)=>{
    //2.1:获取当前登录用户id值
    var uid = req.session.uid;
    //2.2:如果当前用户没有登录
    if(!uid){
        //2.3:返回错误消息  
          res.send({code:-1,msg:"请先登录"});
          return;
    }
    //创建sql语句
    var sql=`SELECT receiver,address,fixedphone FROM integral_address WHERE uid=?`;
    pool.query(sql,[uid],(err,result)=>{
        if(err)throw err;
        res.send({code:1,msg:"查询成功",data:result});
    })
});
//http://127.0.0.1:3000/order

//功能：获取商品详情
server.get("/orders",(req,res)=>{
    var pid=req.query.pid;
    //创建sql语句
    var sql=`SELECT img,pid,integral,title FROM integral_product WHERE pid=?`;
    pool.query(sql,[pid],(err,result)=>{
        if(err)throw err;
        // console.log(result);
        res.send({code:1,msg:"查询成功",data:result});
    });
});

//功能：查询用户剩余积分
server.get("/ord",(req,res)=>{
    //2.1:获取当前登录用户id值
    var uid = req.session.uid;
    //创建sql语句
    var sql=`SELECT integral FROM integral_user WHERE uid=?`;
    pool.query(sql,[uid],(err,result)=>{
        if(err)throw err;
        console.log(result);
        res.send({code:1,msg:"查询成功",data:result});
    });
});

//功能：提交订单用户总积分减少
server.get("/submission",(req,res)=>{
    //2.1:获取当前登录用户id值
    var uid = req.session.uid;
    //获取页面用户积分
    var integrals=req.query.integral;
    //创建sql语句
    var sql=`UPDATE integral_user SET integral=? WHERE uid=?`;
    pool.query(sql,[integrals,uid],(err,result)=>{
        if(err)throw err;
        res.send({code:1,msg:"修改成功",data:result});
    });
})
//http://127.0.0.1:3000/submission?integral=12222






















//功能点击购物车数量减少
server.get("/reduce",(req,res)=>{
    //获取商品和用户数据
    //2:参数
    //2.1:获取当前登录用户id值
    var uid = req.session.uid;
    var lid=req.query.lid;
    var sql=`UPDATE integral_cart SET count=count-1 WHERE uid=${uid} AND lid=${lid}`;
    var sqls=`UPDATE integral_cart SET Total_Integral=integral*count`;
    //5:再次更新此商品
    pool.query(sql,(err,result)=>{
        if(err)throw err;
        pool.query(sqls,(err,result)=>{
            if(err)throw err;
            console.log(result);
            res.send({code:1,msg:"数量减一"})
        });
     });
});
//http:127.0.0.1:3000/reduce?uid=1&lid=1

server.get("/dler",(req,res)=>{
    //获取商品和用户数据
    //2:参数
    //2.1:获取当前登录用户id值
    var uid = req.session.uid;
    var lid=req.query.lid;
    var sql=`DELETE FROM integral_cart WHERE uid=${uid} AND lid=${lid}`;
    pool.query(sql,(err,result)=>{
        if(err)throw err;
        res.send({code:1,msg:"删除成功"})
    });
})


//功能：点击购物车数量加一
server.get("/plus",(req,res)=>{
    //获取商品和用户数据
    //2:参数
    //2.1:获取当前登录用户id值 
    var uid = req.session.uid;
    var lid=req.query.lid;
    var sql=`UPDATE integral_cart SET count=count+1 WHERE uid=${uid} AND lid=${lid}`;
    var sqls=`UPDATE integral_cart SET Total_Integral=integral*count`;
    //5:再次更新此商品
    pool.query(sql,(err,result)=>{
        if(err)throw err;
        pool.query(sqls,(err,result)=>{
            if(err)throw err;
            console.log(result);
            res.send({code:1,msg:"数量加一"})
        });
     });
});
//http:127.0.0.1:3000/plus?uid=1&lid=1

//功能：获取用户收货地址
server.get("/edit",(req,res)=>{
    //获取用户数据
    //2:参数
    //2.1:获取当前登录用户id值
    var uid = req.session.uid;
    var sql=`SELECT receiver,address,fixedphone,is_default FROM integral_address WHERE uid=?`;
    pool.query(sql,[uid],(err,result)=>{
        if(err)throw err;
        res.send({code:1,msg:"查询成功",data:result});
    });
});
//http:127.0.0.1:3000/edit?

server.get("/dle",(req,res)=>{
    //获取用户和商品数据
    //2:参数
    //2.1:获取当前登录用户id值
    var uid = req.session.uid;
    var lid=req.query.lid;
    var sql=`DELETE FROM integral_cart WHERE uid=? AND lid=?`;
    pool.query(sql,[uid,lid],(err,result)=>{
        if(err)throw err;
        res.send({code:1,msg:"删除成功",data:result});
    });
});
//http://127.0.0.1:3000/dle?lid=1

//功能修改个人资料
server.get("/modify",(req,res)=>{
    //获取用户数据
    //2:参数
    //2.1:获取当前登录用户uid值
    var uid = req.session.uid;
    //2.2:如果当前用户没有登录
    if(!uid){
        //2.3:返回错误消息  
          res.send({code:-1,msg:"请先登录"});
          return;
    }
    var phone=req.query.phone;
    var upwd=req.query.pwd;
    var birthday=req.query.birthday;
    var gender=req.query.sex;
    var uname=req.query.uname;
    console.log(phone,upwd,birthday,gender,uname);
    var sql=`UPDATE integral_user SET phone=?,upwd=?,gender=?,uname=?,birthday=? WHERE uid=${uid}`;
    pool.query(sql,[phone,upwd,gender,uname,birthday],(err,result)=>{
        if(err)throw err;
        console.log(result);
        res.send({code:1,msg:"修改成功",data:result});
    });
});
//http://127.0.0.1:3000/modify?phone=15697961918&upwd=654321&gender=0&uname=密码&birthday=1998-7-9


//功能：加积分
server.get("/integral",(req,res)=>{
    //获取用户数据
    //2:参数
    //2.1:获取当前登录用户uid值
    var uid = req.session.uid;
    //2.2:如果当前用户没有登录
    if(!uid){
        //2.3:返回错误消息  
          res.send({code:-1,msg:"请先登录"});
          return;
    }
    var sql=`UPDATE integral_user SET integral=integral+10  WHERE uid=${uid}`;
    pool.query(sql,(err,result)=>{
        if(err)throw err;
        console.log(result);
        res.send({code:1,msg:"积分添加成功",data:result});
    });
});
//http://127.0.0.1:3000/integral?

server.get("/screen",(req,res)=>{
    var fmily_id=req.query.fmily_id;
    var sql=`SELECT img,title,integral,frequency FROM integral_product WHERE fmily_id=? ORDER BY integral DESC`;
    pool.query(sql,[fmily_id],(err,result)=>{
        if(err)throw err;
        res.send({code:1,msg:"查询成功",data:result});
    });
});
//http://127.0.0.1:3000/screen?fmily_id=3

server.get("/scree",(req,res)=>{
    var fmily_id=req.query.fmily_id;
    var sql=`SELECT img,title,integral,frequency FROM integral_product WHERE fmily_id=? ORDER BY frequency DESC`;
    pool.query(sql,[fmily_id],(err,result)=>{
        if(err)throw err;
        res.send({code:1,msg:"查询成功",data:result});
    });
});
//http://127.0.0.1:3000/scree?fmily_id=3

server.get("/hqu",(req,res)=>{
    //获取用户数据
    //2:参数
    //2.1:获取当前登录用户uid值
    var uid = req.session.uid;
    if(!uid){
        //2.3:返回错误消息  
          res.send({code:-1,msg:"请先登录"});
          return;
    }
        var sql=`SELECT uname,integral FROM integral_user WHERE uid=?`;
        pool.query(sql,[uid],(err,result)=>{
            if(err)throw err;
            res.send({code:1,msg:"查询成功",data:result});
        });
    
});
//http://127.0.0.1:3000/hqu?

server.get("/address",(req,res)=>{
    //获取用户数据
    var uid = req.session.uid;
    if(!uid){
        //2.3:返回错误消息  
          res.send({code:-1,msg:"请先登录"});
          return;
    }
    //获取页面数据
    var receiver=req.query.f;
    var address=req.query.a;
    var postcode=req.query.n;
    var fixedphone=req.query.p;
    //创建sql语句
    var sql=`UPDATE integral_address SET receiver=?,address=?,postcode=?,fixedphone=? WHERE uid=${uid}`;
    pool.query(sql,[receiver,address,postcode,fixedphone],(err,result)=>{
        if(err)throw err;
        res.send({code:1,msg:"修改成功",data:result});
    });
})