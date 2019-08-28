<template>
    <div class="me">
        <wde></wde>
        <div class="me_1">
            <div class="me_2">
                <div class="me_3" v-for="(item,i) of list" :key="i">
                    <img src="../../../assets/user.png" alt="">
                    <h4>{{item.uname}}</h4>
                    <p><span>积分：<i>{{item.integral}}</i></span>&nbsp;&nbsp;<span>会员号：<i>1464675</i></span></p>
                </div>
                <a href="#"><img @click="Profile" src="../../../assets/fenye-xiayiye.png" alt=""></a>
            </div>
            <div class="me_4">
                <div class="me_5">
                    <a href="">
                    <img src="../../../assets/qiandao.png" alt=""> <br>
                    <i class="i">每日抽奖</i>
                    </a>
                    <a href="">
                    <img src="../../../assets/choujiang.png" alt=""> <br>
                    <i class="i">辛运抽奖</i>
                    </a>
                    <a href="">
                    <img src="../../../assets/fenxiang.png" alt=""> <br>
                    <i class="i">链接分享</i>
                    </a>
                    <a href="">
                    <img src="../../../assets/duihuanjilu.png" alt=""> <br>
                    <i class="i">兑换记录</i> 
                    </a>
                    <a href="">
                    <img src="../../../assets/bangzhuzhongxin-.png" alt=""> <br>
                    <i class="i">帮助中心</i>
                    </a>
                    <a href="">
                    <img src="../../../assets/yijianfankui.png" alt=""> <br>    
                    <i class="i">意见反馈</i>
                     </a>
                </div>
            </div>
                <div class="me_6">
                    <a href="javastript:;" @click="asas">
                        <img src="../../../assets/hongjiuchengicondizhi.png" alt="">    
                        <i class="i2">收货地址</i>
                    </a>
                </div>
                <mt-button size="large" @click="login" class="logo">登录</mt-button>
                <mt-button size="large" @click="reg" class="reg">注册</mt-button>
        </div>
    </div>
</template>
<script>
import Wde from './Wde'
export default {
    data(){
        return{
            list:[]
        }
    },
    methods:{
        login(){
            this.$router.push("/Login");
        },
        Profile(){
            this.$router.push("/Grzl");
        },
        reg(){
            this.$router.push("/reg");
        },
        huqu(){
            var url="hqu";
             this.axios.get(url).then(res=>{
                var rows=res.data.data;
                this.list=rows;
                // console.log(this.list);
            })
        },
        asas(){
            this.$router.push("/Bianji");
        }
    },
    created(){
        this.huqu();
    },
    components:{
     //注册顶部标题子组
     "wde":Wde
     //注册底部子组件
    //  "foot":Foot
   }
}
</script>
<style scoped>
    .me{
        background: #efefef;
    }
    .me_2{
        height: 175px;
        background: url("../../../assets/vip_bg1.jpg");
        background-size: 100% 220px;
         display: flex;
        justify-content: space-between;
    }
    .me_2 a img{
        padding: 72px 7px;
    }
    .me_3{
        width: 375px;
        height: 115px;
        position: relative;
        top: 30px;
        
    }
    .me_3 img{
        width: 100px;
        height: 100px;
        border-radius: 50%;
        margin: 8px 15px;
    }
    h4{
        margin: 0;
        position: absolute;
        top: 52px;
        left: 37%;
    }
    p{
        margin: 0;
        position: absolute;
        top: 87px;
        left: 37%;
        width: 235px;
    }
    i{
        color: #ffc601;
        font-style: normal;
    }
    .me_5{
        width: 90%;
        height: 160px;
        border: 1px solid #d9d9d9;
        border-top-left-radius: 10px;
        border-bottom-left-radius: 10px;
        border-top-right-radius: 10px;
        border-bottom-right-radius: 10px;
        margin: 0 auto; 
        margin-top: 20px; 
        display: flex;
        justify-content: space-between;
        flex-wrap: wrap; 
        background: #ffffff;
    }
    .me_5 a img{
        width: 30px;
        height: 30px;
        margin: 33px;
        margin-top: 12px; 
        margin-bottom: 0; 
    }
    .me_5 a  .i{
       margin-left: 20px;
       color: #000000;
    }
    .me_6{
        border-bottom: 1px solid #d9d9d9;
        margin: 0 auto;
        margin-top: 10px;
        padding: 16px 2px; 
        background: #ffffff;
    }
    .me_6 .i2{
        position: relative;
        top: -7px;
        left: 5px;
        color: #000000;
        font-size: 20px; 
    }
    .me_6 img{
        padding-left: 25px; 
    }
    .logo{
        margin-top:39px;
    }
    .reg{
        margin-top:5px;
    }
</style>