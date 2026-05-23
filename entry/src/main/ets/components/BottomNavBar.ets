import router from '@ohos.router'
import { BusinessError } from '@kit.BasicServicesKit';

/**
 * 底部导航项接口
 */
interface BottomNavItem {
  id: number
  name: string
  image: string
  route: string
}

/**
 * 底部导航栏公共组件
 * 使用方式：BottomNavBar({ currentPage: '首页' })
 */
@Component
export struct BottomNavBar {
  // 当前页面名称，用于高亮当前页
  @Prop currentPage: string = ''

  // 底部导航数据
  private bottomItems: BottomNavItem[] = [
    { id: 1, name: '首页', image: 'app.media.my', route: 'MainPage' },
    { id: 2, name: '影院·场馆', image: 'app.media.discover', route: '' },
    { id: 3, name: '大麦VIP', image: 'app.media.VIP', route: '' },
    { id: 4, name: '发现', image: 'app.media.position', route: '' },
    { id: 5, name: '我的', image: 'app.media.mainpage', route: 'MinePage' }
  ]

  build() {
    Row() {
      ForEach(this.bottomItems, (item: BottomNavItem, index: number) => {
        Column({ space: 4 }) {
          Image($r(item.image))
            .width(32)
            .height(32)
            .objectFit(ImageFit.Contain)
          Text(item.name)
            .fontSize(12)
            .fontColor(this.currentPage === item.name ? '#FF9800' : '#333333') // 当前页高亮
            .textAlign(TextAlign.Center)
            .maxLines(1)
            .textOverflow({ overflow: TextOverflow.Ellipsis })
        }
        .layoutWeight(1)
        .height('100%')
        .justifyContent(FlexAlign.Center)
        .onClick(() => {
          console.log(`点击了底部导航：${item.name}, route: ${item.route}`);
          
          // 当前页面不跳转
          if (item.name === this.currentPage) {
            console.log('当前页面，不跳转');
            return;
          }
          
          // 空路径不跳转
          if (!item.route || item.route === '') {
            console.log(`${item.name} 页面暂未实现`);
            return;
          }
          
          // 正常跳转
          console.log(`准备跳转到：pages/${item.route}`);
          router.pushUrl({ url: 'pages/' + item.route })
            .then(() => {
              console.info(`跳转到${item.name}页面成功`);
            })
            .catch((err: BusinessError) => {
              console.error(`跳转失败: ${err.code}, ${err.message}`);
            });
        })
      })
    }
    .width('100%')
    .height(80)
    .margin({ left: '5%', right: '5%', bottom: 10 })
    .padding({ top: 12, bottom: 12 })
    .backgroundColor('#F5F5F5')
    .justifyContent(FlexAlign.SpaceBetween)
  }
}
