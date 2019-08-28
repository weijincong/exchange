<template>
    <div>
        <wde></wde>
        <!--1、用户名输入框-->
        <mt-field label="用户名" :placeholder="unameholder" v-model="uname" :attr="{maxlength:12}"></mt-field>
        <!--2、密码输入框-->
        <mt-field label="密码" :placeholder="upwdholder" v-model="upwd" :attr="{maxlength:16}" type="password"></mt-field>
        <!--3、引入滑动验证-->
        <logins v-show="play"></logins>
        <!--4、登录按钮-->
        <mt-button size="large" @click="login">登录</mt-button>
    </div>
</template>
<script>
//引入子组件silde-vertfy
import Logins from "../../../login/src/lib/Logins"
import Wde from './Wde'
export default {
    data(){
        return{
            unameholder:"请输入用户名",
            uname:"",
            upwdholder:"请输入密码",
            upwd:"",
            play:false,
        }
    },
    components:{
        "logins":Logins,
        "wde":Wde
    },
    methods:{
        login(){
            //功能：完成用户登录操作
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
                var url="login";
                var obj={uname:u,upwd:p};
                this.axios.get(url,{params:obj}).then(res=>{
                    //7、获取服务器返回的结果
                    console.log(res);
                    //登录失败 提示
                    if(res.data.code==-1){
                        this.$toast("用户名或者密码错误")
                    }else{
                        //将登录成功
                        //vue 当一个组件执行完毕需要跳转到首页组件
                        this.play=true;
                    }
                })
            }    
        }
    },
    created(){
        console.log(window.history.length);
    }
}
</script>
<style scoped>
    
</style>