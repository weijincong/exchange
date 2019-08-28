<template>
  <!--子组件功能:完成底部导航条图标切换-->
  <div>
     <img :src="focused?selectedImage:normalImage" class="imgstyle" />
     <!--1:显示一张图片-->
     <!--如果当前选中状态显示 选中图片-->
     <!--如果当前默认状态显示 默认图片-->
  </div>
</template>
<script>
export default {
   props:{
     focused:false,//状态默认 false
     selectedImage:{default:""},//选中图片
     normalImage:{default:""}//默认图片
   }
}
</script>
<style scoped>
.imgstyle{
  width:30px;
  height:30px;
}
</style>
