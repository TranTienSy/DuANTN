    // Địa chỉ API và token
    const provinceApiUrl = "https://online-gateway.ghn.vn/shiip/public-api/master-data/province";
    const districtApiUrl = "https://online-gateway.ghn.vn/shiip/public-api/master-data/district";
    const wardApiUrl = "https://online-gateway.ghn.vn/shiip/public-api/master-data/ward";
    const token = "515da333-591c-11ee-b394-8ac29577e80e";

    const provinceSelect = document.getElementById("provinceSelect");
    const districtSelect = document.getElementById("districtSelect");
    const wardSelect = document.getElementById("wardSelect");

    // Lấy dữ liệu tỉnh/thành phố từ API
    fetch(provinceApiUrl, {
    method: "GET",
    headers: {
    "Content-Type": "application/json",
    "Token": token
}
})
    .then(response => response.json())
    .then(data => {
    data.data.forEach(province => {
        const option = document.createElement("option");
        option.value = province.ProvinceID;
        option.textContent = province.ProvinceName;
        provinceSelect.appendChild(option);
    });

    // Sự kiện khi giá trị tỉnh/thành phố thay đổi
    provinceSelect.addEventListener("change", function() {
    const selectedProvinceID = this.value;

    // Lấy dữ liệu quận/huyện dựa trên ProvinceID
    fetch(`${districtApiUrl}?province_id=${selectedProvinceID}`, {
    method: "GET",
    headers: {
    "Content-Type": "application/json",
    "Token": token
}
})
    .then(response => response.json())
    .then(data => {
    districtSelect.innerHTML = ""; // Xóa các tùy chọn cũ
    wardSelect.innerHTML = ""; // Xóa các tùy chọn cũ

    data.data.forEach(district => {
    const option = document.createElement("option");
    option.value = district.DistrictID;
    option.textContent = district.DistrictName;
    districtSelect.appendChild(option);
});

    // Sự kiện khi giá trị quận/huyện thay đổi
    districtSelect.addEventListener("change", function() {
    const selectedDistrictID = this.value;

    // Lấy dữ liệu phường/xã dựa trên DistrictID
    fetch(`${wardApiUrl}?district_id=${selectedDistrictID}`, {
    method: "GET",
    headers: {
    "Content-Type": "application/json",
    "Token": token
}
})
    .then(response => response.json())
    .then(data => {
    wardSelect.innerHTML = ""; // Xóa các tùy chọn cũ

    data.data.forEach(ward => {
    const option = document.createElement("option");
    option.value = ward.WardID;
    option.textContent = ward.WardName;
    wardSelect.appendChild(option);
});
})
    .catch(error => {
    console.error("Lỗi khi lấy dữ liệu phường/xã từ API:", error);
});
});
})
    .catch(error => {
    console.error("Lỗi khi lấy dữ liệu quận/huyện từ API:", error);
});
});
})
    .catch(error => {
    console.error("Lỗi khi lấy dữ liệu tỉnh/thành phố từ API:", error);
});