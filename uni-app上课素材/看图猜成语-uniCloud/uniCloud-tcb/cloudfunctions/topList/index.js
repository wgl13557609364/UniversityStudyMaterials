'use strict';
exports.main = async (event, context) => {
	//event为客户端上传的参数
	// console.log('event : ', event)
	
	const db = uniCloud.database();
	const collection = await db.collection('uni-id-users');
	
	let res = await new Promise((resolve, reject)=>{
		let res1 = collection.orderBy('pass','desc').limit(100).get();
		
		res1.then((y)=>{			
			if(y.data && y.data.length > 0){
				let newData = y.data;
				
				newData.forEach((item,index)=>{
					item.phone = item.username.toString().replace(/(\d{3})\d+(\d{2})/,"$1****$2");
				})
				resolve({
					code:1,
					data:newData
				})
			}else{
				reject({"msg":'error'});
			}
		})
		
		res1.catch((n)=>{
			reject({"msg":'error'});
		})
	})

	
	//返回数据给客户端
	return res;
};
