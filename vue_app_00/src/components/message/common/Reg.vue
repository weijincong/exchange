<template>
    <div>
        <zhuce></zhuce>
        <!--1、用户名输入框-->
        <mt-field label="用户名" :placeholder="unameholder" v-model="uname" :attr="{maxlength:12}"></mt-field>
        <!--2、密码输入框-->
        <mt-field label="密码" :placeholder="upwdholder" v-model="upwd" :attr="{maxlength:16}" type="password"></mt-field>
        <!--3、验证码输入框-->
        <mt-field label="验证码" v-model="yz" :placeholder="holder" @focus.native.capture="checkCard"></mt-field>
        <!--4、随机生成验证码-->

        <!--5、登录按钮-->
        <mt-button size="large" @click="reg">注册</mt-button>
        <div @click="refreshCode" v-show="yc">
            <s-identify :identifyCode="identifyCode" v-model="yz"></s-identify>
            <a href="#" class="yz">看不清&nbsp;换一张！！！</a>
        </div>
    </div>
</template>

<script>
import Identify from "./Identify"
import Zhuce from "./Zhuce"
export default {
  name: "codetest",
  data() {
    return {
      identifyCodes: "1234567890qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM",
      identifyCode: "",
      unameholder:"请输入用户名",
      uname:"",
      upwdholder:"请输入密码",
      holder:"请输入验证码",
      upwd:"",
      yz:"",
      yc:false,
      identifyCode:"",
    };
  },
  mounted() {
    this.identifyCode = "";
    this.makeCode(this.identifyCodes, 4);
  },
  components:{
        "s-identify":Identify,
        "zhuce":Zhuce
  },
    methods: {
        checkCard() {
            this.yc=true;
        },
        Card(){
            this.yc=false;
        },
        randomNum(min, max) {
            return Math.floor(Math.random() * (max - min) + min);
        },
        refreshCode() {
            this.identifyCode = "";
            this.makeCode(this.identifyCodes, 4);
        },
        makeCode(o, l) {
            for (let i = 0; i < l; i++) {
                this.identifyCode += this.identifyCodes[
                    this.randomNum(0, this.identifyCodes.length)
                ];
            }
            this.identifyCode=this.identifyCode.toLowerCase();
            console.log(this.identifyCode);
        },
        reg(){
            //功能：完成用户注册操作
            //1、获取用户输入的用户名
            var u=this.uname;
            //2、获取用户输入密码
            var p=this.upwd;
            //3、创建正则表达式验证用户名和密码
            var reg=/^[\u4e00-\u9fa5a-z0-9]{2,12}/g;
            var regs=/[a-z0-9]{6,16}/
            //4、用户名验证失败  提示短消息
            if(!reg.test(u)){
                this.$toast("用户名格式不正确");
                return;//失败停止执行
            }else if(!regs.test(p)){//5、密码验证失败  提示消息
                this.$toast("密码格式不正确");
                return; //失败停止运行
            }else{//6、发送ajax请求  axios
                var url="reg";
                var obj={uname:u,upwd:p};
                this.axios.get(url,{params:obj}).then(res=>{
                    //7、获取服务器返回的结果
                    console.log(res);
                    //注册失败 提示
                    if(res.data.code==-1){
                        this.$toast("用户名或者密码错误")
                    }else{
                        //登录成功  跳转到首页组件
                        //vue 当一个组件执行完毕需要跳转到首页组件
                        if(this.identifyCode==this.yz){
                            this.$router.push("/Login")
                        }else{
                            //提示验证码错误
                            this.$toast("验证码不正确");
                        }
                    }
                })
            }    
        },
    }
};
// Vue.directive('mintblur', { // 暂不使用directive实现blur事件了，使用@blur.native.capture="cardNoBlur"即可。
//     inserted: function(el, pra, a) {
//         let oInput = el.querySelector('input');
//             console.log('oInput', oInput);
//             oInput.onfocus = function() {
//             // 创建focus的事件
//         };
//         oInput.onblur = function() {
//             console.log('blu1r');
//             this.$emit(pra.expression);
//         };
//     }
// })
</script>

<style>
    .yz{
        position: relative;
        left: 50%;
        top: -30px;
    }
</style>
