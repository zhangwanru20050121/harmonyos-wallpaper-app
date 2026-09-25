// ets/pages/HomePage


import { MockData, BannerItem, DailyItem, TopicItem } from '../common/DataModel';
import router from '@ohos.router';

@Entry
@Component
export struct HomePage {
  @State currentBannerIndex: number = 0;
  @State bannerTimer: number = 0;

  aboutToAppear() {
    this.startAutoPlay();
  }

  aboutToDisappear() {
    this.stopAutoPlay();
  }

  private startAutoPlay() {
    this.bannerTimer = setInterval(() => {
      this.currentBannerIndex =
        (this.currentBannerIndex + 1) % MockData.BANNER_DATA.length;
    }, 3000) as number;
  }

  private stopAutoPlay() {
    if (this.bannerTimer) {
      clearInterval(this.bannerTimer);
      this.bannerTimer = 0;
    }
  }

  private onBannerChange(index: number) {
    this.currentBannerIndex = index;
  }

  private onTopicClick(topic: TopicItem) {
    router.pushUrl({
      url: 'pages/DetailPage',
      params: {
        imageIndex: topic.id,
        title: topic.tag,
        type: 'topic'
      }
    });
  }

  build() {
    Column() {
      Column() {
        Text('壁纸精选')
          .fontSize(24)
          .fontWeight(FontWeight.Bold)
          .fontColor('#333333')
          .margin({ top: 16, bottom: 16 })
      }
      .width('100%')
      .backgroundColor('#FFFFFF')
      .padding({ left: 20, right: 20 })

      // 使用 Flex 布局，让 Scroll 占据剩余空间
      Scroll() {
        Column() {
          // 轮播图模块
          Column() {
            Swiper() {
              ForEach(MockData.BANNER_DATA, (item: BannerItem) => {
                Image(item.image)
                  .width('100%')
                  .height(200)
                  .objectFit(ImageFit.Cover)
                  .borderRadius(8)
              })
            }
            .indicator(true)
            .autoPlay(true)
            .interval(3000)
            .loop(true)
            .onChange((index: number) => {
              this.onBannerChange(index);
            })
            .height(200)
          }
          .padding({ left: 20, right: 20 })
          .margin({ bottom: 16 })

          // 公告栏模块
          Column() {
            Row() {
              Image($r('app.media.icon_announcement'))
                .width(20)
                .height(20)
                .margin({ right: 8 })

              Text('最新公告：新增 100 + 高清壁纸，快来收藏下载～')
                .fontSize(14)
                .fontColor('#666666')
                .maxLines(1)
                .textOverflow({ overflow: TextOverflow.Ellipsis })
            }
            .padding({ left: 16, right: 16 })
            .height(40)
            .borderRadius(20)
            .backgroundColor('#F5F5F7')
            .width('100%')
            .justifyContent(FlexAlign.Start)
          }
          .padding({ left: 20, right: 20 })
          .margin({ bottom: 24 })

          // 每日精选模块
          Column() {
            // 模块标题
            Row() {
              Text('每日精选')
                .fontSize(18)
                .fontWeight(FontWeight.Bold)
                .fontColor('#333333')

              Text('Daily Picks')
                .fontSize(12)
                .fontColor('#999999')
                .margin({ left: 8 })

              Blank()

              Image($r('app.media.icon_more'))
                .width(20)
                .height(20)
            }
            .width('100%')
            .margin({ bottom: 12 })

            // 横向滚动列表
            Scroll() {
              Row() {
                ForEach(MockData.DAILY_DATA, (item: DailyItem) => {
                  Column() {
                    Image(item.image)
                      .width(120)
                      .height(180)
                      .objectFit(ImageFit.Cover)
                      .borderRadius(8)
                  }
                  .margin({ right: 12 })
                })
              }
              .padding({ right: 20 })
            }
            .scrollable(ScrollDirection.Horizontal)
            .height(180)
          }
          .padding({ left: 20 })
          .margin({ bottom: 32 })

          // 专题精选模块 - 使用 Grid 布局
          Column() {
            // 模块标题
            Row() {
              Text('专题精选')
                .fontSize(18)
                .fontWeight(FontWeight.Bold)
                .fontColor('#333333')

              Text('Topics')
                .fontSize(12)
                .fontColor('#999999')
                .margin({ left: 8 })

              Blank()

              Image($r('app.media.icon_more'))
                .width(20)
                .height(20)
            }
            .width('100%')
            .margin({ bottom: 12 })

            // 使用 Grid 布局，每行 3 列
            Grid() {
              ForEach(MockData.TOPIC_DATA, (item: TopicItem) => {
                GridItem() {
                  Column() {
                    Stack({ alignContent: Alignment.TopEnd }) {
                      Image(item.image)
                        .width('100%')
                        .height(180)
                        .objectFit(ImageFit.Cover)
                        .borderRadius(8)
                        .backgroundColor('#F0F0F0')

                      Column() {
                        Text(item.tag)
                          .fontSize(10)
                          .fontColor('#FFFFFF')
                          .padding({ left: 6, right: 6, top: 2, bottom: 2 })
                      }
                      .backgroundColor('rgba(0,0,0,0.6)')
                      .borderRadius(4)
                      .margin({ top: 8, right: 8 })
                    }
                    .height(150)
                  }
                  .height(180)
                  .margin({ bottom: 12 })
                  .onClick(() => {
                    this.onTopicClick(item);
                  })
                }
              })
            }
            // 关键修复：确保每列宽度正确，行间距明确
            .columnsTemplate('1fr 1fr 1fr')
            .columnsGap(12)
            .rowsGap(12)
            .width('100%')
            .margin({ bottom: 32 })
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