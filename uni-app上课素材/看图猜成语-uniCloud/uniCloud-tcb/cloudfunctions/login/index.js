'use strict';

let uniID = require('uni-id')
exports.main = async (event, context) => {
	//event为客户端上传的参数
	// console.log('event : ', event)

	uniID = uniID.createInstance({
		context
	})
	
	let params = {
		username:event.phone,
		password:event.password,
		needPermission:false
	}
	
	let res;
	
	res = await uniID.login(params);
	// 用户不存在时
	if(res.code == 10002){
		
		res = await uniID.register({
			username:params.username,
			password:params.password,
			needPermission:params.needPermission,
			pass: 0,
			gold: 100
		});
		if(res.code == 0){
			res = await uniID.login(params);
		}
	}
	return res;
};
