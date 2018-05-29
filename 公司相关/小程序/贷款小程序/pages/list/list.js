// pages/list/list.js
import { utils } from '../../utils/index.js';

Page({

  /**
   * 页面的初始数据
   */
  data: {
    isLogin: false,
    phone: '',
    listPos1: [],
    basePic: ''
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {

    //设置标题
    wx.setNavigationBarTitle({
      title: '列表页',
    })

    //初始化本地数据
    try{

        let res = wx.getStorageSync("isLogin");
        let phone = wx.getStorageSync("phone");
        
        // console.log(res);
        this.setData({

          isLogin: res,
          phone: phone
        })

    }catch(e){

      wx.showToast({
        title: e,
      })
    }

    //初始化远程数据
    let promise = utils.fetch({

      method: 'post',
      url: 'https://api.credan.com/v3/getRecommendation',
      data: {
        pageKey: "daikuanList"
      }
    })

    promise.then(data => {

      let listPos1 = data.data["daikuanList-ListPos1"];

      listPos1.map(item => {

        let params = item.link.split('|');
        
        params.forEach(list => {

          let temArr = list.split('=');

          if(temArr[1].indexOf(',') > -1){

            item[temArr[0]] = temArr[1].split(','); 
          } else {
            item[temArr[0]] = temArr[1]; 
          }
          
        })
      })

      this.setData({

        basePic: data.basePic,
        listPos1: listPos1
      })
    })

  },

  toLogin: function(){

    wx.navigateTo({
      url: '/pages/login/login',
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

    this.onLoad()
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