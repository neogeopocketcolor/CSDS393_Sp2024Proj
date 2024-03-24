import Vue from 'vue'
import Router from 'vue-router'

Vue.use(Router)

/* Layout */
import Layout from '@/layout'


/**
 * constantRoutes
 * a base page that does not have permission requirements
 * all roles can be accessed
 */
export let constantRoutes = [
  {
    path: '/login',
    component: () => import('@/views/user/Login'),
    hidden: true
  },
  {
    path: '/regist',
    component: () => import('@/views/user/Regist'),
    hidden: true
  },
  {
    path: '/404',
    component: () => import('@/views/404'),
    hidden: true
  },

  {
    path: '/',
    component: Layout,
    redirect: '/dashboard',
    children: [{
      path: 'dashboard',
      name: 'Dashboard',
      component: () => import('@/views/dashboard/index'),
      meta: { title: 'Home', icon: 'dashboard' }
    }]
  },
 
  {
    path: '/bank-list',
    component: Layout,
    children: [
      {
        path: '',
        name: 'BankList',
        component: () => import('@/views/MenuList'),
        meta: { title: 'recipe book', icon: 'form' }
      }
    ]
  },
  
  {
    path: '/mine-menu-list',
    component: Layout,
    children: [
      {
        path: '',
        name: 'QuestionList',
        component: () => import('@/views/MineMenuList'),
        meta: { title: 'my recipe', icon: 'form' },
      }
    ]
  },
  {
    path: '/menu-add',
    component: Layout,
    hidden: true,
    children: [
      {
        path: '',
        name: 'AddMenu',
        component: () => import('@/views/AddMenu'),
        meta: { title: 'add recipe', icon: 'form' },
      }
    ]
  },
  {
    path: '/user-info',
    component: Layout,
    children: [
      {
        path: '',
        name: 'UserInfo',
        component: () => import('@/views/UserInfo'),
        meta: { title: 'UserInfo', icon: 'form' }
      }
    ]
  },


  // 404 page must be placed at the end !!!
  { path: '*', redirect: '/404', hidden: true }
]




const createRouter = () => new Router({
  scrollBehavior: () => ({ y: 0 }),
  routes: constantRoutes
})

const router = createRouter()


export function resetRouter() {
  const newRouter = createRouter()
  router.matcher = newRouter.matcher // reset router
  // router.options.routes = newRouter.routes;
}

export default router
