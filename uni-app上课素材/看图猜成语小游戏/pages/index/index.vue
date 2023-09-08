<template>
	<view class="content">
		<view class="logo">
				<image class="img" src="../../static/logo.png" mode="widthFix"/>
		</view>
		<view class="coverImg">
			<image src="../../static/fm.png" mode="widthFix"></image>
		</view>
		<view class="btn">
			<view class="startGameBtn" @tap="startGame">
					开始游戏
			</view>
		</view>
	</view>
</template>

<script>
	const audioContext = wx.createInnerAudioContext();
	audioContext.src = "static/btn.mp3";
	export default {
		data() {
			return {
				title: 'Hello'
			}
		},
		onLoad() {

		},
		methods: {
			startGame(){
				audioContext.play();
				uni.navigateTo({
					url:'/pages/checkpoint/checkpoint'
				})
			}
		}
	}
</script>

<style scoped lang="scss">
	.logo{
		margin-top: 200rpx;
		width: 100%;
		display: flex;
		justify-content: center;
		.img{
			width: 80%;
		}
	}
	.coverImg{
		margin-top: 200rpx;
		display: flex;
		justify-content: center;	
	}
	.btn{
		width: 100%;
		display: flex;
		margin-top: 150rpx;
		justify-content: center;
		.startGameBtn{
			width: 70%;
			height: 80rpx;
			background: #E64340;
			color: white;
			border-radius: 50px;
			text-align: center;
			line-height: 80rpx;
			&:active{
				opacity: .8;
			}
		}
	}
</style>
