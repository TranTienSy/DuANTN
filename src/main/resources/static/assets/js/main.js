const app = angular.module("shopping-app", []);

app.run(function ($http, $rootScope) {
    $http.get(`/rest/auth/authentication`).then(resp => {
        if (resp.data) {
            $auth = $rootScope.$auth = resp.data;
            $http.defaults.headers.common["Authorization"] = $auth.token;
        }
    });
})

app.factory('product', function() {
	var product =  JSON.parse(localStorage.getItem('product')) || [];
	
	return {
	  getProduct: function() {
		return product;
	  },
	  setProduct: function(list) {
		itemsCheckout = list;
		localStorage.setItem('product', JSON.stringify(list));
	  }
	};
});

app.controller("shopping-ctrl", function ($scope, $http, product, $location) {
    var url = "/rest/products";
    var url1 = "/rest/orders";
   // Đặt giá trị mặc định cho selectedColor
  
    $scope.product = product.getProduct();
    
    $scope.listColor = [];
    var uniqueNames = new Set();
    $scope.listSize = [];
    var uniqueSize = new Set();

    $scope.color = null; // Chọn mặc định là phần tử đầu tiên trong danh sách màu
    $scope.size = null;
   
    if($scope.product.listOfProductVariants!= null){

    $scope.product.listOfProductVariants.forEach(p => {
        // Kiểm tra xem tên màu đã xuất hiện chưa
        if (!uniqueNames.has(p.color)) {
            uniqueNames.add(p.color);
            $scope.listColor.push(p.color);
        }


        if (!uniqueSize.has(p.size)) {
            uniqueSize.add(p.size);
            $scope.listSize.push(p.size);
        }
    });

    }


    // Hàm lấy danh sách màu sắc theo kích thước
    $scope.getColorsBySize = function(size) {
        $scope.size = size;
        $scope.color = null;
        // Sử dụng filter để lọc danh sách màu sắc
        return $scope.product.listOfProductVariants.filter(function(variant) {
            return variant.size === size;
        }).map(function(variant) {
            return variant.color;
        });
    };

    $scope.setColor = function(color) {
        $scope.color = color;
    }


    $scope.showColor = function (size) {
        $scope.listColor = $scope.getColorsBySize(size);
    };

    var sweetalert = function (text) {
        Swal.fire({
            icon: "success",
            title: text,
            showConfirmButton: false,
            timer: 2000,
        });
    }  
    $scope.loadProduct = function(id){
        $http({
            method: 'GET',
            url:"/rest/products/"+ id,
            headers: {
                'Content-Type': 'application/json',
            }
        }).then(
            function successCallback(response) {// Nếu thành công
                console.log(response.data)
                product.setProduct(response.data);
            },
            function errorCallback(response) { // Nếu thất bại
                console.log(response)
            }
        )
    }
    // Quan ly gio hang
    $scope.cart = {
        items: [],
     
        // Them sp vao gio hang
        add(id) {
            if($scope.color == null || $scope.size ==null){
                alert("Vui lòng chọn size và màu !")
            }else{
                var item = this.items.find(item => item.id == id && item.size == $scope.size && item.color == $scope.color);
                if (item) {
                    item.qty += parseInt($('#quantityInput').val(), 10);

                    this.saveToLocalStorage();
                }
                else {
                    $http.get(`${url}/${id}`).then(resp => {
                        resp.data.qty = parseInt($('#quantityInput').val(), 10);
                        resp.data.size = $scope.size;
                        resp.data.color = $scope.color;
                        this.items.push(resp.data);
                        this.saveToLocalStorage();
                    })
                }
                sweetalert("Thêm vào giỏ hàng thành công !");
            } 
            
        },
        // Xoa sp khoi gio hang
        remove(id) {
            var index = this.items.findIndex(item => item.id == id);
            this.items.splice(index, 1);// xoa phan tu
            this.saveToLocalStorage();
        },
        // Xoa sach sp trong gio hang
        clear() {
            this.items = [];
            this.saveToLocalStorage();
        },
        // Tinh thanh tien cua 1 sp
        amt_of(item) { },
        // Tinh tong so luong cac mat hang trong gio
        get count() {
            return this.items
                .map(item => item.qty)
                .reduce((total, qty) => total += qty, 0);
        },
        // Tong thanh tien cac mat hang trong gio
        get amount() {
            return this.items
                .map(item => item.qty * item.price)
                .reduce((total, qty) => total += qty, 0);
        },
        // Luu gio hang vao localstorage
        saveToLocalStorage() {
            var json = JSON.stringify(angular.copy(this.items));
            localStorage.setItem("cart", json);
        },
        // Doc gio hang vao local storage
        loadFromLocalStorage() {
            var json = localStorage.getItem("cart");
            this.items = json ? JSON.parse(json) : [];
        }
    }
    // Lưu giỏ hàng
    $scope.cart.loadFromLocalStorage();
    $scope.order = {
        createDate: new Date(),
        tinh: $('#provinceSelect').val(),
        huyen: "",
        xa: "",
        chitiet: "",
        phone: "",
        account: { username: $("#username").text() },
        get orderDetails() {
            return $scope.cart.items.map(item => {
                return {
                    product: { id: item.id },
                    price: item.price,
                    quantity: item.qty,
                    quality: item.quality,
                    size:item.size,
                    color:item.color,
                }
            });
        },
        purchase() {
            var order = angular.copy(this);
            order.status = 'CHOXULY';
            order.tinh =  $("#provinceSelect option:selected").text();
            order.huyen = $("#districtSelect option:selected").text();
            order.xa = $("#wardSelect option:selected").text();
            order.chitiet = $('#detailAddress').val();
            order.phone = $('#phone').val();
            if(!order.tinh|| !order.huyen || !order.xa || !order.phone){
                alert("Vui lòng điền đầy đủ thông tin !")
                return;
            }
            // Thực hiện đặt hàng
            $http.post(url1, order).then(resp => {
            	sweetalert("Đặt hàng thành công!");
                $scope.cart.clear();// xóa
                location.href = "/order/detail/" + resp.data.id; // chuyển đến tảng chi tiết dơn hàng
            }).catch(error => {
            	sweetalert("Đặt hàng lỗi!");
                console.log("Error", error);
            })
        }
    }

    $scope.cancelOrder = function(user,id){
        $http({
            method: 'POST',
            url: "/rest/orders/cancel",
            params:{'idOrder' : id, 'user': user},
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded',
            }
        }).then(
            function successCallback(response) {// Nếu thành công
                sweetalert("Hủy thành công đơn hàng")
                setInterval(()=>{
                    location.href = "/order/list";
                },2000)
              
            },
            function errorCallback(response) { // Nếu thất bại
                sweetalert("Có lỗi sảy ra");
            }
        ) 
    }
})