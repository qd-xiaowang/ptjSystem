<template>
	<div id="login" class='login' style="width: 100%;height: 100vh;">
		<!-- <loginparticles /> -->
		<div class="login-box">
			<p class="title" style="color: #feed77;">校园兼职后台</p>
			<form action id="form" @submit.prevent="onSubmit">
				<p class="usericon">
					<input type="text" class='kuang' v-model="username" placeholder="用户" id="username" />
				</p>
				<p class="passicon">
					<input type="password" class='kuang' v-model="password" placeholder="密码" id="password" />
				</p>
				<p class='loginp'>
					<input type="submit" @click.prevent="login" value="登录" class="submit-btn" />
				</p>

			</form>
		</div>
	</div>
</template>
<script>
	// import loginparticles from '@/views/loginparticles.vue'
	import {
		mapState,
		mapActions
	} from 'vuex'

	export default {
		name: 'login',
		components: {
			// loginparticles
		},
		data() {
			return {
				password: 'admin',
				username: 'admin'
			}
		},
		methods: {
			...mapActions('user', ['setUserInfo', 'setToken']),
			//登录
			login() {
				if (this.password == '' || this.password == '') {
					this.$message.error('账号或者密码为空')
					return
				}
				let obj = {
					password: this.password,
					username: this.username
				}
				this.$axios({
						url: '/admin/login',
						method: 'POST',
						data: this.qs.stringify(obj)
					})
					.then(res => {
						let data = res.data.data
						if (res.data.state.type === 'SUCCESS') {
							this.$message.success('登录成功')
							this.setUserInfo(data.userinfo)
							this.setToken(data.token)
							this.$router.push('/')
						} else this.$message.error('用户名或密码错误')
					})
					.catch(e => {
						this.$message(e)
					})
			}
		}
	}
</script>
<style scoped>
	.login{
		background:url(job.jpg);
		background-size:100%;
	}

	.login-box {
		width: 300px;
		height: 210px;
		padding: 20px;
		background:#fff;
		margin: auto;
		position: absolute;
		top: 0;
		bottom: 0;
		left: 0;
		right: 0;
    border-radius: 10px;
	}

	.login-box p.title {
		font-size: 23px;
		/* font-weight: bold; */
		color: 	#A9A9A9;
		text-shadow: 0 0 1px #fff;
		margin: 0px;
		text-align: center;
	}

	.login-box p {
		position: relative;
	}

	.login-box p::before {
		font-family: 'adminthemesregular';
		position: absolute;
		top: 0;
		left: 10px;
		height: 42px;
		line-height: 42px;
		font-size: 16px;
		color: #333;
    /* font-weight: bold; */
	}

	.login-box p.usericon::before {
		content: '账号';
	}

	.login-box p.passicon::before {
		content: '密码';
	}

	.login-box input {
		font-size: 16px;
		height: 26px;
		width: 90%;
		border: 1px solid skyblue;
		padding: 8px 5%;
		/* background: #eee; */
		color: #000;
		
	}

	.login-box input.submit-btn {
		width: 140px;
		height: 42px;
		font-size: 16px;
		background: #409eff;
		color: #f8f8f8;
		border-radius:5px;
	}


	.kuang{
		outline:0px;
		margin-left: 50px;
    width: 216px !important;
    border-radius: 8px;
	}
	.passicon{
		margin-bottom:20px
	}

  .loginp{
    width: 100%;
    display: flex;
    justify-content: center;
  }
</style>
