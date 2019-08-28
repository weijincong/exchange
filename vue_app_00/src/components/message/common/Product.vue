<template>
    <div class="DG">
        <heads></heads>
        <div>
            <div>
        <mt-swipe :auto="4000" class="d0" v-for="(ite,index) of list" :key="index">
            <mt-swipe-item class="d1">
                <img :src="'http://127.0.0.1:3000/'+ite.img" alt="">
            </mt-swipe-item>
            <mt-swipe-item class="d2">
                <img src="../../../assets/16pic_5061804_b.jpg" alt="">
            </mt-swipe-item>
            <mt-swipe-item class="d3">
                <img src="../../../assets/16pic_5061804_b.jpg" alt="">
            </mt-swipe-item>
        </mt-swipe>
            </div>
            <!--  -->
            <div class="pdt_1" v-for="(items,index) of list" :key="'pdt_1'+index">
               <div class="pdt_0">
                    {{items.title}}
               </div>
               <div class="pdt_2">
                <a href="javascript:;">
                  <img src="../../../assets/20.png" alt="">
                  <p>分享</p>
                </a>
               </div>
            </div>        
            <div class="pdt_3" v-for="(iteme,index) of list" :key="'pdt_3'+index">
                <div class="pdt_4">
                   {{iteme.integral}}积分
                </div>
                <p>销量{{iteme.frequency}}件</p>
            </div>

            <!--  -->
            <div class="pdt_5">
            <a href="javascript:;">
                <span>商品详情</span>
            </a>   
            <img src="../../../assets/fenye-xiayiye.png" alt=""> 
            </div>

            <!--  -->
            <div class="pdt_5">
            <a href="javascript:;">
                <span>商品评价</span>
            </a>   
            <img src="../../../assets/fenye-xiayiye.png" alt=""> 
            </div>

            <!--  -->
            <div class="pdt_6" v-for="(it,index) of list" :key="'pdt_6'+index">
                <a href="javascript:;">
                    <img src="../../../assets/liwu-xuanzhong(2).png" alt="">
                    <p>商城</p>
                </a>
                <a href="javascript:;">
                <img src="../../../assets/kefu.png" alt="">
                <p  class="d4">客服</p>
                </a>
                <a href="javascript:;">
                    <p @click="addCart" :data-pid="it.pid" :data-img="it.img" :data-title="it.title" :data-integral="it.integral">加入购物车</p>
                </a>
                <a href="javascript:;" @click="purchase(it.pid)">
                    <p>立即购买</p>
                </a>
            </div>
        </div>
    </div>
</template>
<script>
import Header from './Header'
export default {
    data(){
        return {
            list:[],
            pid:""
        }
    },
    methods:{
        loadMore(){
            //功能：获取商品分页数据
            //1、发送数据
            var url="products";
            //创建参数对象
            var obj={pid:this.pid};
            // console.log(obj);
            //发送ajax请求
            this.axios.get(url,{params:obj}).then(res=>{
                var rows=res.data.data;
                this.list=rows;
                // console.log(this.list);
            })
        },
        addCart(e){
            //功能：将商品添加至购物车
            //1、获取当前商品的pid编号、img图片、title标题、integral积分
            var pid=e.target.dataset.pid;
            var img=e.target.dataset.img;
            var title=e.target.dataset.title;
            var integral=e.target.dataset.integral;
            var integrals=e.target.dataset.integral;
            console.log(integrals);
            // console.log(pid,img,title,integral);
            //发送ajax请求
            //请求服务器地址
            var url="addcart";
            //请求参数
            var obj={pid:pid,img:img,title:title,integral:integral,integrals:integrals};
            //获取返回结果
            this.axios.get(url,{params:obj}).then(res=>{
                //如果-1提示用户登录
                // console.log(res);
                if(res.data.code==-1){
                    this.$toast("请先登录");
                    this.$router.push("/Login");
                }else{
                    this.$toast("添加成功");
                }
            })
        },
        purchase(id){
            // console.log(id);
            this.$router.push({
                path: '/Order',
                query: {
                    lid:id
                }
            })
        },
    },
    created(){
        this.pid=this.$route.query.pid;
        // console.log(this.pid);
        this.loadMore();
        // console.log(window.history.length);
    },
    components:{
        "heads":Header
    }
}
</script>
<style scoped>
    .DG{
        background: #efeff4;   
        /* height: 900px;  */
    }
    .d0{
        height: 248px;
    }
    .d0 img{
        width: 100%;

    }
    .pdt_1,.pdt_3{
        display: flex;
        justify-content: space-between;
        padding:0 20px;
        border:1px solid #ffffff;
        background: #ffffff;
    }
    p{margin: 0;}
    .pdt_0{
        display: flex;
        margin-top:15px;
        flex-wrap:wrap;  
    }
    .pdt_2{
        width: 72px;
        height: 41px;
        border-left: 1px solid #d9d9d9;
        border-bottom: none;
        margin-top:15px 
    }
    .pdt_2 img{
        width: 20px;
        height: 20px;
        margin-left: 28px; 
    }
    .pdt_2 p{
        margin-left: 25px;
        color:#d9d9d9;
    }
    .pdt_4{
        padding:10px 0px;
        color: #f44623;
    }
    .pdt_3 p{
        padding:10px 0px;
        font-size: 15px;
        color: #8f8f94;
    }
    .pdt_5{
        display: flex;
        justify-content: space-between;
        padding: 10px;
        background: #ffffff;
        margin-top: 10px;
    }
    .pdt_5 a span{
        display: inline-block;  
         padding: 5px 0  ; 
        font-size: 20px;
    }
    .pdt_5 img{
        width: 20px;
        height: 20px;
        padding: 5px 0  ; 
    }
    .pdt_6{
        display: flex;
        justify-content: space-between;
        background: #ffffff;
        margin-top: 88px;
    }
    .pdt_6 a:nth-child(1),
    .pdt_6 a:nth-child(2){
        width: 56px;
        height: 45px;
        border-right: 1px solid #efeff4;
        border-bottom: 1px solid #efeff4;
        padding: 0; 
    }
    .pdt_6 a:nth-child(2){
        border-right: none;
    }
    .pdt_6 a:nth-child(1) p,
    .pdt_6 a:nth-child(2) p{
        font-size: 12px;
        padding: 0 16px;
        color: #333333;
    }
    .pdt_6 a:nth-child(3){
        width: 131px;
        height: 45px;
        background-color: #ff9100;
        border-bottom: 1px solid #ff9100;
    }
    .pdt_6 a:nth-child(3) p{
        padding: 14px 25px;
        color: #ffffff;
    }
    
    .pdt_6 a:nth-child(4){
        width: 131px;
        height: 45px;
    }
    .pdt_6 a:nth-child(4) p{
        padding: 14px 33px;
        color: #ffffff;
        background-color: #f44623;
    }
    .pdt_6 img{
        width: 20px;
        height: 20px;
        margin:0px 19px; 
        padding-top: 5px; 
    }

</style>