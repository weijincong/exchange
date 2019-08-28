<template>
    <div>
        <spxq></spxq>
        <div  class="odr" v-for="(items,i) of listr" :key="'BU_3'+i">
            <div class="odr_1" v-for="(item,index) of list" :key="index">
                    <a href="javascript:;" class="odr_3">
                        <img src="../../../assets/hongjiuchengicondizhi.png" alt="">
                    </a>

                <div class="odr_2">
                   <p class="tit">
		    		<b>收货人</b>&nbsp;{{item.receiver}}&nbsp;&nbsp;&nbsp;&nbsp;{{item.fixedphone}}	
		    	   </p>
                    <p class="fu-tit">
		    			收货地址：{{item.address}}
		    		</p>
                </div>

                    <a href="javascript:;" class="odr_4">
                        <img src="../../../assets/fenye-xiayiye.png" alt="">    
                    </a> 
                </div>
            <!--  -->
             <div class="BU_3">
                <img :src="'http://127.0.0.1:3000/'+items.img" alt="">
                <p>{{items.title}}<br><br> <b>{{items.integral}}积分</b></p>
                <a href="#" class="BU_4">x{{count}}</a>
            </div> 
            <!--  -->
            <div class="odr_5">
                <p>购买数量</p>
                <ul>
                    <li>
                        <img @click="reduce" src="../../../assets/jian.jpg" alt="">
                    </li>
                    <li>{{count}}</li>
                    <li><img @click="plus" src="../../../assets/jia.jpg" alt=""></li>
                </ul>
            </div>
            <div class="odr_6">
                <p>配送方式</p>
                <p>快递 免邮</p>
            </div>
            <div class="odr_7">
                <p></p>
                <p class="fr">共{{count}}件商品   合计<samp>{{items.integral*count}}积分</samp></p>
            </div>
            <div class="odr_8" v-for="(ite,a) of lis" :key="'BU_3'+a">
                <div class="zuo">
	    		    剩余积分：<span>{{ite.integral}}</span>
	    	    </div>  
                <a href="javascript:;" class="fl" @click="submission" :data-integr="items.integral*count" :data-integrals="ite.integral">
	    		    提交订单
	    	    </a>
            </div>
        </div>
    </div>
</template>
<script>
import Spxq from './Spxq'
export default {
    data(){
        return{
            list:[],
            pid:"",
            listr:[],
            lis:[],
            count:1
        }
    },
    methods:{
        order(){
            //创建请求的URL
            var url="order";
            this.axios.get(url).then(res=>{
                // console.log(res);
                if(res.data.code==-1){
                    this.$toast("请先登录");
                    this.$router.push("/Login");
                }
                this.list=res.data.data;
                // console.log(this.list);
            })
        },
        orders(){
            //获取页面数据pid
            var pid=this.pid;
            // console.log(pid);
            var obj={pid:pid};
            var url="orders";
            //发送请求
            this.axios.get(url,{params:obj}).then(res=>{
                this.listr=res.data.data;
                // console.log(this.listr);
            })
        },
        reduce(){
            if(this.count>1){
                this.count--;
            }else{
                this.$toast("至少兑换一件商品");
                return;
            }
        },
        plus(){
            if(this.count<10){
                this.count++;
            }else{
                this.$toast("至多兑换十件商品");
                return;
            }
        },
        ord(){
            var url="ord";
            //发送请求
            this.axios.get(url).then(res=>{
                this.lis=res.data.data;
                // console.log(this.lis);
            })
        },
        submission(e){
            var integr=Number(e.target.dataset.integr);
            var integrals=Number(e.target.dataset.integrals);
            var integral="";
            // console.log(integr,integrals);
            var url="submission";
            if(integr<integrals){
                integral=integrals-integr;
                this.axios.get(url,{params:{integral:integral}}).then(res=>{
                    this.ord();
                    this.$toast("兑换成功");
                    // console.log(res);
                })
            }else{
                this.ord();
                this.$toast("积分不足");
            }
        }
    },
    created(){
        this.pid=this.$route.query.lid;
        this.order();
        this.orders();
        this.ord();
        // console.log(this.pid);
    },
    components:{
        "spxq":Spxq
    }
}
</script>
<style scoped>
    .odr{
        background:  #efeff4;  
        /* height: 685px; */
    }
    .odr_1{
        height: 104px;
        display: flex;
        justify-content: space-between;
        background: #ffffff;
    }
    .odr_3 img,.odr_4 img{
        width: 17px;
        height: 17px;
        margin: 50px 10px;
    }
    .odr_2{
        width: 80%;
        height: 91px;
        margin: 0 auto;
    }
    .odr_2 .tit{
        margin-bottom:0; 
        color: #333333;
    }
    .fu-tit{
        margin-bottom: 0px;
        font-size: 15px;
    }
        .Bu_2{
        display: flex;
        justify-content: space-between;
        padding: 0 40px;
        height: 53px;
        background: #ffffff;
    }
    .BU_3{
        height: 124px;
        background: #ffffff;
        display: flex;
        justify-content: space-between;
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
    .BU_4{
        padding: 68px 5px;
        color: #999999;
    }
    .odr_5,.odr_6,.odr_7,.odr_8{
        height: 53px;
        display: flex;
        justify-content: space-between;
        background: #ffffff;
        padding: 0 10px;
        border-bottom: 1px solid #dfdfdf;
    }
 
    .odr_5 ul{
        margin-left:-38px;
    }
    .odr_5 ul li{
        float: left;
    }
    .odr_5 ul li img{
        width: 20px;
        height: 17px;
    }
    li{
        list-style: none;
    }
    samp{
        color: #f44623;
    }
    .zuo{
        padding: 19px 0;
        font-size: 18px;
    }
    span{
           color: #ff4141;
    }
    .fl{
        padding: 16px 35px;
        background: #00cc7d;
        color: #ffffff;
    }
</style>