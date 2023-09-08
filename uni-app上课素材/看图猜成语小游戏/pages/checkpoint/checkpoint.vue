<template>
	<view>
			<view class="checkpointList">
				<!-- <view class="itemView" >
					
				</view> -->
				<view class="itemView" v-for="index in appData.length" :key="index" @tap="navigator(index)">
					<view class="item unlock" v-if="index<=unlock">
						<text>{{index+1}}</text>
					</view>
					
					<view class="item" v-else>
						<image src="../../static/lock.png" mode="widthFix" class="img"></image>
					</view>
				</view>
			</view>
	</view>
</template>

<script>
	import appData from "@/utils/data.js"
	const audioContext = wx.createInnerAudioContext();
	audioContext.src = "static/btn.mp3";
	export default {
		data() {
			return {
				appData,
				unlock:1
			};
		},
		onShow() {
			let index = uni.getStorageSync('checkpint')
			if(!index){
				uni.setStorageSync('checkpint',1)
				index = 1
			}
			this.unlock = index
		},
		methods:{
			navigator(index){
				if(index<=this.unlock){
					audioContext.play();
					uni.navigateTo({
						url:"/pages/game/game?index="+index
					})
				}
			}
		}
	}
</script>

<style lang="scss" scoped>
	.grImg{
		position: absolute;
		bottom: 0;
		width: 300rpx;
	}
	.checkpointList{
		padding: 40rpx;
		display: flex;
		flex-wrap: wrap;
		.itemView{
			width: calc(100% / 5);
			height: 0;
			padding-bottom: calc(100% / 5);
			position: relative;
			.item{
				position: absolute;
				left: 10rpx;
				right: 10rpx;
				bottom: 10rpx;
				top:10rpx;
				border-radius: 20rpx;
				border: solid 2px #EE3435;
				background: rgba($color: #ffffff, $alpha: .71);
				box-shadow:rgba(0, 0, 0, 0.4) 0px 2px 6px 0px;
				display: flex;
				justify-content: center;
				align-items: center;
				.img{
					width: 80%;
				}
			}
			.unlock{
				color: #2AB46E;
				border: solid 2px #2AB46E;
				font-size: 32px;
				font-weight: bold;	
				&:active{
					opacity: .8;
				}
			}
		}
	}
	
</style>
