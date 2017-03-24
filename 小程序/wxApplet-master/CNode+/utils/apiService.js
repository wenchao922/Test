let apiService = {
    baseUrl: "https://cnodejs.org/api/v1",
    get(options, callback) {
        var param = '';
        var url = `${this.baseUrl}${options.url}`;
        /*if (options.param) {
            Object.keys(options.param).map((field) => {
                param += `${field}=${options.param[field]}&`;
            })
            url = `${url}?${param}`;
        }*/
        wx.request({
            url: url,
            method: 'GET',
            data:options.param,
            success: function(res) {
                callback(res.data);
            },
            fail: function(res) {
                wx.showToast({
                    title: "请求失败",
                    icon: "fail",
                    duration: 2000
                })
            }
        })
    }
}

module.exports = apiService