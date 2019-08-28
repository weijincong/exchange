<template>
    <mt-header title="商品订单" class="headers">
        <router-link to="" slot="left">
            <mt-button icon="back" @click="$router.back(-1)">返回</mt-button>
        </router-link>
    </mt-header>
</template>

<style scoped>
    .headers{
        height: 48px; 
    }
</style>