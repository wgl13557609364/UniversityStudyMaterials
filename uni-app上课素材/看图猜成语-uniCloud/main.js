import Vue from 'vue'
import App from './App'
import helangGlobal from './libs/helang-global.js'	//引入 helang-global.js

Vue.config.productionTip = false

App.mpType = 'app'

Vue.use(helangGlobal)	// 使用 helang-global.js

const app = new Vue({
    ...App
})
app.$mount()
