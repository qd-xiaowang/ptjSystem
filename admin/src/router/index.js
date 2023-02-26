import Vue from 'vue'
import VueRouter from 'vue-router'
import main from '../views/main.vue'
import login from '../views/login.vue'
import contentexamine from '../views/examine/contentexamine.vue'
import useruser from '../views/user/useruser.vue'
import useradmin from '../views/user/useradmin.vue'
import managementlable from '../views/management/managementlable.vue'
import numbering from '../views/numbering/numbering.vue'
// import myself from '../views/myself/myself.vue'
Vue.use(VueRouter)

const routes = [
  { path: '/login', name: 'login', component: login, meta: { ispublic: true } },
  {
    path: '/',
    name: 'main',
    component: main,
    children: [
      // { path: '/', name: '/', component: myself },
			{ path: 'numbering', name: 'numbering', component: numbering },
      {
        path: '/',
        name: '/',
        component: contentexamine
      },
      { path: 'useruser', name: 'useruser', component: useruser },
      { path: 'useradmin', name: 'useradmin', component: useradmin },
      {
        path: 'managementlable',
        name: 'managementlable',
        component: managementlable
      },
    ]
  }
]

const router = new VueRouter({
  routes
})
router.beforeEach((to, Form, next) => {
  if (!to.meta.ispublic && !localStorage.admin_jwt_token) {
    return next('/login')
  }
  next()
})
export default router
