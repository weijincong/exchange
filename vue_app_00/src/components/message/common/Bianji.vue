<template>
    <div>
        <header class="mint-header is-fixed bianDing">
<!--            <div class="mint-header-button is-left" >-->
<!--                <a href="" class="router-link-active">-->
<!--                    <button class="mint-button mint-button&#45;&#45;default mint-button&#45;&#45;normal">-->
<!--                        <span class="mint-button-icon">-->
<!--                            <i class="mintui mintui-back fanHui"></i>-->
<!--                        </span>-->
<!--                    </button>-->
<!--                </a>-->
<!--            </div>-->
            <h1 class="mint-header-title bianJitop">
                修改收货地址
            </h1>
        </header>
        <div class="lab">
            <div class="layui-m-layercont">
                <div class="shade_content_div">   
                    <div class="shade_from">             
                        <div>
                            <mt-field label="详细地址" :placeholder="addressholder" v-model="address"></mt-field>                
                        </div>        
                        <div>
                            <mt-field label="邮政编号" :placeholder="number_thisr" v-model="number_this"></mt-field>            
                        </div>       
                        <div>
                            <mt-field label="姓名" :placeholder="full_name" v-model="full"></mt-field>          
                        </div>         
                        <div>
                            <mt-field label="手机" :placeholder="phones" v-model="phone"></mt-field>
                        </div>     
                    </div>   
                </div>
            </div>
        </div>
        <button class="mint-button mint-button--default mint-button--normal" @click="adda">
            <label class="mint-button-text">
                <font style="vertical-align: inherit;">
                    <font style="vertical-align: inherit;">取消</font>
                </font>
            </label>
        </button>
        <button class="mint-button mint-button--default mint-button--normal" @click="add">
            <label class="mint-button-text">
                <font style="vertical-align: inherit;">
                    <font style="vertical-align: inherit;">确认</font>
                </font>
            </label>
        </button>
    </div>
</template>

<script>
    export default {
        components:{},
        data(){
            return{
                addressholder:"请输入您的详细地址",
                address:"",
                number_thisr:"请输入您的邮政编号",
                number_this:"",
                full_name:"请输入您的真实姓名",
                full:"",
                phones:"请输入您的手机",
                phone:""
            };

        },
        methods:{
            add(){
                //获取用户名
                var a=this.address;
                var n=this.number_this;
                var f=this.full;
                var p=this.phone;
                var url="address";
                //创建正则表达式验证电话号码
                var regs=/^1[3456789]\d{9}$/i;
                if(!regs.test(p)){
                    this.$toast("手机号码格式不正确");
                    return
                }else{
                    this.axios.get(url,{params:{a:a,n:n,f:f,p:p}}).then(res=>{
                        if(res.data.code==-1){
                            this.$toast("修改失败")
                        }else{
                            this.$toast("修改成功")
                        }
                    })
                }
            },
            adda(){
                this.$router.go(-1);
            }
        }
    }
</script>
<style scoped>
    button{
        /*display: block;*/
        width: 50%;
        height: 52px;
        color:#007aff;
    }
    .bianJitop{
        font-size: 20px;
    }
    .bianDing{
        height: 50px;
    }
    a{
        border-bottom: 1px solid #f2f1f1;
    }
    .lab{
        margin-top:50px;
    }
    .layui-m-layercont {
    padding: 50px 30px;
    line-height: 22px;
    text-align: center;
    }
    .shade_content_div {
        height: 100%;
        width: 100%;
    }
    .layui-m-layercont {
        padding: 50px 30px;
        line-height: 22px;
        text-align: center;
    }
    .shade_content_div .shade_from {
        margin-top: 20px;
    }
    .shade_content_div .shade_from > div:not(:last-child) {
        margin-bottom: 10px;
    }
    .layui-m-layercont {
        padding: 50px 30px;
        line-height: 22px;
        text-align: center;
    }
    .shade_content_div .input_style {
        height: 30px;
        border-radius: 5px;
        width: 70%;
        outline: 0px;
        border: 1px solid #CCCCCC;
    }
    .layui-m-layer * {
        -webkit-box-sizing: content-box;
        -moz-box-sizing: content-box;
        box-sizing: content-box;
    }
    input, textarea, select, option, button, form, fieldset {
        margin: 0;
        padding: 0;
        border-width: 1px;
        outline: none;
        -moz-box-sizing: content-box;
        -webkit-box-sizing: content-box;
        -o-box-sizing: content-box;
        -ms-box-sizing: content-box;
        box-sizing: content-box;
    }
    input, label {
        -webkit-tap-highlight-color: rgba(255, 0, 0, 0);
    }
</style>