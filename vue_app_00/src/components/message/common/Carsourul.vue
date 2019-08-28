<template>
    <div>
        <!-- 头部导航 -->
        <Nav></Nav>
        <mt-swipe :auto="4000" class="d0" >
            <mt-swipe-item class="d1">
                <img src="../../../assets/banner1.jpg" alt="">
            </mt-swipe-item>
            <mt-swipe-item class="d2">
                <img src="../../../assets/banner2.jpg" alt="">
            </mt-swipe-item>
            <mt-swipe-item class="d3">
                <img src="../../../assets/banner3.jpg" alt="">
            </mt-swipe-item>
        </mt-swipe>
        <div class="classify">
            <a href="#">
            <img src="../../../assets/ico5.png" alt="">
            <p>新品专区</p>
            </a>
            <a href="#">
               <img src="../../../assets/icon2.png" alt="">
            <p  class="d4">活动专区</p>
            </a>
            <a href="#" @click="jifenChou">
               <img src="../../../assets/ico2.png" alt=""> 
            <p>积分抽奖</p>
            </a>
        </div>
        <div class="activity">
              <span>活动专区</span>
              <a href="#">
                  <img src="../../../assets/timg (1).jpg" alt="">
              </a>
        </div>
    
        <div class="nes">
            <div>
                <span>新品专区</span>
            </div>
                <!-- 第一个 -->
        <div class="n1">
             <div class="n" v-for="(item1,index) of list" :key="index">
				<img @click="Jump(item1.pid)" :src="'http://127.0.0.1:3000/'+item1.img" alt="">
			    <p class="nn">{{item1.title}}</p>
				<p>积分: <a href="javascript:;">{{item1.integral}}</a></p>
            </div>
        </div> 

        </div>
                <div class="nes">
            <span>新品水果</span>
                <!-- 第一个 -->
        <div class="n1">
             <div class="n" v-for="(item,a) of list1" :key="a">
				<img @click="Jump(item.pid)" :src="'http://127.0.0.1:3000/'+item.img" alt="">
			    <p class="nn">{{item.title}}</p>
				<p>积分: <a href="javascript:;">{{item.integral}}</a></p>
            </div>
        </div>  


        </div>

        <div class="nes">
            <span>新品零食</span>
                <!-- 第一个 -->
        <div class="n1">
             <div class="n" v-for="(item2,b) of list2" :key="b">
				<img @click="Jump(item2.pid)" :src="'http://127.0.0.1:3000/'+item2.img" alt="">
			    <p class="nn">{{item2.title}}</p>
				<p>积分: <a href="javascript:;">{{item2.integral}}</a></p>
            </div>
        </div>  


        </div>

                <div class="nes">
            <span>新品家居</span>
                <!-- 第一个 -->
        <div class="n1">
             <div class="n" v-for="(item3,c) of list3" :key="c">
				<img @click="Jump(item3.pid)" :src="'http://127.0.0.1:3000/'+item3.img" alt="">
			    <p class="nn">{{item3.title}}</p>
				<p>积分: <a href="javascript:;">{{item3.integral}}</a></p>
            </div>
        </div>  


        </div>
    </div>
    
</template>
<script>
//<!--1:引入nav-->
import nav from "./nav"
export default {
    data(){
        return {
            list:[],//商品列表数组
            pno:1 ,  //页码(第几页)
            list1:[],
            list2:[],
            list3:[]
        }
    },
    methods:{
        jifenChou(){
                window.location.href="http://127.0.0.1:5500/vue_app_00/src/jiFencj/dzpcj.html";
        },
        loadMore(){
            //功能：获取商品分页数据
            //1、发送数据
            var url="xphd";
            //创建参数对象
            var obj={pno:this.pno};
            // console.log(obj);
            //发送ajax请求
            this.axios.get(url,{params:obj}).then(res=>{
                var rows=res.data.data;
                this.list=rows;
                // console.log(this.list);
            })
        },
        load(){
            //功能：获取商品分页数据
            //1、发送数据
            var url="xpsg";
            //创建参数对象
            // var obj={pno:this.pno};
            // console.log(obj);
            //发送ajax请求
            this.axios.get(url).then(res=>{
                var rows=res.data.data;
                this.list1=rows;
                // console.log(this.list1);
            })
        },
        loads(){
            //功能：获取商品分页数据
            //1、发送数据
            var url="xpls";
            //创建参数对象
            // var obj={pno:this.pno};
            // console.log(obj);
            //发送ajax请求
            this.axios.get(url).then(res=>{
                var rows=res.data.data;
                this.list2=rows;
                // console.log(this.list2);
            })
        },
        loa(){
            //功能：获取商品分页数据
            //1、发送数据
            var url="xpsp";
            //创建参数对象
            // var obj={pno:this.pno};
            // console.log(obj);
            //发送ajax请求
            this.axios.get(url).then(res=>{
                var rows=res.data.data;
                this.list3=rows;
                // console.log(this.list3);
            })
        },
        Jump(id){
            // console.log(id);
            this.$router.push({
                path: '/Product',
                query: {
                    pid:id
                }
            })
        }
    },
    created(){
        this.loadMore();
        this.load();
        this.loads();
        this.loa();
    },
    components:{
     //注册顶部标题子组
     "Nav":nav
   }
}
</script>
<style scoped>
    .d0{
        height: 210px;
        
    }
    .d1 img,.d2 img,.d3 img{
        height: 175px;
        width: 100%;
        position: relative;
        top:23%;
    }
    .classify{
        display: flex;
        color: #000000;
        justify-content: space-between;
        align-items: center;
        background-color: #ffffff;
        height: 99px;
        padding:0 20px;
    }
    .classify img{
        width: 55px;
        height: 55px;
    }
    .classify img:nth-child(1){
        padding-left: 5px;
    }
    .classify a p{
        position: relative;
        margin: 0px;    
    }
    .activity{
        width: 100%;
        height: 170px;
        background-color: #efeff445;
    }
    span{
        display: flex;
        justify-content: center;
        line-height: 3.2rem;
        color: #000000;
        position: relative;
        padding: 0 3%;
        background-color: #efeff445;
        font-size: -0.55rem;
        margin-top: 10px;   
    }
    .activity img{
        width: 100%;
        height: 130px;
    }
    .nes .n1 div{
        width:33%;
        border-right:1px solid#efeff4;
        border-bottom:1px solid#efeff4;
    }
    .nes .n1{
        display: flex;
        justify-content: space-between;
        flex-wrap:wrap; 
        /* border:1px solid red; */
    }
    .nes .nn{
        width:85px;
        height:25px;
        overflow: hidden;
        text-overflow: ellipsis;
        white-space: nowrap;
  
        font-size:14px;
    }
    .nes .n p{
        font-size:14px;
        padding: 0 10px;
    }
    .nes img{
        width: 97px;
        height: 97px;
        padding-left: 11px;  
    }
    p{
        margin-bottom: 0px;
        color: gray;
    }
    p a{
        font-size: 12px;
        color: red;
    }
    .n p:nth-child(3){
        margin-top:0px;
        padding-bottom:5px;
    }
</style>