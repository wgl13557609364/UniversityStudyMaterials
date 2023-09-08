'use strict';
exports.main = async (event, context) => {
	//event为客户端上传的参数
	let page = event.page || 1;
	let size = event.size || 10;
	
	let skip = (page-1)*size;
	
	const db = uniCloud.database();
	const collection = await db.collection('pass');
	const list = collection.skip(skip).limit(size).get();
	
	//返回数据给客户端
	return list;
};
