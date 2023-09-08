<template>
	<view>
		<image class="bg" :src="appImgs.bg_1" mode="aspectFill"></image>
		<view class="box">
			<scroll-view scroll-y="true">
				<view style="padding: 20rpx 30rpx;">
					<view v-for="(item,index) in topList" :key="index" class="item-box h-flex-x" :class="{ 'self':userInfo._id == item._id }">
						<view class="number">
							<image :src="topIcons[index]" mode="aspectFit" v-if="index<3"></image>
							<view class="h-flex-x h-flex-center" v-else>{{index+1}}</view>
						</view>
						<view class="h-flex-item-grow">
							<text>用户：{{item.phone}}</text>
							<view class="me" v-if="userInfo._id == item._id">我自己</view>
						</view>
						<view style="margin: 0 0 0 20; font-size: 24rpx;width: 120rpx;">
							<text>关卡:{{item.pass}}</text>
						</view>
						<view style="margin: 0 0 0 20; font-size: 24rpx;width: 120rpx;">
							<text>金币:{{item.gold}}</text>
						</view>
					</view>
				</view>
			</scroll-view>
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
				topIcons:[],
				topList:[],
				appImgs:{}
			}
		},
		onLoad() {
			this.appImgs = uni.$hl.getAppImgs();
						
			this.userInfo = uni.$hl.getUserInfo();
			
			// 排行图标
			for(let i = 4;i<=6;i++){
				this.topIcons.push(this.appImgs[`icon_${i}`]);
			}
			
			this.topListOut = setTimeout(()=>{
				this.getTopList();
			},500);
		},
		onUnload() {
			clearTimeout(this.topListOut);
		},
		methods: {
			getTopList(){
				uni.$hl.showLoading('加载中');
				
				uniCloud.callFunction({
				    name: 'topList'
				}).then((res) => {
					uni.hideLoading();
					if(!res.result.code){
						return;
					}
					this.topList = res.result.data;
					
				}).catch((err)=>{
					uni.hideLoading();
				});
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
		position: absolute;
		z-index: 2;
		top: 0;
		left: 0;
		width: 100%;
		height: 100%;
		box-sizing: border-box;
		
		> scroll-view{
			height: 100%;
		}
		
		.item-box{
			padding: 20rpx;
			border-radius: 8rpx;
			background-color: rgba(255,255,255,0.7);
			position: relative;
			
			& + .item-box{
				margin-top: 20rpx;
			}
			
			&.self{
				background-color: rgba(255,255,255,0.8);
				box-shadow: 0 0 5px #ff9800;
			}
			
			.number{
				margin-right: 30rpx;
				
				> image{
					width: 60rpx;
					height: 60rpx;
				}
				
				> view{
					width: 60rpx;
					height: 60rpx;
					text-align: center;
					font-size: 32rpx;
					background-color: #ff9800;
					border-radius: 50%;
					color: rgba(255,255,255,0.8);
				}
			}
			
			.me{
				color: #DD524D;
				font-size: 48rpx;
				position: absolute;
				top: 15rpx;
				left: 280rpx;
				opacity: 0.75;
				transform:rotate(10deg) skewX(25deg);
			}
		}
	}
</style>