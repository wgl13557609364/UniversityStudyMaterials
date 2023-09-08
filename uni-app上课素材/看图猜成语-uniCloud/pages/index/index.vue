<template>
	<view>
		<image class="bg" :src="appImgs.bg_1" mode="aspectFill"></image>
		<view class="box">
			<view class="h-flex-y h-flex-center">
				<view style="padding-top: 150rpx;">
					<image src="/static/ico.jpeg" mode="aspectFill" class="ico"></image>
				</view>
				<view style="margin: 100rpx 0 30rpx 0;width: 100%;text-align: center;">
					<view v-if="userInfo._id">
						已闯过<text style="padding: 0 10rpx;color: #ff5722;">{{userInfo.pass}}</text>关
					</view>
				</view>
				<image :src="appImgs.btn_3" mode="aspectFit" @tap="startGame" class="start transform-scale"></image>
				<view style="margin-top: 60rpx;" class="h-flex-x"> 
					<image :src="appImgs.btn_1" mode="aspectFit" @tap="lookTop" class="start transform-scale"></image>
				</view>
			</view>
		</view>
		
		
		<view class="global-popup signIn-pop" :style="{ 'display':signIn.show ? 'block':'none' }">
			<view class="shade"></view>
			<view class="content">
				<image :src="appImgs.img_2" mode="aspectFit"></image>
				<view>
					<view class="h-flex-x h-flex-center" style="margin-bottom: 100rpx;">
						<view>
							<image class="gold" :src="appImgs.icon_1" mode="aspectFit"></image>
						</view>
						<view style="margin: 0 0 0 10rpx;color: #ff5722;font-size: 48rpx;">+</view>
						<view style="color: #ff5722;font-size: 64rpx;">20</view>
					</view>
					<image class="btn transform-scale" :src="appImgs.btn_8" mode="aspectFit" @tap="onSignIn"></image>
				</view>
			</view>
		</view>
	</view>
</template>

<script>
	export default {
		components:{
			
		},
		data() {
			return {
				userInfo:{},
				signIn:{
					show:false
				},
				appImgs:{}
			}
		},
		onLoad() {
			this.appImgs = uni.$hl.getAppImgs();
		},
		onShow() {
			if(uni.$hl.isLogin()){
				this.userInfo = uni.$hl.getUserInfo();
				this.updateInfo();
				this.signInFn();
			}
		},
		methods: {
			// 开始游戏
			startGame(){
				if(!uni.$hl.isLogin()){
					uni.navigateTo({
						url:'/pages/user/login'
					})
					return;
				}
				uni.navigateTo({
					url:'/pages/index/play'
				})
			},
			// 排行榜
			lookTop(){
				uni.navigateTo({
					url:'/pages/index/top'
				})
			},
			updateInfo(){
				uniCloud.callFunction({
				    name: 'getUserInfo',
				    data: {
						id:this.userInfo._id
					}
				}).then((res) => {
					if(!res.result.code){
						return;
					}
					
					uni.$hl.setUserInfo(res.result.data);
					this.userInfo = res.result.data;

				}).catch((err)=>{
					uni.hideLoading();
					uni.$hl.showToast('登录失败，请重试');
				});
			},
			signInFn(type = 'verify',gold){
				let sendData = {
					id:this.userInfo._id,
					type,
					gold
				}
				uniCloud.callFunction({
				    name: 'signIn',
				    data: sendData
				}).then((res) => {
					if(!res.result.code){
						return;
					}
					
					if(type == 'verify'){
						if(res.result.data < 1){
							this.signIn.show = true;
						}
					}
					
					if(type == 'signIn'){
						this.signIn.show = false;
						this.userInfo.gold += 20;
						uni.$hl.setUserInfo(this.userInfo);
						uni.hideLoading();
						uni.$hl.showToast('领取成功','success');
					}
				
				}).catch((err)=>{
					if(type == 'signIn'){
						uni.hideLoading();
					}
				});
			},
			onSignIn(){
				let gold = 20 + this.userInfo.gold;
				uni.$hl.showLoading('领取中');
				this.signInFn('signIn',gold)
			}
		}
	}
</script>

<style lang="scss">
	.bg{
		position: fixed;
		z-index: 1;
		top: 0;
		left: 0;
		width: 100%;
		height: 100%;
	}
	.box{
		position: fixed;
		z-index: 2;
		top: 0;
		left: 0;
		width: 100%;
		height: 100%;
		box-sizing: border-box;
		padding-top: var(--status-bar-height);
		
		.ico{
			display: block;
			width: 320rpx;
			height: 320rpx;
			border-radius: 60rpx;
		}
		
		> view{
			height: 100%;
		}
		
		.start {
			display: block;
			width: 320rpx;
			height: 90rpx;
			margin: 0 10rpx;
		}
	}
	
	// 签到
	.signIn-pop{
		.content {
			width: 750rpx;
			height: 900rpx;
			
			> image {
				width: 100%;
				height: 100%;
			}
			
			> view{
				position: absolute;
				top: 500rpx;
				left: 20%;
				width: 60%;
				font-size: 32rpx;
				color: #345;
			}
			
			.gold{
				width: 40rpx;
				height: 40rpx;
			}
			
			.btn{
				width: 320rpx;
				height: 90rpx;
				margin: 20rpx auto 0 auto;
			}
		}
	}
</style>
