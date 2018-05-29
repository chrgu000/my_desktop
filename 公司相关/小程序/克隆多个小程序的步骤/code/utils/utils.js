module.exports = {

  tipInfo(opt){

    let content = opt.content || '';
    let callback = opt.callback || function(){};

    // wx.showLoading({
    //   title: content,
    // })

    // setTimeout(()=>{

    //     wx.hideLoading();
    // }, 2000)

    wx.showToast({
      title: content,
      icon: 'loading',
      duration: 2000
    })
  },
  fetch(opt) {

    wx.showLoading({
      title: '加载中...',
    })
    let url = opt.url || '';
    let method = opt.method || 'get';
    let data = opt.data || '';

    return new Promise((resolve, reject) => {

      wx.request({
        url: url, 
        method: method,
        data: data,
        success: response => {

          wx.hideLoading();

          data = response.data;

          if(typeof data.code != 'undefined'){

            if (data.code !== 0) {

              wx.showToast({
                title: '服务器异常',
                icon:'loading'
              })
              reject(data);
            }

            resolve(data.data);

          } else {
            
            resolve(data);
          }

        },

        error: error => {

          wx.showToast({
            title: '服务器异常',
            icon: 'loading'
          })
        }
      })
    })


  }
}