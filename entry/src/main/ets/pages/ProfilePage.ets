// ets/pages/ProfilePage

import { ProfileData } from '../common/ProfileData';
import { FunctionEntry, ContentTab } from '../common/ProfileData';

@Entry
@Component
export struct ProfilePage {
  @State activeTabIndex: number = 0;

  // 处理标签切换
  private onTabClick(index: number): void {
    this.activeTabIndex = index;
  }

  build() {
    Scroll() {
      Column() {
        // 1. 顶部区域 - 背景图和头像
        Stack({ alignContent: Alignment.TopStart }) {
          // 背景图
          Image($r('app.media.banner4'))
            .width('100%')
            .height(220)
            .objectFit(ImageFit.Cover)

          // 头像 - 覆盖在背景图与下方区域的交界处
          Stack({ alignContent: Alignment.BottomEnd }) {
            Image($r('app.media.cc'))
              .width(80)
              .height(80)
              .borderRadius(40)
              .border({ width: 4, color: '#FFFFFF' })
          }
          .width(80)
          .height(80)
          .position({ x: 20, y: 180 }) // 定位到背景图下方
        }
        .width('100%')
        .height(190)
        .margin({ bottom: 60 })

        // 2. 用户信息区域
        Column() {
          // 昵称和账号
          Row() {
            Column() {
              Text(ProfileData.USER_INFO.nickname)
                .fontSize(30)
                .fontWeight(FontWeight.Bold)
                .fontColor('#333333')
                .margin({ bottom: 4 })

              Row() {
                if (ProfileData.USER_INFO.isPrivate) {

                }

                Text(ProfileData.USER_INFO.account)
                  .fontSize(12)
                  .fontColor('#666666')
              }
            }
            .flexGrow(1)

          }
          .width('100%')
          .margin({ bottom: 10 })

          // 3. 数据统计栏
          Row() {
            // 获赞
            Column() {
              Text(ProfileData.USER_INFO.likeCount.toString())
                .fontSize(18)
                .fontWeight(FontWeight.Bold)
                .fontColor('#333333')
                .margin({ bottom: 4 })

              Text('获赞')
                .fontSize(12)
                .fontColor('#666666')
            }
            .flexGrow(1)
            .alignItems(HorizontalAlign.Center)

            // 互关
            Column() {
              Text(ProfileData.USER_INFO.mutualCount.toString())
                .fontSize(18)
                .fontWeight(FontWeight.Bold)
                .fontColor('#333333')
                .margin({ bottom: 4 })

              Text('互关')
                .fontSize(12)
                .fontColor('#666666')
            }
            .flexGrow(1)
            .alignItems(HorizontalAlign.Center)

            // 关注
            Column() {
              Text(ProfileData.USER_INFO.followCount.toString())
                .fontSize(18)
                .fontWeight(FontWeight.Bold)
                .fontColor('#333333')
                .margin({ bottom: 4 })

              Text('关注')
                .fontSize(12)
                .fontColor('#666666')
            }
            .flexGrow(1)
            .alignItems(HorizontalAlign.Center)

            // 粉丝
            Column() {
              Text(ProfileData.USER_INFO.fansCount.toString())
                .fontSize(18)
                .fontWeight(FontWeight.Bold)
                .fontColor('#333333')
                .margin({ bottom: 4 })

              Text('粉丝')
                .fontSize(12)
                .fontColor('#666666')
            }
            .flexGrow(1)
            .alignItems(HorizontalAlign.Center)
          }
          .width('100%')
          .margin({ bottom: 10 })

          // 编辑主页按钮
          Button({ type: ButtonType.Normal }) {
            Text('编辑主页')
              .fontSize(14)
              .fontColor('#333333')
          }
          .width('100%')
          .height(40)
          .backgroundColor('#F5F5F7')
          .borderRadius(20)
          .margin({ bottom: 20 })
        }
        .padding({ left: 20, right: 20 })

        // 4. 个人介绍栏
        Row() {
          Text('点击添加介绍，让大家认识你...')
            .fontSize(14)
            .fontColor('#999999')
            .flexGrow(1)

        }
        .width('100%')
        .padding({ left: 20, right: 20, top: 1, bottom: -10 })
        .backgroundColor('#F9F9F9')
        .margin({ bottom: 16 })

        // 5. 功能入口栏
        Column() {
          Row() {

            ForEach(ProfileData.FUNCTION_ENTRIES, (item: FunctionEntry) => {
              Column() {
                Image(item.icon)
                  .width(32)
                  .height(32)
                  .margin({ bottom: 8 })

                Text(item.name)
                  .fontSize(12)
                  .fontColor('#333333')
                  .maxLines(1)
                  .textOverflow({ overflow: TextOverflow.Ellipsis })
              }
              .width('20%')
              .alignItems(HorizontalAlign.Center)
            })
          }
          .width('100%')
          .padding({ top: 16, bottom: 16 })
        }
        .width('100%')
        .backgroundColor('#FFFFFF')
        .margin({ bottom: 16 })

        // 6. 内容标签栏
        Row() {

          ForEach(ProfileData.CONTENT_TABS, (item: ContentTab, index: number) => {
            Column() {
              Text(item.name)
                .fontSize(16)
                .fontWeight(item.isActive ? FontWeight.Bold : FontWeight.Normal)
                .fontColor(item.isActive ? '#333333' : '#999999')
                .margin({ bottom: 8 })


              if (item.isActive) {
                Divider()
                  .color('#FF2C55')
                  .strokeWidth(2)
                  .width(24)
              }
            }
            .flexGrow(1)
            .alignItems(HorizontalAlign.Center)
            .height(48)
            .onClick(() => {
              this.onTabClick(index);
            })
          })
        }
        .width('100%')
        .backgroundColor('#FFFFFF')
        .border({ width: { bottom: 1 }, color: '#F0F0F0' })

        // 7. 作品区域 - 话题卡片
        Column() {
          // 话题卡片
          Stack() {
            Image(ProfileData.TOPIC_INFO.image)
              .width('100%')
              .height(180)
              .objectFit(ImageFit.Cover)
              .borderRadius(8)

            // 话题信息遮罩
            Column({ space: 4 }) {
              Text(ProfileData.TOPIC_INFO.title)
                .fontSize(18)
                .fontWeight(FontWeight.Bold)
                .fontColor('#FFFFFF')

              Text(ProfileData.TOPIC_INFO.participants)
                .fontSize(12)
                .fontColor('#FFFFFF')
            }
            .width('100%')
            .padding({ left: 16, right: 16, top: 12, bottom: 12 })
            .backgroundColor('rgba(0,0,0,0.3)')
            .borderRadius({ bottomLeft: 8, bottomRight: 8 })
            .position({ x: 0, y: 140 })
          }
          .width('100%')
          .height(180)
          .margin({ bottom: 16 })

          // 参与话题按钮
          Button({ type: ButtonType.Capsule }) {
            Text('参与话题')
              .fontSize(16)
              .fontColor('#FFFFFF')
              .fontWeight(FontWeight.Bold)
          }
          .width('100%')
          .height(48)
          .backgroundColor('#FF2C55')
          .borderRadius(24)
        }
        .padding({ left: 20, right: 20, top: 20, bottom: 20 })
        .backgroundColor('#FFFFFF')
        .margin({ bottom: 20 })
      }
    }
    .scrollBar(BarState.Off)
    .backgroundColor('#FAFAFA')
  }
}