<template>
    <div class="cart">
        <gwc></gwc>
        <div class="cart_1" v-for="(item,i) of list" :key="i">
            <div class="cart_2">
                <input type="checkbox" class="lname">
                <img :src="'http://127.0.0.1:3000/'+item.img" alt="">
                <div class="cart_3">
                    <p>{{item.title}}</p>
                    <p>{{item.integral}}积分</p>
                    <ul>
                        <li><img @click="reduce" :data-count="item.count" :data-pid="item.lid" src="../../../assets/jian.jpg" alt=""></li>
                        <li>{{item.count}}</li>
                        <li><img @click="plus" :data-count="item.count" :data-pid="item.lid" src="../../../assets/jia.jpg" alt=""></li>
                    </ul>
                </div>
                <div class="cart_4">
                    <img @click="dle" :data-pid="item.lid" src="../../../assets/shanchu.png" alt="">
                </div>
            </div>
        </div>
    </div>
</template>3
<script>
import Gwc from './Gwc'
export default {
    data(){
        return{
            list:[]
        }
    },
    methods:{
        cart(){
            //功能:加载购物车中数据
            //当组件创建成功后调用
            //1:发送请求 cart
            var url = "cart";
            this.axios.get(url).then(res=>{
                //2:获取返回结果
                if(res.data.code==-1){
                    //3:如果用户没有执行登录操作
                    // this.$messagebox("消息","请登录").then(res=>{
                    //     //提示交互提示/跳转登录组件
                    //     this.$router.push("/Login");
                    //     return;
                    // });
                }else{
                //4:获取数据成功
                var list = res.data.data;
                this.list=res.data.data;
                // console.log(list);
                }
            })  
        },
        dle(e){
            var lid=e.target.dataset.pid;
            var obj={lid:lid};
            // console.log(lid);
            var url="dle";
            this.axios.get(url,{params:obj}).then(res=>{
                // console.log(res);
                this.cart();
            })
        },
        reduce(e){
            var count=e.target.dataset.count;
            var lid=e.target.dataset.pid;
            var obj={lid:lid};
            // console.log(count);
            if(count>1){
                this.axios.get("reduce",{params:obj}).then(res=>{
                    this.$toast("商品减一");
                    this.cart();
                })
            }else{
                this.axios.get("dler",{params:obj}).then(res=>{
                    this.$toast("删除成功");
                    this.cart();
                })
            }
        },
        plus(e){
            //获取页面数据
            var count=e.target.dataset.count;
            var lid=e.target.dataset.pid;
            var obj={lid:lid};
            // console.log(count,lid);
            if(count<10){
                this.axios.get("plus",{params:obj}).then(res=>{
                    this.$toast("商品加一");
                    this.cart();
                })
            }else{
                this.$toast("最多兑换十件商品");
            }
        }
    },
    created(){
        this.cart();
    },
    components:{
        "gwc":Gwc,
    }
}
</script>
<style scoped>
    .cart{
        background:  #efeff4;  
        /* height: 970px; */
    }
    .cart_2{
        display: flex;
        justify-content: space-between;
        height: 138px;
        background: #ffffff;
        margin-top: 12px;
        padding: 0 40px;
    }
    li{
        list-style: none;
    }
    .cart_2 img:nth-child(2){
        width: 102px;
        height: 88px;
        border: 1px solid #d9d9d9;
        margin: 24px 0;
    }
    .cart_4 img{
        width: 20px;
        height: 20px;
        margin: 85px -10px;
    }
    .cart_3{
        background: #ffffff;
    }
    .cart_3 p {
        margin-top: 23px; 
    }
    .cart_3 p:nth-child(2){
        margin-top: -5px;
        color: #f44623;
    }
    .lname{
        margin: 63px 0;
    }
    .cart_3 ul{margin-left:-38px; }
    .cart_3 ul li{
        float: left;
    }
    .cart_3 ul li img{
        width: 20px;
        height: 17px;
    }
</style>