<template>
	<view>
		<swiper autoplay="true" indicator-dots="true" i>
			<swiper-item class="item">a</swiper-item>
			<swiper-item class="item2">a</swiper-item>
			<swiper-item class="item3">a</swiper-item>
		</swiper>
	</view>
</template>

<script>
	export default {
		data() {
			return {
				
			}
		},
		methods: {
			
		}
	}
</script>

<style>
.item{
	height: 200upx;
	background-color: #007AFF;
}
.item2{
	height: 200upx;
	background-color: #ffaa00;
}
.item3{
	height: 200upx;
	background-color: #550000;
}
</style>
