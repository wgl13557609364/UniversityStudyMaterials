<template>
	<view class="app">
		<div class="imgDiv">
			<image :src="logo" mode="aspectFill"></image>
		</div>
		<button type="primary" open-type="getUserInfo" @getuserinfo="mpWxLogin">
			<view class="item column center">
				授权登录
			</view>
		</button>
		<view class="mt20">单独的授权登录页<br />登陆后会跳到操作前的地址</view>
	</view>
</template>

<script>
	import loginMpWx from '@/common/oyyl-mixin/login-mp-wx.js'
	import logo from '@/static/logo.png'
	export default {
		mixins: [loginMpWx],
		data() {
			return {
				logo
			}
		},
		onLoad() {},
		methods: {}
	}
</script>


<style scoped lang='scss'>
	.app {
		text-align: center;
		padding: 20px;
	}

	.imgDiv {
		width: 200rpx;
		height: 200rpx;
		margin: 50px auto;

		image {
			width: 100%;
			height: 100%;
			border-radius: 50%;
		}
	}

	.mt20 {
		margin-top: 20px;
	}
</style>
