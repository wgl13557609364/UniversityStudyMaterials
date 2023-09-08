/* 统一资源标识符，设置项目全局请求域名 */
let URI = {
	/* 请求路径 */
	request: '',
	/* 文件上传服务器路径 */
	upload: '',
	/* 图片服务路径 */
	images: 'https://6461-darling-c8b540-1303225004.tcb.qcloud.la'
}

/* 常用正则 */
let regExps = {
	email: /^[0-9a-zA-Z_]+@[0-9a-zA-Z_]+[\.]{1}[0-9a-zA-Z]+[\.]?[0-9a-zA-Z]+$/, //邮箱
	mobile: /^1\d{10}$/, //手机号码
	qq: /^[1-9][0-9]{4,9}$/, //QQ
	befitName: /^[a-z0-9A-Z\u4e00-\u9fa5]+$/, //合适的用户名，中文,字母,数字
	befitPwd: /^[a-z0-9A-Z_]{6,16}$/, //合适的密码，字母,数字,下划线
	allNumber: /^[0-9]+.?[0-9]$/ //全部为数字
}

/* 加载框 */
let showLoading = (title = '加载中') => {
	uni.showLoading({
		title,
		mask: true
	});
}

/* 提示框 */
let showToast = (title = '', icon = 'none', duration = 1500) => {
	uni.showToast({
		title,
		icon,
		duration,
		position: 'center',
		mask: true
	});
}

/* 获取元素自定义属性值-当前事件元素 */
let elData = (el, key) => {
	if (key) {
		return el.currentTarget.dataset[key];
	} else {
		return el.currentTarget.dataset;
	}
}

/* 获取元素大小及位置 */
let elRect = (selector) => {
	return new Promise((resolve, reject) => {
		let view = uni.createSelectorQuery().select(selector);
		view.fields({
			size: true,
			rect: true
		}, (res) => {
			resolve(res);
		}).exec();
	})
}

/* 
	发送请求
	url 为绝对路径时使用绝对路径，为相对路径时会自拼接 URI 中的 request 地址
	method 默认为 GET ,默认时可不传
*/
let ajax = (param={}) => {
	let url=param.url || '';
	if(!/http:|https:/.test(url)){
		url=URI.request+url;
	}
	
	/* 请求头设置 */
	let header={};
	
	/* 定义请求数据格式 */
	/* 数据会进行 JSON 序列化，Request Payload，与下方相同属性保留接口所需要的类型即可 */
	header['content-type']='application/json';
	/* 数据转换为 query string，Form Data，与上方相同属性保留接口所需要的类型即可*/
	// header['content-type']='application/x-www-form-urlencoded';
	
	/* 请求头自定义数据 */
	/* 令牌数据自行完成获取过程 */
	//header['token']='helang';
	
	return new Promise((resolve,reject)=>{
		uni.request({
			url,
			method:param.method || 'GET',
			dataType:'json',
			header,
			data:param.data,
			success:(res)=>{
				if(res.statusCode != 200){
					reject(res);
					return;
				}
				
				resolve(res.data);
			},
			fail:(err)=>{
				uni.hideLoading();
				showToast('请求错误，请重试！');
				reject(err);
			}
		});
	})
}

/* 是否登录 */
let isLogin = ()=>{
	let userInfo = uni.getStorageSync("userInfo");
	if(userInfo){
		return true;
	}else{
		return false;
	}
}

/* 获取登录用户信息 */
let getUserInfo = (key)=>{
	let userInfo = uni.getStorageSync("userInfo");
	if(userInfo){
		userInfo = JSON.parse(userInfo);
		if(key && userInfo[key] != undefined){
			return userInfo[key];
		}else{
			return userInfo;
		}
	}else{
		return false;
	}
}

/* 设置登录用户信息 */
let setUserInfo = (value)=>{
	uni.setStorageSync("userInfo",JSON.stringify(value));
}


/* 拼接图片地址 */
let joinImgUrl = (url)=>{
	if(/^http/.test(url)){
		return url;
	}
	return `${URI.images}${url}`;
}

/* 获取应用在线图片地址 */
let getAppImgs = ()=>{
	let basicUrl = '/app';
	let imgs={};
	// 背景
	for(let i=1;i<=3;i++){
		imgs[`bg_${i}`] = joinImgUrl(`${basicUrl}/bg_${i}.jpg`);
	}
	// 按钮
	for(let i=1;i<=14;i++){
		imgs[`btn_${i}`] = joinImgUrl(`${basicUrl}/btn_${i}.png`);
	}
	// 图标
	for(let i=1;i<=8;i++){
		imgs[`icon_${i}`] = joinImgUrl(`${basicUrl}/icon_${i}.png`);
	}
	// 图片
	for(let i=1;i<=5;i++){
		imgs[`img_${i}`] = joinImgUrl(`${basicUrl}/img_${i}.png`);
	}
	return imgs;
}

/* 自定义全局对象 */
let iGlobal = {
	URI,
	regExps,
	showLoading,
	showToast,
	elData,
	elRect,
	ajax,
	isLogin,
	getUserInfo,
	setUserInfo,
	joinImgUrl,
	getAppImgs
}

/* 把 iGlobal 挂载到 Vue.prototype 中，属性名为 $hl */
let install = (Vue) => {
	uni.$hl = Vue.prototype.$hl = iGlobal;
}

/* 抛出当前模块 */
export default {
	install
}
