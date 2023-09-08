'use strict';
exports.main = async (event, context) => {
	//event为客户端上传的参数
	// console.log('event : ', event)
	
	const db = uniCloud.database();
	const collection = await db.collection('uni-id-users');
	
	let res = await collection.doc(event.id).update({
	  gold:Number(event.gold) || 0,
	  pass:Number(event.pass) || 0
	});
	
	//返回数据给客户端
	return res;
};
