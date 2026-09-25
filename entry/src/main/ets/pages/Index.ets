// ets/pages/Index

import router from '@ohos.router';
import { HomePage } from './HomePage';
import { CategoryPage } from './CategoryPage';
import { ProfilePage } from './ProfilePage';

interface TabItem {
  title: string;
  icon: Resource;
  activeIcon?: Resource;
}

@Entry
@Component
struct Index {
  @State currentTabIndex: number = 0;

  private tabs: TabItem[] = [
    {
      title: '首页',
      icon: $r('app.media.icon_home'),
    },
    {
      title: '分类',
      icon: $r('app.media.icon_category'),
    },
    {
      title: '我的',
      icon: $r('app.media.icon_profile'),
    }
  ];

  private onTabChange(index: number) {
    this.currentTabIndex = index;
  }

  build() {
    // 使用 Stack 布局
    Stack() {
      // 主要内容区域 - 充满整个屏幕
      Column() {
        if (this.currentTabIndex === 0) {
          HomePage()
        } else if (this.currentTabIndex === 1) {
          CategoryPage()
        } else {
          ProfilePage()
        }
      }
      .width('100%')
      .height('100%')

      // 底部导航栏 - 固定在底部
      Column() {
        // 导航栏内容
        Row() {
          ForEach(this.tabs, (item: TabItem, index: number) => {
            Column() {
              // 使用动态图标，根据当前选中状态切换
              Image(this.currentTabIndex === index && item.activeIcon ? item.activeIcon : item.icon)
                .width(24)
                .height(24)

              Text(item.title)
                .fontSize(12)
                .fontColor(this.currentTabIndex === index ? '#007DFF' : '#666666')
                .margin({ top: 4 })
            }
            .flexGrow(1)
            .justifyContent(FlexAlign.Center)
            .height(56)
            .onClick(() => {
              this.onTabChange(index);
            })
          })
        }
        .width('100%')
        .height(56)
        .backgroundColor('#FFFFFF')
        .borderRadius({ topLeft: 16, topRight: 16 })
        .shadow({ radius: 10, color: '#E8E8E8', offsetX: 0, offsetY: -2 })
      }
      .width('100%')
      .height(56)
      .alignItems(HorizontalAlign.Center)
      .position({ y: '95.5%' })
      .margin({ top: 6 })
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#FAFAFA')
  }
}