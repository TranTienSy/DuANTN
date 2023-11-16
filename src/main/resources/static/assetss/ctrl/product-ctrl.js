app.controller("product-ctrl", function ($scope, $http) {
    var url = "/rest/products";
    var url1 = "/rest/categories";
    var url2 = "/rest/upload/images";
    $scope.items = [];
    $scope.cates = [];
    $scope.form = {};


    $scope.product = {
        name: '',
        variants: []
    };

    $scope.addVariant = function () {
        if (!$scope.form) {
            $scope.form = {};
        }
    
        if (!$scope.form.listOfProductVariants) {
            $scope.form.listOfProductVariants = [];
        }
    
        if ($scope.isVariantDataEntered()) {
            $scope.form.listOfProductVariants.push({
                size: '',
                color: '',
                quantity: ''
            });
        } else {
            alert('Vui lòng nhập đầy đủ thông tin biến thể trước khi thêm một biến thể mới.');
        }
    };

    $scope.removeVariant = function (index) {
        if ($scope.form.listOfProductVariants.length > 1) {
            $scope.form.listOfProductVariants.splice(index, 1);
        } else {
            alert('Bạn phải nhập đẩy đủ thuộc tính');
        }
    };

    $scope.isVariantDataEntered = function () {
        if ($scope.form && $scope.form.listOfProductVariants) {
            return $scope.form.listOfProductVariants.every(function (variant) {
                return variant.size.trim() !== '' && variant.color.trim() !== '' && variant.quantity !== '';
            });
        } else {
            return true;
        }
    };

    $scope.addProduct = function () {
        if ($scope.isVariantDataEntered()) {
          
            var dataSend = {
                product : angular.copy($scope.form),
                listOfProductvariants :  $scope.form.listOfProductVariants
            }
            if(!$scope.form.listOfProductVariants){
                alert("Vui Lòng Nhập Thuộc Tính Của Sản Phẩm");
                return;
            }

            $http({
                method: 'POST',
                url: url,
                data: dataSend,
                headers: {
                    'Content-Type': 'application/json'
                }
            }).then(
                function successCallback(resp) {// Nếu thành công
                    resp.data.createDate = new Date(resp.data.createDate)
                    $scope.items.push(resp.data);
                    $scope.reset();
                    sweetalert("Thêm mới thành công!");
                },
                function errorCallback(response) { // Nếu thất bại
                    sweetalert("Lỗi thêm mới sản phẩm!");
                    console.log("Error", error);
                }
            )
            // Bạn có thể thêm mã ở đây để gửi dữ liệu đến máy chủ bằng AJAX hoặc các phương thức khác
        } else {
            alert('Vui lòng nhập đầy đủ thông tin biến thể trước khi thêm một biến thể mới.');
        }
    };

    
    $scope.updateProduct = function () {
        if ($scope.isVariantDataEntered()) {

            var item = angular.copy($scope.form);
            var dataSend = {
                product : item,
                listOfProductvariants :  $scope.form.listOfProductVariants
            }

            $http({
                method: 'PUT',
                url: url+"/"+item.id,
                data: dataSend,
                headers: {
                    'Content-Type': 'application/json'
                }
            }).then(
                function successCallback(resp) {// Nếu thành công
                    var index = $scope.items.findIndex(p => p.id == item.id);
                    $scope.items[index] = item;
                    $scope.reset();
                    sweetalert("Cập nhật sản phẩm thành công!");
                },
                function errorCallback(response) { // Nếu thất bại
                    sweetalert("Lỗi cập nhật sản phẩm!");
                console.log("Error", error);
                }
            )
            // Bạn có thể thêm mã ở đây để gửi dữ liệu đến máy chủ bằng AJAX hoặc các phương thức khác
        } else {
            alert('Vui lòng nhập đầy đủ thông tin biến thể trước khi thêm một biến thể mới.');
        }
    };

    var sweetalert = function (text) {
        Swal.fire({
            icon: "success",
            title: text,
            showConfirmButton: false,
            timer: 2000,
        });
    }

    $scope.initialize = function () {
        //load product
        $http.get(url).then(resp => {
            console.log(resp.data)
            $scope.items = resp.data;
            $scope.items.forEach(item => {
                item.createDate = new Date(item.createDate)
            })
        });

        //load categories
        $http.get(url1).then(resp => {
            $scope.cates = resp.data;
        });
    }

    //khoi dau
    $scope.initialize();

    //xoa form
    $scope.reset = function () {
        $scope.form = {
            createDate: new Date(),
            image: 'cloud-upload.jpg',
            ivailable: true,
        };
    }

    //hien thi len form
    $scope.edit = function (item) {
        $scope.form = angular.copy(item);
        $(".nav-tabs a:eq(0)").tab('show');
    }

    //them sp moi
    $scope.create = function () {
        var item = angular.copy($scope.form);
        $http.post(`${url}`, item).then(resp => {
            resp.data.createDate = new Date(resp.data.createDate)
            $scope.items.push(resp.data);
            $scope.reset();
            sweetalert("Thêm mới thành công!");
        }).catch(error => {
            sweetalert("Lỗi thêm mới sản phẩm!");
            console.log("Error", error);
        });
    }

    //cap nhat sp
    $scope.update = function () {
        var item = angular.copy($scope.form);
        $http.put(`${url}/${item.id}`, item).then(resp => {
            var index = $scope.items.findIndex(p => p.id == item.id);
            $scope.items[index] = item;
            $scope.reset();
            sweetalert("Cập nhật sản phẩm thành công!");
        }).catch(error => {
            sweetalert("Lỗi cập nhật sản phẩm!");
            console.log("Error", error);
        });
    }

    //xoa sp
    $scope.delete = function (item) {
        $http.delete(`${url}/${item.id}`).then(resp => {
            var index = $scope.items.findIndex(p => p.id == item.id);
            $scope.items.splice(index, 1);
            $scope.reset();
            sweetalert("Xóa sản phẩm thành công!");
        }).catch(error => {
            sweetalert("Lỗi xóa sản phẩm!");
            console.log("Error", error);
        });
    }

    //upload hinh
    $scope.imageChanged = function (files) {
        var data = new FormData();
        data.append('file', files[0]);
        $http.post(url2, data, {
            transformRequest: angular.identity,
            headers: { 'Content-Type': undefined }
        }).then(resp => {
            $scope.form.image = resp.data.name;
        }).catch(error => {
            sweetalert("Lỗi tải lên hình ảnh!");
            console.log("Error", error);
        })
    }

    //phan trang
    //    $scope.pager = {
    //        page: 0,
    //        size: 10,
    //        get items() {
    //            var start = this.page * this.size;
    //            return $scope.items.slice(start, start + this.size);
    //        },
    //        get count() {
    //            return Math.ceil(1.0 * $scope.items.length / this.size)
    //        },
    //        first() {
    //            this.page = 0;
    //        },
    //        prev() {
    //            this.page--;
    //            if (this.page < 0) {
    //                this.last();
    //            }
    //        },
    //        next() {
    //            this.page++;
    //            if (this.page >= this.count) {
    //                this.first();
    //            }
    //        },
    //        last() {
    //            this.page = this.count - 1;
    //        }
    //    }

});