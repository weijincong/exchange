<template>
    <div class="ctr_2">
      <heads></heads>
        <div class="ctr_1">
          <div class="ctr" v-for="(item,i) of list" :key="i">
            <a href="javascript:;">
            <p>{{item.title}}</p>
            <img @click="purchase(item.pid)" :src="'http://127.0.0.1:3000/'+item.img" alt="">
            </a>
          </div>
        </div>
    </div> 
</template>
<script>
//引入顶部子组件
import Head from "./Sc"
export default {
    data(){
      return {
        list:[] 
      }
    },
    methods:{
        loadMore(){
            //功能：获取商品分页数据
            //1、发送数据
            var url="pro";
            //创建参数对象
            var obj={pno:this.pno};
            // console.log(obj);
            //发送ajax请求
            this.axios.get(url,{params:obj}).then(res=>{
                var rows=res.data.data;
                this.list=rows;
                // console.log(this .list);
            })
        },
        purchase(id){
            // console.log(id);
            this.$router.push({
                path: '/Beverages',
                query: {
                    fmily_id:id
                }
            })
        }
    },
    created(){
        this.loadMore();
    },
    components:{
     //注册顶部标题子组
     "heads":Head
     //注册底部子组件
    //  "foot":Foot
   }
}
</script>
<style scoped>
    .ctr_2{
        background:  #efeff4;
        padding-bottom: 25px;  
    }
    .ctr{
        width:50%;
        height: 180px;
        display: flex;
        /* justify-content: space-between; */
    }
    .ctr a{
        background: #ffffff;
         border-right: 1px solid #d9d9d9;
        border-bottom: 1px solid #d9d9d9;
        }
    .ctr_1{
      /* margin-top: 10px; */
      display: flex;
      flex-wrap:wrap; 
    }
    .ctr p{
        width: 100%;
        font-size: 18px;
        color: #333333;
        padding-left: 25px; 
        margin: 0;
        padding-top: 12px;
    }
    .ctr img{
        width: 131px;
        height: 131px;
        padding: 5px 28px; 
    }
</style>