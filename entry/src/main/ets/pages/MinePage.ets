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
  @State row1: Item[] = [
    {
      id: 1,
      name: '我的订单',
      image: 'app.media.wodedingdan',
      route: ''
    },
    {
      id: 2,
      name: '优惠卡券',
      image: 'app.media.youhuikaquan',
      route: ''
    },
    {
      id: 3,
      name: '抢票预约',
      image: 'app.media.qiangpiaoyuyue',
      route: ''
    },
    {
      id: 4,
      name: '想看',
      image: 'app.media.shoucang',
      route: ''
    }]
  @State row2: Item[] = [
    {
      id: 1,
      name: '观影人/地址',
      image: 'app.media.guanyanren',
      route: ''
    },
    {
      id: 2,
      name: '在线客服',
      image: 'app.media.kefu',
      route: ''
    },
    {
      id: 3,
      name: '周边商城',
      image: 'app.media.zhoubianshangcheng',
      route: ''
    },
    {
      id: 4,
      name: '观演团',
      image: 'app.media.guanyingtuan',
      route: ''
    }]

  // 带渐变边框的统计项
  @Builder
  StatItem(num: string, unit: string, label: string) {
    Stack() {
      // 外层：渐变边框背景
      Column()
        .width('100%')
        .height('100%')
        .borderRadius(12)
        .linearGradient({
          angle: 135,
          colors: [['#FFD700', 0.0], ['#FFA500', 0.5], ['#FF6347', 1.0]]
        })

      // 内层：白色内容区域
      Column() {
        // 数字区域 - 固定高度，底部对齐
        Row() {
          Text(num)
            .fontSize(34)
            .fontWeight(FontWeight.Bold)
            .fontColor('#030716')

          Text(unit)
            .fontSize(14)
            .fontWeight(FontWeight.Bold)
            .fontColor('#030716')
            .margin({ left: 2 })
        }
        .width('100%')
        .height(40)  // 固定高度
        .justifyContent(FlexAlign.Center)
        .alignItems(VerticalAlign.Bottom)  // 底部对齐

        // 标签区域 - 固定高度，底部对齐
        Row() {
          Text(label)
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .fontColor('#030716')
          Image($r('app.media.gengduo'))
            .width(20)
            .height(20)
        }
        .width('100%')
        .height(25)  // 固定高度
        .justifyContent(FlexAlign.Center)
        .alignItems(VerticalAlign.Bottom)  // 底部对齐
      }
      .width('100%')
      .height('100%')
      .padding(3) // 边框宽度
      .backgroundColor(Color.White)
      .borderRadius(10)
    }
  }

  // 带渐变边框的徽章项
  @Builder
  BadgeItem() {
    Stack() {
      // 外层：渐变边框背景
      Column()
        .width('100%')
        .height('100%')
        .borderRadius(12)
        .linearGradient({
          angle: 135,
          colors: [['#FFD700', 0.0], ['#FFA500', 0.5], ['#FF6347', 1.0]]
        })

      // 内层：白色内容区域
      Column() {
        // "待授权"区域 - 固定高度，底部对齐（与数字对齐）
        Row() {
          Text('待授权')
            .fontSize(20)
            .fontWeight(FontWeight.Bold)
            .fontColor('#030716')
        }
        .width('100%')
        .height(40)  // 与StatItem数字区域相同高度
        .justifyContent(FlexAlign.Center)
        .alignItems(VerticalAlign.Bottom)  // 底部对齐

        // "徽章"区域 - 固定高度，底部对齐（与标签对齐）
        Row() {
          Text('徽章')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .fontColor('#030716')
          Image($r('app.media.gengduo'))
            .width(20)
            .height(20)
        }
        .width('100%')
        .height(25)  // 与StatItem标签区域相同高度
        .justifyContent(FlexAlign.Center)
        .alignItems(VerticalAlign.Bottom)  // 底部对齐
      }
      .width('100%')
      .height('100%')
      .padding(3) // 边框宽度
      .backgroundColor(Color.White)
      .borderRadius(10)
    }
  }


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
            Image($r('app.media.touxiang'))
              .width(70)
              .height(70)
              .borderRadius(15)
              .margin({ left: 16 ,right: 16})

            Column() {
              Text('用户名')
                .fontSize(18)
                .fontColor('#333333')
                .margin({ bottom: 4 })
              Text('关注 2')
                .fontSize(13)
            }
          }
          .width('100%')

          //现场足迹 纪念票 徽章 升级会员
          Column() {
            Row(){
              //现场足迹 - 宽度比例为2 (50%)
              Column() {
                this.StatItem('0', '个', '现场足迹')
              }
              .width('40%')

              //纪念票 - 宽度比例为1 (25%)
              Column() {
                this.StatItem('0', '张', '纪念票')
              }
              .width('25%')

              //徽章 - 宽度比例为1 (25%)
              Column() {
                this.BadgeItem()
              }
              .width('25%')

            }
            .height(100)
            .width('100%')
            .justifyContent(FlexAlign.SpaceBetween)
            .padding(10)

            Row(){
              //升级会员
              Text('升为会员')
                .fontSize(18)
                .fontWeight(FontWeight.Bold)
                .fontColor('#8A3F1C')

              Text(' | ')
                .fontSize(16)
                .fontColor('#C7A58C')
                .layoutWeight(1)

              Row() {
                Text('立即升级')
                  .fontSize(12)
                  .fontWeight(FontWeight.Bold)
                  .fontColor(Color.White)
                Image($r('app.media.youjiantou'))
                  .width(18)
                  .height(18)
                  .fillColor(Color.White)
              }
              .padding(5)
              .backgroundColor('#8B3F1C')
              .borderRadius(5)

            }
            .width('100%')
            .height(45)
            .padding({ left: 16, right: 10 })
            .backgroundColor('#FFF3E8')
            .borderRadius(12)
            .margin({ bottom: 10 })

          }
          .width('95%')
          .backgroundColor(Color.White)
          .borderRadius(24)
          .padding({ left: 10, right: 10})
          .margin(10)
          // 整个模块的外边框（圆角）
          .border({
            width: 2,
            color: '#E0E0E0',
            radius: 24,
            style: BorderStyle.Solid
          })

          //row1
          Row() {
            ForEach(this.row1, (item: Item) => {
              Column() {
                Image($r(item.image))
                  .width(50)
                  .height(50)

                Text(item.name)
                  .fontSize(12)
                  .fontColor('#333333')
                  .fontWeight(FontWeight.Bold)
              }
              .width('25%')
              .justifyContent(FlexAlign.Center)
            }, (item: Item) => item.id.toString())
          }
          .border({
            width: 2,
            color: '#E0E0E0',
            radius: 24,
            style: BorderStyle.Solid
          })
          .height(80)
          .width('95%')
          .justifyContent(FlexAlign.SpaceEvenly)

          //我的票夹
          Row() {
            Text('我的票夹')
              .fontSize(18)
              .fontWeight(FontWeight.Bold)
              .margin({ left: 10, right: 10 })
            Text('暂无待观看的票')
              .fontColor(Color.Gray)
              .fontSize(13)
              .layoutWeight(1)
            Text('查看更多票')
              .fontSize(13)
            Image($r('app.media.youjiantou'))
              .width(15)
              .height(15)
              .margin({ left: 5 })
          }
          .padding({ top: 8, bottom: 8 })
          .margin(10)
          .width('95%')
          .height(40)
          .border({
            width: 2,
            color: '#E0E0E0',
            radius: 15,
            style: BorderStyle.Solid
          })
          .alignItems(VerticalAlign.Bottom)

          //row2
          Row() {
            ForEach(this.row2, (item: Item) => {
              Column() {
                Image($r(item.image))
                  .width(30)
                  .height(30)
                  .margin(5)

                Text(item.name)
                  .fontSize(12)
                  .fontColor('#333333')
                  .fontWeight(FontWeight.Bold)
              }
              .width('25%')
              .justifyContent(FlexAlign.Center)
            }, (item: Item) => item.id.toString())
          }
          .border({
            width: 2,
            color: '#E0E0E0',
            radius: 24,
            style: BorderStyle.Solid
          })
          .height(80)
          .width('95%')
          .justifyContent(FlexAlign.SpaceEvenly)

          //广告栏
          Row() {

          }

          //下面还有东西
        }
      }
      .width('100%')
      .layoutWeight(1) // 占据剩余空间

      // 底部固定导航栏
      BottomNavBar({ currentPage: '我的' })
    }
    .width('100%')
    .height('100%')
  }
}
