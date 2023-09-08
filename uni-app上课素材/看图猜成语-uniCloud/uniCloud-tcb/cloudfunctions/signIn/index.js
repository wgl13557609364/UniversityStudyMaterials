'use strict';
exports.main = async (event, context) => {
	//event为客户端上传的参数
	// console.log('event : ', event)
		
	if(event.type != 'signIn' && event.type != 'verify'){
		return {"msg":'服务器异常，请重试'};
	}
	
	const db = uniCloud.database();
	const collection = await db.collection('sign_in');
	const collection1 = await db.collection('uni-id-users');
	
	let nowDate = new Date();
	let nowDateStr = `${nowDate.getFullYear()}-${nowDate.getMonth()+1}-${nowDate.getDate()}`;
	
	let res = await new Promise((resolve, reject)=>{
		// 校验是否已签到
		if(event.type == 'verify'){
			
			let res1 = collection.where({
				"uid":event.id,
				"date":nowDateStr
			}).count();
			
			res1.then((y)=>{
				resolve({
					code:1,
					data:y.total
				})
			})
			
			res1.catch((n)=>{
				reject({"msg":'服务器异常，请重试'});
			})
			
		}else if(event.type == 'signIn'){
			collection.add({
			  "uid":event.id,
			  "date":nowDateStr
			})
			
			let res1 = collection1.doc(event.id).update({
			  gold:Number(event.gold) || 0,
			});
				
			res1.then((y)=>{
				if(y.updated){
					resolve({
						code:1,
						data:y.updated
					})
				}else{
					reject({"msg":'领取失败，请重试'});
				}
			})
			
			res1.catch((n)=>{
				reject({"msg":'服务器异常，请重试'});
			})
		}else{
			reject({"msg":'无效的请求，请重试'});
		}
		
	}).catch(err=>err);
	
	return res;
};
