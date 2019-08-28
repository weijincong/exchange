<template>
    <div>
        <header class="mint-header is-fixed grtop">
            <div class="mint-header-button is-left" >
                <a href="" class="router-link-active">
                    <button class="mint-button mint-button--default mint-button--normal">
                        <span class="mint-button-icon">
                            <i class="mintui mintui-back fanHui"></i>
                        </span>
                    </button>
                </a>
            </div>
            <h1 class="mint-header-title topGrxx">
                个人信息
            </h1>
        </header>
       <header class="mint-header toux">
           <div class="mint-header-button is-left">
               <a href="" class="router-link-active">
                   <button class="mint-button mint-button--default mint-button--normal">
                       <label class="mint-button-text ziTi">
                           头像
                       </label>
                   </button>
               </a>
           </div>
           <div class="is-right rz-picter">

               <img src="images/2.png" alt="" class="tuPian">
           </div>
       </header>
        <div class="bdxian"></div>
        <div class="niChen mint-header">
            昵称
            <div class="niChenNum"><input type="text" class="niChenNum01" v-model="uname"></div>
        </div>
        <div class="bdxian"></div>
        <div class="aGe mint-header">
            性别
            <div class="age1">
                <a href="" class="mint-cell">
                <div class="mint-cell-left"></div>
                <div class="mint-cell-wrapper">
                    <div class="mint-cell-title">
                <label class="am-radio am-warning">
                    <input type="radio" name="radio3" v-model="value" value="1"> 男
                </label>
                <label class="am-radio am-warning">
                    <input type="radio" name="radio3" v-model="value" value="0"> 女
                </label>
                    </div>
                </div>
            </a>
            </div>
        </div>
        <div class="birthDay mint-header">
            出生日期
            <div class="birthDay1">
                <div class="mint-cell-value">
                    <input placeholder="请输入生日" v-model="birthday" type="date" class="mint-field-core">
                </div>
            </div>
        </div>
        <div class="bdxian"></div>
        <div class="bangDingphone mint-header">
            绑定新手机
            <div class="bangDingphone1">
                <input placeholder="请输入手机号" type="tel" class="mint-field-core" v-model="phone">
            </div>
        </div>
        <div class="upWdxiugai mint-header">
            修改密码
              <div class="bangDingphone1">
                  <input placeholder="请输入密码" type="password" class="mint-field-core" v-model="pwd">
              </div>
        </div>
        <div class="kongBai"></div>
        <mt-button @click="modify" class="mint-button mint-button--default mint-button--large is-disabled">
            <label class="mint-button-text diBuxiugai">
                确认修改
            </label>
        </mt-button>
    </div>
</template>
<script>

    export default {
        components:{},
        data(){
            return{
                phone:"",
                pwd:"",
                birthday:"",
                value:"",
                uname:""
            };

        },
        methods:{
            modify(){
                var ph=this.phone;
                var p=this.pwd;
                var birthday=this.birthday;
                var sex=this.value;
                var uname=this.uname;
                var obj={phone:ph,pwd:p,birthday:birthday,sex:sex,uname:uname}
                //3、创建正则表达式验证用手机号和密码
                var reg=/^1([38][0-9]|4[579]|5[0-3,5-9]|6[6]|7[0135678]|9[89])\d{8}$/g;
                var regs=/[a-z0-9]{6,16}/
                //4、用户名验证失败  提示短消息
                if(!reg.test(ph)){
                    this.$toast("手机号格式不正确");
                    return;//失败停止执行
                }else if(!regs.test(p)){//5、密码验证失败  提示消息
                    this.$toast("密码格式不正确");
                    return; //失败停止运行
                }else{//6、发送ajax请求  axios
                    this.axios.get("modify",{params:obj}).then(res=>{
                        this.$toast("修改成功");
                        this.$router.push("/Login");
                    })
                }
            }
        }
    }
</script>
<style scoped>
    /* kk-icon{

    } */
.fanHui{
    color: #0f0f0f;
}
    .grtop{
        background-color: #ffffff;
    }
.toux{
    background-color: #ffffff;
    margin-top: 40px;
    height: 80px;
    border-top: 2px solid #f2f1f1;
}
    .ziTi{
        color: #0f0f0f;
        font-size: 20px;
    }
    .tuPian{
        margin-right: 20px;
    }
.bdxian{
    width:100% ;
    display: flex;
    height: 10px;
    background-color:#f2f1f1;

}
    .mint-header{
        display: flex;
        justify-content: space-between;
        flex-wrap: wrap;
    }
    .niChen{
        width: 100%;
        height: 50px;
        display: flex;
        border-bottom: 2px solid #f2f1f1;
        background-color: #ffffff;
        color: #0f0f0f;
    }
    .niChenNum{
        float: right;
    }
    .aGe{
        width: 100%;
        height: 50px;
        display: flex;
        border-bottom:  2px solid #f2f1f1;
        background-color: #ffffff;
        color: #0f0f0f;

    }
    .age1{
        color: #bbb;
        margin-right: 20px;
    }
    .birthDay{
        width: 100%;
        height: 50px;
        display: flex;
        border-bottom:  2px solid #f2f1f1;
        background-color: #ffffff;
        color: #0f0f0f;
    }
    .birthDay1{
        color: #bbb;
        margin-right: 20px;
    }
    .bangDingphone{
        width: 100%;
        height: 50px;
        display: flex;
        border-bottom:  2px solid #f2f1f1;
        background-color: #ffffff;
        color: #0f0f0f;
    }
/* .bangDingphone1{
    /*margin-right: 20px;
} */
    .bangDingphone2{
        /*width: 20px;*/
        /*height: 20px;*/
        margin-left: 10px;
    }
    .upWdxiugai{
        width: 100%;
        height: 50px;
        display: flex;
        border-bottom:  2px solid #f2f1f1;
        background-color: #ffffff;
        color: #0f0f0f;
    }
 .kongBai{
     width: 100%;
     height: 220px;
     display: flex;
     background-color: #f2f1f1;
 }
    .diBuxiugai{
        color: #007aff;
    }
    .niChenNum01{
        outline: none;
        text-align: center;
        width: 100px;
        height: 20px;
        border: none;
        margin-right: 20px;
    }
    .topGrxx{
        font-size: 20px;
        text-align: center;
        margin-right: 90px;
        color: #0f0f0f;
    }
</style>