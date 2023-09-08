<template>
	<view>
		<image class="bg" :src="appImgs.bg_1" mode="aspectFill"></image>
		<form class="login" @submit="formSubmit">
			<view class="item h-flex-x">
				<view>手机：</view>
				<view class="h-flex-item-grow">
					<input type="number" name="phone" maxlength="11" placeholder="请输入手机号码">
				</view>
			</view>
			<view class="item h-flex-x">
				<view>密码：</view>
				<view class="h-flex-item-grow">
					<input type="text" name="password" password="true" maxlength="16" placeholder="请输入密码 6~16位(字母/数学/下划线)">
				</view>
			</view>
			<view class="item">
				<button type="primary" form-type="submit">登录（注册）</button>
			</view>
		</form>
	</view>
</template>

<script>
	export default {
		data() {
			return {
				appImgs:{}
			}
		},
		onLoad() {
			this.appImgs = uni.$hl.getAppImgs();
		},
		methods: {
			formSubmit: function(e) {
                let formdata = e.detail.value;
				
				if(!uni.$hl.regExps.mobile.test(formdata.phone)){
					uni.$hl.showToast('请输入有效的手机号码');
					return;
				}
				
				if(!uni.$hl.regExps.befitPwd.test(formdata.password)){
					uni.$hl.showToast('请输入合法的密码');
					return;
				}
				
				uni.$hl.showLoading('登录中');
				uniCloud.callFunction({
				    name: 'login',
				    data: formdata
				}).then((res) => {
					uni.hideLoading();
					if(res.result.code != 0){
						uni.$hl.showToast(res.result.message || '帐号与密码不匹配');
						return;
					}
					
					uni.$hl.setUserInfo(res.result.userInfo);
					console.log(res.result.userInfo);
					uni.$hl.showToast('登录成功','success');
					this.loginTimeout = setTimeout(()=>{
						uni.reLaunch({
							url: '/pages/index/index'
						})
					},1500);
				}).catch((err)=>{
					uni.hideLoading();
					uni.$hl.showToast('登录失败，请重试');
				});
            }
		}
	}
</script>

<style lang="scss">
	page {
		background-color: #f3f3f3;
		font-size: 28rpx;
		color: #333;
	}
	.login{
		display: block;
		background-color: rgba(255,255,255,0.6);
		padding: 30rpx;
		position: absolute;
		z-index: 1;
		width: 100%;
		box-sizing: border-box;
		top: 0;
		left: 0;
		
		.item{
			padding: 10rpx 0;
			
			input{
				height: 90rpx;
				display: block;
				width: 100%;
				font-size: 28rpx;
				letter-spacing: 1px;
			}
			
			& + .item{
				border-top: #eee solid 1px;
			}
		}
	}
	
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
	}
</style>
