import { BottomNavBar } from '../components/BottomNavBar';

interface Item {
  id:number
  name: string
  image: string
  route:string
}
@Entry
@Component
struct MinePage {
  @State row1 : Item[] = [
    {id:1, name: '我的订单', image:'app.media.wodedingdan',route:''},
    {id:2, name: '优惠卡券', image:'app.media.youhuikaquan',route:''},
    {id:3, name: '抢票预约', image:'app.media.qiangpiaoyuyue',route:''},
    {id:4, name: '想看', image:'app.media.shoucang',route:''}]

  @State row2 : Item[] = [
    {id:1, name: '观影人/地址', image:'app.media.guanyanren',route:''},
    {id:2, name: '在线客服', image:'app.media.kefu',route:''},
    {id:3, name: '周边商城', image:'app.media.zhoubianshangcheng',route:''},
    {id:4, name: '观演团', image:'app.media.guanyingtuan',route:''}]

  build() {
    Column() {
      Scroll() {
      // 页面内容区域
        Column() {
          Row() {
            Image($r('app.media.shezhi'))
              .width(30)
              .height(30)

            Image($r('app.media.xinxi'))
              .width(30)
              .height(30)
              .margin({ left: 16 })
          }
          .width('100%')
          .justifyContent(FlexAlign.End)
          .padding({ right: 16 })

          //个人
          Row() {

          }

          //现场足迹 纪念票 徽章 升级会员
          Row() {

          }

          //row1
          Row() {
            ForEach(this.row1, (item: Item) => {
              Column() {
                Image($r(item.image))
                  .width(40)
                  .height(40)
                
                Text(item.name)
                  .fontSize(12)
                  .fontColor('#333333')
              }
              .width('25%')
              .justifyContent(FlexAlign.Center)
            }, (item: Item) => item.id.toString())
          }
          .height(80)
          .width('100%')
          .justifyContent(FlexAlign.SpaceEvenly)

          //我的票夹
          Row() {
            Text('我的票夹')
              .fontSize(20)
              .margin({left:10,right:10})
            Text('暂无待观看的票')
              .fontColor(Color.Gray)
              .fontSize(13)
              .layoutWeight(1)
            Text('查看更多票')
              .fontSize(13)
          }
          .padding({top:8,bottom:8})
          .width('100%')
          .height(40)
          .borderRadius(5)
          .borderColor(Color.Black)
          .borderWidth(1)
          .alignItems(VerticalAlign.Bottom)

          //row2
          Row() {
            ForEach(this.row2, (item: Item) => {
              Column() {
                Image($r(item.image))
                  .width(40)
                  .height(40)
                
                Text(item.name)
                  .fontSize(12)
                  .fontColor('#333333')
              }
              .width('25%')
              .justifyContent(FlexAlign.Center)
            }, (item: Item) => item.id.toString())
          }
          .height(80)
          .width('100%')
          .justifyContent(FlexAlign.SpaceEvenly)

         //广告栏
         Row() {

         }

          //下面还有东西
        }
      }
      .height('100%')
      .width('100%')
      .layoutWeight(1) // 占据剩余空间
      
      // 底部固定导航栏
      BottomNavBar({ currentPage: '我的' })
    }
    .width('100%')
    .height('100%')
  }
}
