
import utils from '../../utils/utils.js';

Page({

  /**
   * 页面的初始数据
   */
  data: {
    basePic: '',
    pos1:[],
    pos2:[],
    pos3:[],
    pos4:[],
    test:"你好啊"
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
   
    wx.setNavigationBarTitle({
      title: '首页',
    })

    let promise = utils.fetch({

      method: 'post',
      url: "https://api.credan.com/v3/getRecommendation",
      data: {
        pageKey:'licaiIndex'
      }
    })

    promise.then(data => {
      
      let content = data.data;
      console.log(content);
      this.setData({
        
        basePic: data.basePic,
        pos1: content["licaiIndex-pos1"],
        pos2: content["licaiIndex-pos2"],
        pos3: content["licaiIndex-pos3"],
        pos4: content["licaiIndex-pos4"]
      })
    })
  },

  toList: function(){

    wx.navigateTo({
      url: '/pages/list/list',
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