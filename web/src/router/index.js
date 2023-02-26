import Vue from 'vue'
import VueRouter from 'vue-router'
import index from '../views/index.vue'
import home from '../views/home.vue'

import newscontent from '../views/content/newscontent.vue'
import adminindex from '../views/webadmin/adminindex.vue'
import myself from '../views/webadmin/myself.vue'
import collection from '../views/webadmin/collection.vue'
import createarticle from '../views/webadmin/article/createarticle.vue'
import articlelist from '../views/webadmin/article/articlelist.vue'
import Router from 'vue-router'

Vue.use(VueRouter)

/**
 * 重写路由的push方法
 */
const routerPush = Router.prototype.push
Router.prototype.push = function push(location) {
	return routerPush.call(this, location).catch(error => error)
}
const routes = [
	// { path: '/', name: 'index',  component: index, meta:{ispublic:true}},
	{
		path: '/',
		name: 'index',
		component: index,
		meta: {
			ispublic: true
		},
		children: [{
				path: '',
				name: 'home',
				component: home,
				meta: {
					ispublic: true
				}
			},
			{
				path: 'newscontent/:id',
				name: 'newscontent',
				component: newscontent,
				props: true,
				meta: {
					ispublic: true
				}
			},
			{
				path: 'admin',
				name: 'adminindex',
				component: adminindex,
				children: [{
						path: 'myself',
						name: 'myself',
						component: myself
					},
					{
						path: 'collection',
						name: 'collection',
						component: collection
					},
					{
						path: 'createarticle',
						name: 'createarticle',
						component: createarticle
					},
					{
						path: 'updataarticle/:id',
						name: 'updataarticle',
						component: createarticle,
						props: true
					},
					{
						path: 'articlelist',
						name: 'articlelist',
						component: articlelist
					},
				]
			}
		]
	}
]

const router = new VueRouter({
	mode: 'history',
	routes
})

router.beforeEach((to, Form, next) => {
	if (!to.meta.ispublic && !localStorage.luffy_jwt_token) {
		return next('/home')
	}
	next()
})
export default router
