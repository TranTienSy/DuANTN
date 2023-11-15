app.controller("thongke-ctrl", function ($scope, $http) {
	$scope.filterDTHoaHong = 'DAY'
	$scope.toTalDoanhThu = 0;
	$scope.toTalDonHang = 0;
	$scope.toTalSanPham = 0;

	var data = {
		labels: [],
		datasets: [{
			label: "Doanh thu (Nghìn đồng)",
			data: [],
			borderColor: 'rgba(0, 123, 255, 1)', // Màu xanh dương
			backgroundColor: 'rgba(0, 123, 255, 0.2)', // Màu xanh dương với độ trong suốt
			pointRadius: 5,
			tension: 0.4,
			pointBorderColor: 'rgba(0, 255, 0, 1)',

		}, {
			label: "Số lượng hóa đơn bán được(Số lượng)",
			data: [],
			borderColor: '#48c548', // Màu đỏ
			backgroundColor: 'rgba(18, 235, 116, 0.2)', // Màu đỏ với độ trong suốt
			pointRadius: 5,
			tension: 0.4,
			pointBorderColor: 'rgba(0, 255, 0, 1)',
		},
		{
			label: "Số lương sản phẩm bán được (Số lượng)",
			data: [],
			borderColor: '#c548c5', // Màu đỏ
			backgroundColor: 'rgba(235, 18, 163, 0.2)', // Màu đỏ với độ trong suốt
			pointRadius: 5,
			tension: 0.4,
			pointBorderColor: 'rgba(0, 255, 0, 1)',
		}]
	};


	// Tạo biểu đồ đường
	var ctx = document.getElementById("myChart").getContext("2d");
	var myChart = new Chart(ctx, {
		type: 'line',
		data: data,
		options: {
			scales: {
				x: {
					grid: {
						color: 'purple' // Đặt màu cho lưới trục x
					},
					ticks: {
						color: 'red' // Đặt màu cho nhãn trục x
					}
				},
				y: {
					beginAtZero: true,
					ticks: {
						callback: function (value, index, values) {
							return value;
						},
					}
				}
			}, plugins: {
				legend: {
					labels: {
						color: 'black',
					}
				}
			}

		}
	});


	$scope.thongke = function () {
		$http({
			method: 'GET',
			url: "/rest/thongke",
			params: { DieuKien: $scope.filterDTHoaHong },
			headers: {
				'Content-Type': 'application/x-www-form-urlencoded'
			}
		}).then(
			function successCallback(response) {// Nếu thành công
				console.log(response.data);
				let labels = [];
				let doanhthu = [];
				let orders = [];
				let products = [];
				let totalDoanhthu = 0;
				let totalDonHang = 0;
				let totalSanPham = 0;
				response.data.map((e) => {
					totalDoanhthu += e.TotalRevenue;
					totalDonHang += e.CountOrder;
					totalSanPham += e.CountProduct;
					labels.push(e.Labels);
					orders.push(e.CountOrder);
					doanhthu.push(e.TotalRevenue);
					products.push(e.CountProduct);
				})
				$scope.toTalDoanhThu = totalDoanhthu;
				$scope.toTalDonHang = totalDonHang;
				$scope.toTalSanPham =totalSanPham;
				myChart.data.labels = labels;
				myChart.data.datasets[0].data = doanhthu;
				myChart.data.datasets[1].data = orders;
				myChart.data.datasets[2].data = products;
				myChart.update(); // Cập nhật biểu đồ
			},
			function errorCallback(response) { // Nếu thất bại
				$rootScope.AddNotifis("Có lỗi sãy ra trong quá trình lấy dữ liệu", "danger");
			}
		)
	}
	$scope.thongke();




})