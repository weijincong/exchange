<template>
    <div>
        <fff></fff>
        <div class="pre_1">
            <div class="pre_2" v-for="(item,index) of list" :key="index">
                <p>收货人：{{item.receiver}}&nbsp;&nbsp;{{item.fixedphone}}</p>
                <p class="pre_3">收货地址：{{item.address}}</p>
                <hr>
                <div class="pre_4">
                <label class="am-radio am-warning">
                    <input type="radio" name="radio3" value="1"> 设为默认
                </label>
                <a href="#" class="editButton" @click="edit"><img src="../../../assets/bj.png" width="18">&nbsp;编辑</a>
                <a href="#" class="deleteButton">删除</a>
                </div>
            </div>
            <!-- <div class="pre_2">
                <p>收货人：小王&nbsp;&nbsp;182********</p>
                <p class="pre_3">收货地址：云南省昆明市西山区海口镇A2002</p>
                <hr>
                <div class="pre_4">
                <label class="am-radio am-warning">
                    <input type="radio" name="radio3" value="" data-am-ucheck="" checked=""> 设为默认
                </label>
                <a href="#" class="editButton"><img src="../../../assets/bj.png" width="18">&nbsp;编辑</a>
                <a href="#" class="deleteButton">删除</a>
                </div>
            </div>

            <div class="pre_2">
                <p>收货人：小王&nbsp;&nbsp;182********</p>
                <p class="pre_3">收货地址：云南省昆明市西山区海口镇A2002</p>
                <hr>
                <div class="pre_4">
                <label class="am-radio am-warning">
                    <input type="radio" name="radio3" value="" data-am-ucheck="" checked=""> 设为默认
                </label>
                <a href="#" class="editButton"><img src="../../../assets/bj.png" width="18">&nbsp;编辑</a>
                <a href="#" class="deleteButton">删除</a>
                </div>
            </div>

            <div class="pre_2">
                <p>收货人：小王&nbsp;&nbsp;182********</p>
                <p class="pre_3">收货地址：云南省昆明市西山区海口镇A2002</p>
                <hr>
                <div class="pre_4">
                <label class="am-radio am-warning">
                    <input type="radio" name="radio3" value="" data-am-ucheck="" checked=""> 设为默认
                </label>
                <a href="#" class="editButton"><img src="../../../assets/bj.png" width="18">&nbsp;编辑</a>
                <a href="#" class="deleteButton">删除</a>
                </div>
            </div>

            <div class="pre_2">
                <p>收货人：小王&nbsp;&nbsp;182********</p>
                <p class="pre_3">收货地址：云南省昆明市西山区海口镇A2002</p>
                <hr>
                <div class="pre_4">
                <label class="am-radio am-warning">
                    <input type="radio" name="radio3" value="" data-am-ucheck="" checked=""> 设为默认
                </label>
                <a href="#" class="editButton"><img src="../../../assets/bj.png" width="18">&nbsp;编辑</a>
                <a href="#" class="deleteButton">删除</a>
                </div>
            </div> -->

        </div>
    </div>
</template>
<script>
import Fff from "./Fff"
export default {
    data(){
        return{
            list:[]
            // popupVisible:"bottom"
        }
    },
    methods:{
        //功能一：获取用户收货地址
        loadMore(){
            var url="edit";
            this.axios.get(url).then(res=>{
                var rows=res.data.data;
                this.list=rows;
                console.log(rows);
            })
        },
        edit(){
            this.$router.push("/Bianji");
        }
    },
    created(){
        this.loadMore();
    },
    components:{
     //注册顶部标题子组
     "fff":Fff,
    }
}
</script>
<style scoped>
    .pre_2{
        width: 95%;
        height: 95px;
        border-top-left-radius: 8px;
        border-bottom-left-radius: 8px;
        border-top-right-radius: 8px;
        border-bottom-right-radius: 8px;
        margin: 0 auto;
        border:1px solid #efeff4;
        margin-top: 20px;
    }
    p{
        margin: 0px;
        padding: 10px 20px 0px;
        font-size: 12px;
        color: #666; 
    }
    .pre_3{
        padding: 2px 20px;
        font-size: 12px;
        color: #666;  
    }
    .pre_2{
       height: 97px;
    }
    hr{
       margin: 10px 0;
       border-color: rgba(158, 158, 158, 0.13);
    }
    .pre_4{
        display: flex;
        justify-content: space-between;
        padding: 0 22px;
    }
    .pre_4 .am-radio{
        color: #bbb;
        font-size: 10px;
        margin-top: 4px; 
    }
    .pre_4 a{
        color: #bbb;
        font-size: 10px;
    }
    .pre_4 a:nth-child(3){
        margin-top: 7px; 
    }
</style>