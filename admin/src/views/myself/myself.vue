<template>
	<div class="myself">
		<el-main>
			<div class="main">
				<div class="user-info clearfix">
					<!--          <h4>个人信息</h4> -->
					<div style="margin-bottom: 10px;">
						账号 :
						<span class="user-name">{{tableData.username}}</span>
					</div>
					<div style="margin-bottom: 10px;">
						昵称 :
						<span>{{tableData.nickname}}&nbsp;&nbsp;</span>
						<el-button type="primary" size="small" @click="name = true">点击修改昵称</el-button>
						<el-input style v-if="name" v-model="tableData.nickname"
							@keyup.enter.native="changeadminuser()"></el-input>
					</div>
					<div>
						密码 :
						<el-button type="danger" size="small" @click="password = true">修改密码</el-button>
						<el-input style v-if="password" v-model="tableData.newpassword"
							@keyup.enter.native="changeadminuser()"></el-input>
					</div>
					<div style="clear:both"></div>
				</div>
			</div>
		</el-main>
	</div>
</template>

<script>
	import {
		mapState,
		mapActions
	} from 'vuex'

	export default {
		name: 'myself',
		data() {
			return {
				name: false,
				password: false,
				formInline: {
					user: '',
					region: ''
				},
				pagelistquery: {
					total: 0,
					page: 1,
					pagesize: 10
				},
				tableData: [] //列表信息
			}
		},
		computed: {
			...mapState({
				uinfo: state => state.user.uinfo
			})
		},
		methods: {
			async changeadminuser() {
				let res = await this.$axios.post(
					'/admin/changeadminuser',
					this.qs.stringify(this.tableData)
				)
				if (res.data.state.type === 'SUCCESS') {
					this.$message.success('操作成功')
					this.getadmin()
					this.name = false
					this.password = false
				}
			},

			async getadmin() {
				let res = await this.$axios.post('/admin/getadmin')
				if (res.data.state.type === 'SUCCESS') {
					this.tableData = res.data.data
				}
			}
		},
		created() {
			this.getadmin()
		}
	}
</script>
<style scoped>
	.myself {
		position: relative;
		width: 100%;
	}

	.main {
		background-color: #fff;
	}

	.first-userInfo {
		padding-left: 20px;
	}

	.user-info ul {
		float: left;
		width: 30%;
		margin-top: -10px;
	}

	.user-info li {
		margin-top: 10px;
	}
</style>
