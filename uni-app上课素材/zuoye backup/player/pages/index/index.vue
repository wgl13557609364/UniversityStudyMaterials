<template>
	<view class="content" :style="{height:windowHeight}">
		<view class="word">
			<text>我爱我的祖国</text>
		</view>
		<!-- videodisc -->A
		<view class="player-videodisc">
			<image src="../../static/images/videodisc.png" mode=""></image>
		</view>
		<!-- optBar -->
		<view class="play-opt-bar">
			<image class="opt" src="../../static/like.png"></image>
			<image class="opt" src="../../static/download.png"></image>
			<image class="opt" src="../../static/ling.png"></image>
			<image class="opt" src="../../static/msg.png"></image>
			<image class="opt" src="../../static/more.png"></image>
		</view>

		<!-- playbar -->
		<view class="play-bar">
			<image class="opt" src="../../static/back.png"></image>
			<image class="opt2" src="../../static/play.png"></image>
			<image class="opt" src="../../static/next.png"></image>
		</view>

	</view>
</template>

<script>
	export default {
		data() {
			return {
				windowHeight: "200px"

			}
		},
		onLoad() {
			uni.getSystemInfo({
				success: (res) => {
					this.windowHeight = res.windowHeight + "px";
				}
			})
		},
		methods: {

		}
	}
</script>

<style>
	.content {
		background-image: linear-gradient(to bottom, #1e6997, #af946a, #1e6997);
		display: flex;
		flex-direction: column;
		align-items: center;
	}

	.status-bar {

		width: 100%;
	}

	.player-videodisc image {
		width: 500upx;
		height: 500upx;
		margin-top: 50upx;
	}

	.play-opt-bar {
		width: 80%;
		height: 60upx;
		display: flex;
		align-items: center;
		justify-content: space-between;
		padding: 0 70upx;
		font-size: 34px;
		position: absolute;
		bottom: 320upx;
	}

	.play-bar {
		width: 70%;
		display: flex;
		align-items: center;
		justify-content: space-between;
		padding: 0 70upx;
		font-size: 30px;
		position: absolute;
		bottom: 80upx;
	}

	.opt {
		width: 64upx;
		height: 64upx;
	}

	.opt2 {
		width: 100upx;
		height: 100upx;
	}

	.player {
		width: 650upx;
		height: 50upx;
		display: flex;
		align-items: center;
		justify-content: space-between;
		position: absolute;
		bottom: 220upx;
	}
	.word{
		color: #FFFFFF;
		margin: 100upx;
	
	}
</style>
