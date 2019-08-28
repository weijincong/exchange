<template>
    <div>
        <headers></headers>
        <div class="Bu_1">
            <div class="Bu_2">
                <a href="#" @click="loadMore">默认</a>
                <a href="#" @click="screen">按积分排序</a>
                <a href="#" @click="scree">按销量排序</a>
            </div>
            <div class="BU_3" v-for="(item,i) of list" :key="i" @click="Cart(item.pid)">
                <img :src="'http://127.0.0.1:3000/'+item.img" alt="">
                <p>{{item.title}}<br><br> <b>{{item.integral}}积分</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>销量{{item.frequency}}件</b></p>
            </div>   
        </div>
        <!-- <foot></foot> -->
    </div>
</template>
<script>
//引入顶部子组件
import Header from "./Header"
import Foot from "./Foot"
export default {
    data(){
        return {
            list:[],
            fmily_id:""
        }
    },
    methods:{
        Cart(id){
            // console.log(id);
            this.$router.push({
                path: '/Product',
                query: {
                    pid:id
                }
            })
        },
        loadMore(){
            //功能：获取商品分页数据
            //1、发送数据
            var url="product";
            //创建参数对象
            var obj={fmily_id:this.fmily_id};
            // console.log(obj);
            //发送ajax请求
            this.axios.get(url,{params:obj}).then(res=>{
                var rows=res.data.data;
                this.list=rows;
                // console.log(this.list);
            })
        },
        screen(){
            //功能：商品降序排列
            var fmily_id=this.fmily_id;
            var obj={fmily_id:fmily_id};
            var url="screen";
            this.axios.get(url,{params:obj}).then(res=>{
                var rows=res.data.data;
                this.list=rows;
                // console.log(this.list);
            })
        },
        scree(){
           //功能：商品兑换次数降序排列
            var url="scree";
            var fmily_id=this.fmily_id;
            var obj={fmily_id:fmily_id};
            this.axios.get(url,{params:obj}).then(res=>{
                var rows=res.data.data;
                this.list=rows;
                // console.log(this.list);
            }) 
        }
    },
    created(){
        this.fmily_id=this.$route.query.fmily_id;
        // console.log(this.fmily_id);
        this.loadMore();
    },
    components:{
     //注册顶部标题子组
     "headers":Header,
     "foot":Foot
   }
}
</script>
<style scoped>
    div{
        background:  #efeff4;  
  
    }
    .Bu_2{
        display: flex;
        justify-content: space-between;
        padding: 0 40px;
        height: 53px;
        background: #ffffff;
    }
    a{
        margin-top: 17px; 
    }
    .BU_3{
        height: 124px;
        background: #ffffff;
        display: flex;
        /* justify-content: space-between; */
        font-size: 16px;
        margin: 12px 0;

    }
    .BU_3 b{ 
        color: #fc8f00;
        }
    .BU_3 img{
        display: inline-block;
        height: 90px;
        padding: 17px;
    }
    .BU_3 b:nth-child(2){
        margin-left:50px; 
    }
</style>>