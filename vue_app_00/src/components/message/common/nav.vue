<template>
    <div class="page-head">
        <img src="../../../assets/logo00.png" alt="">
        <mt-button type="primary" class="shou">首页</mt-button>
        <mt-button type="primary" class="btn" @click="Sign">签到</mt-button>
    </div>
</template>
<script>
export default {
    data(){
        return{
            
        }
    },
    methods:{
        Sign(){
            window.location.href="http://127.0.0.1:5500/vue_app_00/src/qianDao/riLi.html";
        }
    }
}
</script>
<style scoped>
    .page-head{
        display: flex;
        position: fixed;
        z-index: 999;
        width: 100%;
        color: #ffffff;
        justify-content: space-between;
        align-items: center;
        background-color: #26a2ff;
        height: 48px;
     
    }
    .btn{
        font-size:12px;  
    }
    img{
        width: 55px;
        height: 50px;
        padding-left: 5px;
    }
    .shou {
        font-size:18px;
    }
</style>