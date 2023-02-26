<template>
	<div class="main">
		<el-container style="height: 100vh;">
			<div class="aside" width="200px" style="background-color: #fff;color: #333;">
				<div slot="title" style="font-size:14px;height: 60px;line-height: 60px;text-align: center;">校园兼职后台</div>
				<el-menu router default-active="2" class="el-menu-vertical-demo" background-color="#fff"
					text-color="#fff" active-text-color="#ffd04b">
          <el-menu-item index="/numbering" style="color: #333;">
            <span slot="title" >数据中心</span>
          </el-menu-item>
					<el-menu-item index="/" style="color: #333;">
						<template slot="title" :disabled="uinfo.jurisdiction.issh !=='1'&& uinfo.username !== 'admin'">
							<span slot="title">内容审核</span>
						</template>
					</el-menu-item >
					<el-menu-item index="/useruser" style="color: #333;">用户管理</el-menu-item>
				</el-menu>
			</div>
			<el-container style=" position:relative ;">
				<el-header>
					<div class="top-content">
						<div></div>
						<span @click="withdraw" style="cursor: pointer;color: #000;">退出登录</span>
					</div>
				</el-header>
				<el-main style=" padding: 0px; background-color:#eee;">
					<router-view />
				</el-main>
			</el-container>
		</el-container>
	</div>
</template>



<script>
	import {
		mapState,
		mapActions
	} from "vuex";

	export default {
		data() {
			const item = {
				date: "",
				name: "",
				address: " "
			};
			return {
				tableData: Array(20).fill(item),
				isCollapse: true
			};
		},
		computed: {
			...mapState({
				uinfo: state => state.user.uinfo,
			})
		},
		methods: {
			...mapActions("user", [
				"deleteuserinfo",
			]),
			withdraw() {
				this.$router.push('/login');
				this.deleteuserinfo()
			},
			changeCollapse() {
				this.isCollapse = !this.isCollapse;
			}
		}
	};
</script>
<style>
	.el-menu-vertical-demo:not(.el-menu--collapse) {
		width: 200px;
	}

	.el-header {
		text-align: right;
		font-size: 12px;
		background-color: #e8e7e3;
		color: white;
		line-height: 56px;
		height: 56px;
		text-align: right;
		padding: 0px 30px;
	}

	.el-menu {
		border-right: 0;
	}

	.el-aside {
		color: white;
	}

	.aside {
		overflow: auto;
	}
	.top-content{
		display: flex;
		justify-content: space-between;
	}
</style>
