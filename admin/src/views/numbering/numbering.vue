<template>
	<div class="contentexamine">
		<el-main>
			<div class="content-wrapped">
				<div class="top-card">
					<div class="top-left-chart"></div>
					<div class="top-right-chart"></div>
				</div>
			</div>
		</el-main>
	</div>
</template>

<script>
	import * as echarts from 'echarts'
	export default {
		name: 'numbering',
		data() {
			return {

			}
		},
		mounted() {
			this.topLeftChart1()
			this.topRightChart1()
		},
		methods: {
			topLeftChart1() {
				const tlc = echarts.init(document.querySelector('.top-left-chart'))
				document.querySelector('.top-left-chart').setAttribute('_echarts_instance_', '')
				tlc.setOption({
					title: {
						text: '本周发布兼职数据'
					},
						xAxis: {
							type: 'category',
							data: ['周一', '周二', '周三', '周四', '周五', '周六', '周日']
						},
						yAxis: {
							type: 'value'
						},
						series: [{
							data: [150, 230, 224, 218, 135, 147, 260],
							type: 'line'
						}]
					}),
					window.addEventListener("resize", function() {
						tlc.resize()
					})
			},

			topRightChart1() {
				const trc = echarts.init(document.querySelector('.top-right-chart'))
				document.querySelector('.top-right-chart').setAttribute('_echarts_instance_', '')

				trc.setOption({
					title: {
						text: '本周兼职人数'
					},
					tooltip: {
						trigger: 'item'
					},
					legend: {
						top: '5%',
						left: 'center'
					},
					series: [{
						name: '兼职数据',
						type: 'pie',
						radius: ['40%', '70%'],
						avoidLabelOverlap: false,
						label: {
							show: false,
							position: 'center'
						},
						emphasis: {
							label: {
								show: true,
								fontSize: 40,
								fontWeight: 'bold'
							}
						},
						labelLine: {
							show: false
						},
						data: [{
								value: 1048,
								name: '图书馆兼职'
							},
							{
								value: 735,
								name: '饭堂兼职'
							},
							{
								value: 580,
								name: '宿舍兼职'
							},
							{
								value: 484,
								name: '书吧兼职'
							},
							{
								value: 300,
								name: '校外兼职'
							}
						]
					}]
				});
				window.addEventListener("resize", function() {
					trc.resize()
				})
			},

		},
	}
</script>
<style scoped>
	.el-main {
		padding: 8px !important;
	}

	.contentexamine {
		position: relative;
		width: 100%;
	}

	.content-wrapped {
		height: calc(100vh - 100px);
		width: 100%;
	}

	.top-card {
		width: 100%;
		height: calc(50% - 8px);
		display: flex;
		flex-direction: row;
		background-color: #fff;
		margin-bottom: 8px;
	}

	.top-left-chart {
		width: calc(50% - 8px);
		height: 100%;
		margin-right: 10px;
	}

	.top-right-chart {
		width: calc(50% - 8px);
		height: 100%;
	}

	.bottom-card {
		width: 100%;
		height: 50%;
		display: flex;
		flex-direction: row;
		background-color: #fff;
	}

	.bottom-left-chart {
		width: calc(50% - 8px);
		height: 100%;
		margin-right: 8px;
	}

	.bottom-right-chart {
		width: 50%;
		height: 100%;
	}
</style>
