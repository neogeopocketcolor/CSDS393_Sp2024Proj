import Vue from 'vue'

import 'normalize.css/normalize.css' // A modern alternative to CSS resets

import ElementUI from 'element-ui'
import 'element-ui/lib/theme-chalk/index.css'
import { uploadFile } from "./netWork/commonNetwork"
import '@/styles/index.scss' // global css
import { modal, confirmModal } from "@/utils/modal";
import App from './App'
import store from './store'
import router from './router'
import locale from 'element-ui/lib/locale/lang/en'

Vue.use(ElementUI, { locale })

import vueMiniPlayer from 'vue-mini-player'
import 'vue-mini-player/lib/vue-mini-player.css'
Vue.use(vueMiniPlayer)
Vue.prototype.$uploadFile = uploadFile;

import '@/icons' // icon
import '@/permission' // permission control
Vue.prototype.modal = modal;
Vue.prototype.confirmModal = confirmModal;

if (process.env.NODE_ENV === 'production') {
  const { mockXHR } = require('../mock')
  mockXHR()
}


Vue.use(ElementUI)

Vue.config.productionTip = false

new Vue({
  el: '#app',
  router,
  store,
  render: h => h(App)
})
