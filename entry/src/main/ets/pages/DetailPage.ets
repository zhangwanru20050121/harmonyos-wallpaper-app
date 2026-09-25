// ets/pages/DetailPage


import router from '@ohos.router';
import prompt from '@ohos.prompt';
import { ImageResources } from '../common/DataModel';

// 定义路由参数类型接口
interface RouteParams {
  imageIndex?: number;
  title?: string;
  type?: string;
}

@Entry
@Component
struct DetailPage {
  @State private imageResource: Resource = ImageResources.CATEGORY_WALL_1;
  @State private title: string = '壁纸详情';
  @State private isFavorite: boolean = false;

  aboutToAppear() {
    // 使用RouteParams类型明确接收参数
    const params: RouteParams = router.getParams() as RouteParams;

    if (params && params.imageIndex !== undefined) {
      // 根据索引设置图片资源
      this.setImageByIndex(params.imageIndex);
    }

    if (params && params.title) {
      this.title = params.title;
    }
  }

  // 根据索引设置图片
  private setImageByIndex(index: number): void {
    // 定义图片资源数组
    const imageResources: Resource[] = [
      ImageResources.CATEGORY_WALL_1,
      ImageResources.CATEGORY_WALL_2,
      ImageResources.CATEGORY_WALL_3,
      ImageResources.CATEGORY_WALL_4,
      ImageResources.CATEGORY_WALL_5,
      ImageResources.CATEGORY_WALL_6,
      ImageResources.CATEGORY_WALL_7,
      ImageResources.CATEGORY_WALL_8
    ];

    // 确保索引在有效范围内
    const safeIndex: number = Math.max(0, Math.min(index - 1, imageResources.length - 1));
    this.imageResource = imageResources[safeIndex];
  }

  private onFavoriteClick(): void {
    this.isFavorite = !this.isFavorite;
    prompt.showToast({
      message: this.isFavorite ? '已添加到收藏' : '已取消收藏',
      duration: 2000
    });
  }

  private onDownloadClick(): void {
    prompt.showToast({
      message: '开始下载壁纸...',
      duration: 2000
    });

    setTimeout((): void => {
      prompt.showToast({
        message: '壁纸下载完成',
        duration: 2000
      });
    }, 1500);
  }

  private onBackClick(): void {
    router.back();
  }

  build() {
    Column() {
      Row() {
        Image($r('app.media.icon_back'))
          .width(24)
          .height(24)
          .onClick(() => this.onBackClick())
          .margin({ right: 12 })

        Text(this.title)
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .fontColor('#333333')

        Blank()
      }
      .width('100%')
      .padding({ left: 20, right: 20, top: 16, bottom: 16 })
      .backgroundColor('#FFFFFF')

      Column() {
        Stack() {
          Image(this.imageResource)
            .width('100%')
            .height('100%')
            .objectFit(ImageFit.Contain)
            .backgroundColor('#000000')

          Column() {
            Row() {
              Image($r('app.media.icon_back'))
                .width(16)
                .height(16)
                .margin({ right: 8 })

              Text('高清4K壁纸')
                .fontSize(12)
                .fontColor('#FFFFFF')



              Text(this.title)
                .fontSize(12)
                .fontColor('#FFFFFF')
                .fontWeight(FontWeight.Bold)
            }
            .width('100%')
            .padding({ left: 12, right: 12, top: 8, bottom: 8 })
          }
          .backgroundColor('rgba(0,0,0,0.6)')
          .borderRadius(20)
          .position({ x: 20, y: 20 })
        }
      }
      .height('72%')
      .width('100%')
      .backgroundColor('#000000')

      Column() {
        Row() {
          Button({ type: ButtonType.Capsule }) {
            Row() {
              Image(this.isFavorite ? $r('app.media.icon_favorite') : $r('app.media.icon_favorite_fill'))
                .width(20)
                .height(20)
                .margin({ right: 8 })

              Text(this.isFavorite ? '已收藏' : '收藏')
                .fontSize(16)
                .fontColor('#FFFFFF')
            }
            .padding({ left: 32, right: 32 })
          }
          .backgroundColor(this.isFavorite ? '#FF6B6B' : '#4A90E2')
          .height(48)
          .onClick(() => this.onFavoriteClick())

          Blank()

          Button({ type: ButtonType.Capsule }) {
            Row() {
              Image($r('app.media.icon_download'))
                .width(20)
                .height(20)
                .margin({ right: 8 })

              Text('下载')
                .fontSize(16)
                .fontColor('#FFFFFF')
            }
            .padding({ left: 32, right: 32 })
          }
          .backgroundColor('#52C41A')
          .height(48)
          .onClick(() => this.onDownloadClick())
        }
        .width('100%')
        .justifyContent(FlexAlign.SpaceAround)

        Column() {
          Text('下载的壁纸将保存到相册')
            .fontSize(12)
            .fontColor('#999999')
            .margin({ top: 16 })
        }
        .width('100%')
        .alignItems(HorizontalAlign.Center)
      }
      .padding(20)
      .backgroundColor('#FFFFFF')
      .borderRadius(20)
      .shadow({ radius: 10, color: '#E8E8E8', offsetX: 0, offsetY: -2 })
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#FAFAFA')
  }
}