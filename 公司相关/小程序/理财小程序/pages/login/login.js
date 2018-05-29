import { validate, utils } from '../../utils/index.js';

Page({

  /**
   * 页面的初始数据
   */
  data: {

    time:60,
    countTime:60,
    codeText: "获取验证码",
    phone: '',
    code: '',
    isAllowGetCode: true
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {

    wx.setNavigationBarTitle({
      title: '登录',
    })

    this.setCountDown = this.setCountDown.bind(this);
  },

  getCode: function(e){

    if(!this.data.isAllowGetCode) return;

    let data = e.target.dataset;
    let phone = data.phone;

    if(!validate.isPhone(phone)){

      utils.tipInfo({

        content: '输入正确的手机号'
      })
      return;
    }

    this.setCountDown();
    
    let promise = utils.fetch({

      method: 'post',
      url: 'https://consumer.credan.com/wx/enrollSendCode',
      data: {
        phone: phone
      }
    })

    promise.then(data => {
      
    })

  },

  setCountDown(){
    let countTime = this.data.countTime;
    let time = this.data.time;
    
    this.setData({

      isAllowGetCode: false,
      codeText: `(${countTime}s)重发`
    })

    let timer = setInterval(() => {

      time--;
      if(time == 0){

        clearInterval(timer);
        this.setData({

          codeText: '获取验证码',
          isAllowGetCode: true
        })
      } else {

        this.setData({

          codeText: `(${time}s)重发`
        })
      }
      
    }, 1000)

  },

  bindPhoneInput: function(e){

    this.setData({

      phone: e.detail.value
    })
  },
  bindCodeInput: function(e){

    this.setData({

      code: e.detail.value
    })
  },

  login: function(e){
    let data = e.target.dataset;
    let phone = data.phone;
    let code = data.code;
    
    // wx.setStorageSync("isLogin", true)

    // wx.navigateBack({
    //   delta:1
    // })

    // return;

    if(!validate.isPhone(phone)){
      utils.tipInfo({

        content: '输入正确手机号'
      })
      return;
    }

    if(!validate.isNumber(code)){
      utils.tipInfo({

        content: '输入正确验证码'
      })
      return;
    }

    let promise = utils.fetch({

      url: 'https://consumer.credan.com/v16/app/login',
      method: 'post',
      data: {
        phone: phone,
        code: code, 
        firmId:'xiaochengxu',
        merchantId: 'xiaochengxu'
      }
    })

    promise.then(data => {

          wx.setStorageSync("isLogin", true)
          wx.setStorageSync("phone", phone);

          wx.navigateBack({
            delta:1
          })
          
    })
  },

  /**
   * 生命周期函数--监听页面初次渲染完成
   */
  onReady: function () {
  
  },

  /**
   * 生命周期函数--监听页面显示
   */
  onShow: function () {
  
  },

  /**
   * 生命周期函数--监听页面隐藏
   */
  onHide: function () {
  
  },

  /**
   * 生命周期函数--监听页面卸载
   */
  onUnload: function () {
  
  },

  /**
   * 页面相关事件处理函数--监听用户下拉动作
   */
  onPullDownRefresh: function () {
  
  },

  /**
   * 页面上拉触底事件的处理函数
   */
  onReachBottom: function () {
  
  },

  /**
   * 用户点击右上角分享
   */
  onShareAppMessage: function () {
  
  }
})