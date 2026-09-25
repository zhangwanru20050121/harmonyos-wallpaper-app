// ets/pages/CategoryPage


import { MockData, CategoryItem } from '../common/DataModel';
import router from '@ohos.router';

@Entry
@Component
export struct CategoryPage {
  private onCategoryClick(category: CategoryItem) {
    router.pushUrl({
      url: 'pages/DetailPage',
      params: {
        imageIndex: category.id,
        title: category.name,
        type: 'category'
      }
    });
  }

  build() {
    Column() {
      Column() {
        Text('分类浏览')
          .fontSize(24)
          .fontWeight(FontWeight.Bold)
          .fontColor('#333333')
          .margin({ top: 16, bottom: 16 })
      }
      .width('100%')
      .backgroundColor('#FFFFFF')
      .padding({ left: 20, right: 20 })

      // 使用 Scroll 组件
      Scroll() {
        Column() {
          // 分类说明
          Column() {
            Text('选择您喜欢的壁纸分类')
              .fontSize(14)
              .fontColor('#666666')
              .margin({ bottom: 4 })

            Text('Select your favorite wallpaper category')
              .fontSize(12)
              .fontColor('#999999')
          }
          .width('100%')
          .padding({ left: 20, right: 20, top: 20, bottom: 20 })
          .backgroundColor('#FFFFFF')
          .borderRadius(8)
          .margin({ bottom: 24 })

          // 分类网格布局 - 使用 Flex 包装 Grid
          Column() {
            // 使用 Grid 布局，每行 2 列
            Grid() {
              ForEach(MockData.CATEGORY_DATA, (item: CategoryItem) => {
                GridItem() {
                  Column() {
                    Stack() {
                      Image(item.image)
                        .width('100%')
                        .height(150)
                        .objectFit(ImageFit.Cover)
                        .borderRadius(12)
                        .backgroundColor('#F0F0F0')

                      Column() {
                        Text(item.name)
                          .fontSize(16)
                          .fontWeight(FontWeight.Bold)
                          .fontColor('#FFFFFF')
                      }
                      .width('100%')
                      .height('100%')
                      .justifyContent(FlexAlign.Center)
                      .backgroundColor('rgba(0,0,0,0.3)')
                      .borderRadius(12)
                    }
                    .height(150)
                  }
                  .height(150)
                  .margin({ bottom: 16 })
                  .onClick(() => {
                    this.onCategoryClick(item);
                  })
                }
              })
            }
            // 关键修复：确保每列宽度正确
            .columnsTemplate('1fr 1fr')
            .columnsGap(16)
            .rowsGap(16)
            .width('100%')
          }
          .padding({ left: 20, right: 20 })
        }
      }
      .scrollBar(BarState.Off)
      .backgroundColor('#FAFAFA')
      .flexGrow(1)
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#FAFAFA')
  }
}