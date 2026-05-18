import router from '@ohos.router'
import { BusinessError } from '@kit.BasicServicesKit';
import { BottomNavBar } from '../components/BottomNavBar';

interface MenuItem {
  id:number
  name: string
  image: string
  route:string
}

interface Items{
  title: string
  image: string
  buttonText:string
  heading:string
  buttonImage:string
  cardType: string
}

interface SwiperGestureInfo { currentOffset?: number }

interface SliderItem {
  image: string
  title: string
  price: string
  type: 'performance' | 'movie' // 区分演出和电影类型
}

interface SliderSection {
  title: string
  items: SliderItem[]
  type: 'performance' | 'movie'
}

@Entry
@Component

struct MainPage {
  @State cityName: string = '福州'
  @State searchText: string = ''  // 搜索内容

  @State currentMunePage: number = 1  // 当前页码
  @State munePageSize: number = 10    // 每页数量
  @State swipeProgress: number = 0    // 滑动进度 (0-1)

  @State menuItems: MenuItem[] = [
    {
      id: 1,
      name: '演唱会',
      image: 'app.media.concerts',
      route: 'ConcertPage'
    },
    {
      id: 2,
      name: '话剧音乐剧',
      image: 'app.media.theater',
      route: 'DramaPage'
    },
    {
      id: 3,
      name: '电影',
      image: 'app.media.movies',
      route: 'MoviePage'
    },
    {
      id: 4,
      name: '景点乐园',
      image: 'app.media.attractions',
      route: 'AttractionPage'
    },
    {
      id: 5,
      name: '体育',
      image: 'app.media.sports',
      route: 'SportsPage'
    },
    {
      id: 6,
      name: '音乐节',
      image: 'app.media.music_festival',
      route: 'MusicPage'
    },
    {
      id: 7,
      name: 'Livehouse',
      image: 'app.media.liveshouse',
      route: 'LivehousePage'
    },
    {
      id: 8,
      name: '舞蹈舞剧',
      image: 'app.media.dance',
      route: 'DancePage'
    },
    {
      id: 9,
      name: '脱口秀',
      image: 'app.media.talk_shows',
      route: 'TalkShowPage'
    },
    {
      id: 10,
      name: '相声曲艺',
      image: 'app.media.comedy',
      route: 'OperaPage'
    },
    {
      id: 11,
      name: '沉浸式演出',
      image: 'app.media.immersive_performance',
      route: 'ImmersivePerformancePage'
    },
    {
      id: 12,
      name: '展览',
      image: 'app.media.exhibition',
      route: 'ExhibitionPage'
    },
    {
      id: 13,
      name: '音乐会',
      image: 'app.media.concert',
      route: 'ConcertPage'
    },
    {
      id: 14,
      name: '儿童亲子',
      image: 'app.media.children_family',
      route: 'ChildrenFamilyPage'
    },
    {
      id: 15,
      name: '演出日历',
      image: 'app.media.performance_calendar',
      route: 'PerformanceCalendarPage'
    },
    {
      id: 16,
      name: '全球演出',
      image: 'app.media.global_performance',
      route: 'GlobalPerformancePage'
    },
    {
      id: 17,
      name: '大麦榜单',
      image: 'app.media.damai_ranking',
      route: 'DamaiRankingPage'
    },
    {
      id: 18,
      name: '现场壕礼',
      image: 'app.media.live_rewards',
      route: 'LiveRewardsPage'
    },
    {
      id: 19,
      name: '周边商城',
      image: 'app.media.peripheral_store',
      route: 'PeripheralStorePage'
    },
    {
      id: 20,
      name: '全部',
      image: 'app.media.all_categories',
      route: 'AllCategoriesPage'
    }
  ]


  @State CardsItems:Items[] = [
    { title:'抢票播报站',image:'app.media.jolin',heading:'Jolin蔡依林PLEASURE巡回演唱会2026',buttonText:'8.7万人热抢',buttonImage:'app.media.qiang',cardType: 'broadcast'},
    {title:'今日秒杀',image:'app.media.card2',heading:'【肆笑喜剧】精品秀|轻松解压|情侣约会|学生优惠|@东街口大洋百货店',buttonText:'￥29',buttonImage:'app.media.miao',cardType: 'seckill'}
  ]

  @State sliderItems: SliderItem[] = [
    { image: 'app.media.1', title: '胡彦斌2026【是一场烟火·刹那】巡回演唱会-福州站', price: '￥380起', type: 'performance' },
    { image: 'app.media.2', title: 'Tank吕建忠“第∞回合”巡回演唱会-福州站', price: '￥380起', type: 'performance' },
    { image: 'app.media.3', title: '新·国风舞剧《翎衣》-平潭站', price: '￥100起', type: 'performance' },
    { image: 'app.media.4', title: 'Jolin蔡依林PLEASURE巡回演唱会2026-福州站', price: '￥490起', type: 'performance' },
    { image: 'app.media.5', title: 'KPOPCN福州站', price: '￥88起', type: 'performance' },
    { image: 'app.media.6', title: '北方昆曲剧院经典剧目《玉簪记》', price: '￥80起', type: 'performance' },
    { image: 'app.media.7', title: '【福立社戏剧】脱口秀小剧场拼盘秀&个人专场', price: '￥60起', type: 'performance' },
    { image: 'app.media.8', title: '江辰·福州站', price: '￥99起', type: 'performance' },
    { image: 'app.media.9', title: '魏春荣、邵峥领衔主演 经典昆曲《狮吼记》', price: '￥80起', type: 'performance' },
    { image: 'app.media.10', title: '【福建博物院】发现·海昏——西汉大一统叙事下的东南华章', price: '￥19起', type: 'performance' },
    { image: 'app.media.11', title: '7月4日《乃万【Selves们2.0】巡演》福州站', price: '￥180起', type: 'performance' },
    { image: 'app.media.12', title: '帆布小镇【心生炙热】2026巡演-福州站', price: '￥120起', type: 'performance' },
    { image: 'app.media.13', title: '给阿嫲的情书', price: '', type: 'movie' },
    { image: 'app.media.14', title: '寒战1994', price: '', type: 'movie' },
    { image: 'app.media.15', title: '穿普拉达的女王2', price: '', type: 'movie' },
    { image: 'app.media.16', title: '消失的人', price: '', type: 'movie' },
    { image: 'app.media.17', title: '真人快打2', price: '', type: 'movie' },
    { image: 'app.media.18', title: '迈克尔·杰克逊：巨星之路', price: '', type: 'movie' },
    { image: 'app.media.19', title: '纵横四海', price: '', type: 'movie' },
    { image: 'app.media.20', title: '10间敢死队', price: '', type: 'movie' },
    { image: 'app.media.21', title: '挽救计划', price: '', type: 'movie' },
    { image: 'app.media.22', title: '我，许可', price: '', type: 'movie' },
    { image: 'app.media.23', title: '超级马力欧', price: '', type: 'movie' },
    { image: 'app.media.24', title: '寂静的朋友', price: '', type: 'movie' },
  ]

  @Builder
  CardsBulider(item:Items) {
    Column({ space: 8 }) {
      Row() {
        Text(item.title)
          .fontSize(15)
          .fontWeight(FontWeight.Bold)
          .layoutWeight(1)
          .textAlign(TextAlign.Start)
        Image($r('app.media.arrow_right'))
          .backgroundColor(Color.Black)
          .width(18)
          .height(18)
          .margin({ left: 10 })
          .borderRadius(5)
      }
      .width('100%')
      .margin({ bottom: 10 })

      Row() {
        if (item.cardType === 'broadcast') {
          Stack({ alignContent: Alignment.Bottom }) {
            Image($r(item.image))
              .width(45)
              .height(65)
              .objectFit(ImageFit.Cover)
              .borderRadius(12)
            Row() {
              Text('蔡依林')
                .fontColor(Color.White)
                .fontSize(10)
            }.width('100%')
            .height(15)
            .justifyContent(FlexAlign.Center)
            //渐变
            .linearGradient({
              direction:GradientDirection.Bottom,
              colors:[
                ['#00000000', 0.0],
                ['#FF9800', 0.5],
                ['#FF5722', 1.0]
              ]
            })
          }
          .width(45)
          .height(65)
        } else {
          // 秒杀类型直接显示图片
          Image($r(item.image))
            .width(45)
            .height(65)
            .objectFit(ImageFit.Cover)
            .borderRadius(12)
        }

        Column() {
          Text(item.heading)
            .fontSize(16)
            .maxLines(2)
            .textOverflow({ overflow: TextOverflow.Ellipsis })
            .width('100%')
            .margin({ bottom: 10 })
          Button() {
            Text(item.buttonText)
              .fontSize(10)
              .fontColor(item.cardType === 'seckill' ? '#FF9800' : Color.Black)
              .textAlign(TextAlign.Start)
              .width('100%')
          }
          .width(90)
          .height(20)
          .backgroundImage($r(item.buttonImage), ImageRepeat.NoRepeat)
          .backgroundImageSize(ImageSize.Cover)
          .padding(6)
          .margin({ right: 4 })
        }
        .layoutWeight(1)
        .padding({ left: 12 })
      }
    }
    .border({
      width:1,
      radius: 12,
      color:Color.Transparent
    })
    .linearGradient({
      angle: 180,
      colors:[
        ['#FFFAC6BF', 0.0],
        ['#fff8f1f1',0.5],
        ['#ffffffff', 1.0]
      ]
    })
    .padding({ top: 8, bottom: 8, left: 12, right: 12 })
    .margin({ left: 10 ,right:10})
    .layoutWeight(1)
    .width('48%')
    .height(120)
  }

  @Builder

  @Builder
  MenulconBuilder(item: MenuItem) {
    Column({ space:6 }) {
      Image($r(item.image))
        .width(40)
        .height(40)
        .objectFit(ImageFit.Contain)
      Text(item.name)
        .fontSize(11)
        .fontWeight(FontWeight.Bold)
        .fontColor('#000000')
        .textAlign(TextAlign.Center)
        .maxLines(1)
    }
    .width('100%')
    .height(40)
    .justifyContent(FlexAlign.Center)

  }

  // 计算总页数
  getTotalPages(): number {
    return Math.ceil(this.menuItems.length / this.munePageSize);
  }

  // 滚动指示器构建器 - 长条样式（支持实时滑动）
  @Builder
  IndicatorBuilder() {
    Column() {
      // 长条指示器容器
      Stack({ alignContent: Alignment.Start }) {
        // 背景条
        Row()
          .width('100%')
          .height(4)
          .backgroundColor('#F0F0F0')
          .borderRadius(2)
        
        // 动态滑块 - 实时跟随滑动
        Row()
          .width(`${100 / this.getTotalPages()}%`)
          .height(4)
          .backgroundColor('#FF9800')
          .borderRadius(2)
          .margin({ 
            left: `${((this.currentMunePage - 1) + this.swipeProgress) * (100 / this.getTotalPages())}%` 
          })
      }
      .width('50%')
      .height(4)
    }
    .width('10%')
    .justifyContent(FlexAlign.Center)
    .padding({bottom:10})
  }

  // 单个卡片构建器
  @Builder
  SliderCardBuilder(item: SliderItem) {
    Column({ space: 2 }) {
      // 图片区域
      Image($r(item.image))
        .width(80)
        .height(110)
        .objectFit(ImageFit.Cover)
        .borderRadius(10)
      
      // 标题

      
      // 演出显示价格，电影显示购票按钮
      if (item.type === 'performance') {
        Text(item.title)
          .fontSize(14)
          .fontWeight(FontWeight.Normal)
          .maxLines(2)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
          .width('100%')
          .textAlign(TextAlign.Start)
        Text(item.price)
          .fontSize(16)
          .fontColor('#FF5722')
          .fontWeight(FontWeight.Bold)
          .width('100%')
          .textAlign(TextAlign.Start)
      } else {
        Text(item.title)
          .fontSize(14)
          .fontWeight(FontWeight.Normal)
          .maxLines(1)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
          .width('100%')
          .textAlign(TextAlign.Start)
        Button() {
          Text('购票')
            .fontSize(14)
            .fontColor(Color.White)
        }
        .width(80)
        .height(25)
        .backgroundColor('#FF9800')
        .borderRadius(12)


      }
    }
    .width(80)
    .height(150)
    .padding(8)
    .margin({ right: 5})
  }

  // 分隔线构建器 - 浅灰色圆点虚线
  @Builder
  DottedDividerBuilder() {
    Row() {
      ForEach(Array.from({ length: 40 }), (item: undefined, index: number) => {
        Row()
          .width(4)
          .height(2)
          .backgroundColor('#E0E0E0')
          .margin({ right: 4 })
      })
    }
    .width('100%')
    .height(1)
    .justifyContent(FlexAlign.Center)
    .margin({ top: 20, bottom: 20 })
  }

  // 主Slider构建器
  @Builder
  SliderBuilder(sectionTitle: string, items: SliderItem[]) {
    Column() {
      // 标题行
      Row() {
        Text(sectionTitle)
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .layoutWeight(1)
          .textAlign(TextAlign.Start)
        
        Row() {
          Text('全部')
            .fontSize(16)
            .fontColor('#666666')
          Image($r('app.media.chevron_right'))
            .width(16)
            .height(16)
            .margin({ left: 2 })
        }
        .onClick(() => {
          // 点击全部跳转逻辑
          console.log(`跳转到${sectionTitle}全部页面`)
        })
      }
      .width('100%')
      .padding({ left: 8, right: 8 })
      
      // 可左右滑动的卡片行
      Scroll() {
        Row() {
          ForEach(items, (item: SliderItem) => {
            this.SliderCardBuilder(item)
          })
        }
        .padding({ left: 8, right: 8 })
      }
      .scrollable(ScrollDirection.Horizontal)
      .scrollBar(BarState.Off)
      .width('100%')
      .height(200)
    }
    .width('100%')
  }

  build() {
    Column() {
      // 顶吸搜索框 - 使用Stack实现真正的顶吸效果
      Stack({ alignContent: Alignment.TopStart }) {
        // 主要内容区域（可滚动）
        Scroll() {
          Column({ space: 10}) {
            // 顶部占位空间，高度与搜索框相同，确保内容从搜索框下方开始
            Row()
              .width('100%')
              .height(60)
              .backgroundColor(Color.Transparent)

            //功能快捷入口网络
            Swiper() {
              ForEach(Array.from({ length: this.getTotalPages() }), (item: undefined, pageIndex: number) => {
                Column() {
                  Grid() {
                    ForEach(this.menuItems.slice(pageIndex * this.munePageSize, (pageIndex + 1) * this.munePageSize), (item: MenuItem) => {
                      GridItem() {
                        this.MenulconBuilder(item)
                      }
                      .onClick(() => {
                        console.log(`跳转到：${item.name}`)
                        router.pushUrl({ url: 'pages/' + item.route })
                          .then(() => {
                            console.info(`跳转到${item.name}页面成功`);
                          })
                          .catch((err: BusinessError) => {
                            console.error(`跳转失败: ${err.code}, ${err.message}`);
                          });
                      })
                    }, (item: MenuItem) => item.id.toString())
                  }
                  .columnsTemplate('1fr 1fr 1fr 1fr 1fr')
                  .columnsGap(10)
                  .rowsGap(26)
                  .width('100%')
                  .height(160)
                }
              })
            }
            .index(this.currentMunePage - 1)
            .autoPlay(false)
            .indicator(false) // 禁用默认指示器
            .loop(false)
            .onChange((index: number) => {
              this.currentMunePage = index + 1;
              this.swipeProgress = 0; // 滑动完成时重置进度
            })
            .onAnimationStart((index: number, progress: number) => {
              // 使用动画进度，更平滑
              this.swipeProgress = Math.abs(progress);
            })
            .onAnimationEnd(() => {
              this.swipeProgress = 0; // 动画结束时重置
            })
            .width('100%')
            .height(125)  // 减小高度
            .padding({ left: 12, right: 12 })

            // 同步滚动指示器 - 减小间距
            Column() {
              this.IndicatorBuilder()
            }
            .margin({ top: 0, bottom: 0 })

            //抢票播报站+今日秒杀
            Row(){
              ForEach(this.CardsItems,(item:Items) => {
                this.CardsBulider(item)
              })
            }
            .width('100%')
            
            // 必看演出和热映电影组件
            Column() {
              // 必看演出部分
              this.SliderBuilder('必看演出', this.sliderItems.filter(item => item.type === 'performance'))
              
              // 分隔线
              this.DottedDividerBuilder()
              
              // 热映电影部分
              this.SliderBuilder('热映电影', this.sliderItems.filter(item => item.type === 'movie'))
            }
            .width('100%')
            .backgroundColor(Color.White)
            .borderRadius(12)

            .margin({ left: 12, right: 12 , top:12})
            .shadow({
              radius: 8,
              color: 'rgba(0, 0, 0, 0.08)',
              offsetX: 0,
              offsetY: 2
            })
            // 底部占位空间，高度与底部导航栏相同，避免内容被遮挡
            Row()
              .width('100%')
              .height(100)
              .backgroundColor(Color.Transparent)

          }
        }
        .width('100%')
        .height('100%')

        // 顶吸搜索框 - 固定在顶部，滑动时会遮挡内容
        Row(){
          Image($r('app.media.AI'))
            .width(36)
            .height(36)
            .margin({ top:10 , left: 5, right: 5 })
            .onClick(() => {
              // 跳转AI查询界面逻辑（暂留空）
            })
          Row() {
            // 城市选择区域
            Row(){
              Text(this.cityName)
                .fontSize(14)
                .fontColor(Color.Black)
                .margin({ left: 8 , right: 3 })
              Image($r('app.media.arrowtriangle_down_fill'))
                .width(8)
                .height(8)
            }

            Text('|')
              .fontSize(14)
              .fontColor('#CCCCCC') // 浅灰色
              .margin({ left: 4, right: 4 })

            // 搜索输入区域
            TextInput({ placeholder: '输入关键词', text: this.searchText })
              .placeholderColor('#999999')
              .fontSize(14)
              .fontColor(Color.Black)
              .backgroundColor(Color.Transparent) // 透明背景
              .layoutWeight(1)
              .padding({ top: 2, bottom: 2 })
              .onChange((value: string) => {
                this.searchText = value
              })
            // 扫码按钮
            Image($r('app.media.ic_scan'))
              .width(20)
              .height(20)
              .margin({ right: 10 })
              .onClick(() => {
                // 扫码功能实现
              })

            Button('搜索', { type: ButtonType.Capsule })
              .backgroundColor('#FF9800') // 橙色
              .fontColor(Color.White)
              .margin({ right: 4 }) // 与边框间距
              .onClick(() => {
                // 搜索功能实现
              })
          }
          // 边框样式设置
          .border({
            width: 2,
            color: Color.Black,
            radius: 15 // 圆角值
          })
          .backgroundColor(Color.White) // 白色背景
          .padding({ top: 4, bottom: 4 }) // 垂直内边距
          .margin({ top: 10 }) // 顶部间距
          .layoutWeight(1)
        }
        .width('93%')
        .height(50)
        .position({ x: '3.5%', y: 0 }) // 顶吸定位
        .zIndex(10) // 确保在最上层
        .backgroundColor(Color.White) // 添加白色背景，滑动时能遮挡内容
      }
      .width('100%')
      .layoutWeight(1) // 占据剩余空间

      // 底部固定导航栏
      BottomNavBar({ currentPage: '首页' })

    }
    .width('100%')
    .height('100%')
  }
}