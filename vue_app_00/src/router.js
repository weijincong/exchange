import Vue from 'vue'
import Router from 'vue-router'
import index from "./components/index.vue"
import nav from "./components/message/common/nav.vue"
import Foot from "./components/message/common/Foot.vue"
import Carsourul from "./components/message/common/Carsourul.vue"
import Login from "./components/message/common/Login.vue"
import Logins from "./login/src/lib/Logins.vue"
import Reg from "./components/message/common/Reg.vue"
import Identify from "./components/message/common/Identify.vue"
import Beverages from "./components/message/common/Beverages.vue"
import Buy from "./components/message/common/Buy.vue"
import Fruit from "./components/message/common/Fruit.vue"
import Me from "./components/message/common/Me.vue"
import Nav from "./components/message/common/nav.vue"
import Order from "./components/message/common/Order.vue"
import Points from "./components/message/common/Points.vue"
import Product from "./components/message/common/Product.vue"
import Profile from "./components/message/common/Profile.vue"
import Category from "./components/message/common/Category.vue"
import Header from "./components/message/common/Header.vue"
import Head from "./components/message/common/Head.vue"
import Cart from "./components/message/common/Cart.vue"
import Grzl from "./components/message/common/Grzl.vue"
import Bianji from "./components/message/common/Bianji.vue"
import Spxq from "./components/message/common/Spxq.vue"
import Fff from "./components/message/common/Fff.vue"
import Gwc from "./components/message/common/Gwc"
import Wde from "./components/message/common/Wde"
import Zhuce from "./components/message/common/Zhuce.vue"
import Sc from "./components/message/common/Sc.vue"

//#为Exam01.vue 组件指定访问路径
//1:在router.js 引入组件


Vue.use(Router)
export default new Router({
  routes: [
    // {path:'/Home',component:Home},
    {path:'/',component:index},
    {path:'/nav',component:nav},
    {path:'/Foot',component:Foot},
    {path:'/Carsourul',component:Carsourul},
    {path:'/Login',component:Login},
    {path:'/Logins',component:Logins},
    {path:'/Reg',component:Reg},
    {path:'/Identify',component:Identify},
    {path:'/Beverages',component:Beverages},
    {path:'/Buy',component:Buy},
    {path:'/Fruit',component:Fruit},
    {path:'/Me',component:Me},
    {path:'/Nav',component:Nav},
    {path:'/Order',component:Order},
    {path:'/Points',component:Points},
    {path:'/Product',component:Product},
    {path:'/Profile',component:Profile},
    {path:'/Category',component:Category},
    {path:'/Header',component:Header},
    {path:'/Head',component:Head},
    {path:'/Cart',component:Cart},
    {path:'/Grzl',component:Grzl},
    {path:'/Bianji',component:Bianji},
    {path:'/Spxq',component:Spxq},
    {path:'/Fff',component:Fff},
    {path:'/Gwc',component:Gwc},
    {path:'/Wde',component:Wde},
    {path:'/Zhuce',component:Zhuce},
    {path:'/Sc',component:Sc}
  ]
})
