// ets/pages/login

import router from '@ohos.router';

// 用户信息接口
interface UserInfo {
  username: string;
  password: string;
}

@Entry
@Component
struct LoginPage {
  @State username: string = '';
  @State password: string = '';
  @State isLoading: boolean = false;
  @State errorMessage: string = '';
  @State successMessage: string = '';

  // 从AppStorage获取用户列表
  @StorageLink('userList') userList: UserInfo[] = [];

  build() {
    Stack() {
      Column() {
        // 标题
        Text('用户登录')
          .fontSize(30)
          .fontWeight(FontWeight.Bold)
          .margin({ top: 80, bottom: 60 })

        // 用户名输入框
        TextInput({ placeholder: '请输入用户名', text: this.username })
          .width('90%')
          .height(50)
          .backgroundColor(Color.White)
          .borderRadius(10)
          .padding(10)
          .margin({ bottom: 20 })
          .onChange((value: string) => {
            this.username = value;
          })

        // 密码输入框
        TextInput({ placeholder: '请输入密码', text: this.password })
          .width('90%')
          .height(50)
          .backgroundColor(Color.White)
          .borderRadius(10)
          .padding(10)
          .margin({ bottom: 30 })
          .type(InputType.Password)
          .onChange((value: string) => {
            this.password = value;
          })

        // 登录按钮
        Button('登录', { type: ButtonType.Capsule, stateEffect: true })
          .width('90%')
          .height(50)
          .backgroundColor('#007DFF')
          .fontColor(Color.White)
          .fontSize(18)
          .margin({ bottom: 20 })
          .enabled(!this.isLoading)
          .onClick(() => {
            this.handleLogin();
          })

        // 注册链接
        Row() {
          Text('还没有账号？')
            .fontSize(14)
            .fontColor('#666666')

          Text('立即注册')
            .fontSize(14)
            .fontColor('#007DFF')
            .decoration({ type: TextDecorationType.Underline })
            .onClick(() => {
              router.pushUrl({
                url: 'pages/register'
              });
            })
        }
        .justifyContent(FlexAlign.Center)
        .margin({ top: 20 })

        // 加载指示器
        if (this.isLoading) {
          LoadingProgress()
            .width(30)
            .height(30)
            .margin({ top: 20 })
        }

      }
      .width('100%')
      .height('100%')
      .backgroundColor('#F5F5F5')
      .alignItems(HorizontalAlign.Center)

      // 错误提示
      if (this.errorMessage) {
        Column() {
          Text(this.errorMessage)
            .fontSize(16)
            .fontColor(Color.White)
            .padding(16)
        }
        .backgroundColor('#F44336')
        .borderRadius(8)
        .position({ x: '10%', y: '80%' })
        .width('80%')
        .alignItems(HorizontalAlign.Center)
      }

      // 成功提示
      if (this.successMessage) {
        Column() {
          Text(this.successMessage)
            .fontSize(16)
            .fontColor(Color.White)
            .padding(16)
        }
        .backgroundColor('#4CAF50')
        .borderRadius(8)
        .position({ x: '10%', y: '80%' })
        .width('80%')
        .alignItems(HorizontalAlign.Center)
      }
    }
    .width('100%')
    .height('100%')
  }

  // 处理登录逻辑
  private handleLogin() {
    if (!this.username.trim()) {
      this.showError('请输入用户名');
      return;
    }

    if (!this.password.trim()) {
      this.showError('请输入密码');
      return;
    }

    this.isLoading = true;
    this.clearMessages();

    // 模拟网络请求延迟
    setTimeout(() => {
      this.isLoading = false;

      // 验证账号密码 - 现在检查整个用户列表
      const user = this.userList.find(user =>
      user.username === this.username && user.password === this.password
      );

      if (user) {
        this.showSuccess('登录成功');

        // 存储当前登录用户
        AppStorage.setOrCreate('currentUser', this.username);

        // 登录成功，跳转到首页
        setTimeout(() => {
          router.replaceUrl({
            url: 'pages/Index'
          });
        }, 800);
      } else {
        this.showError('用户名或密码错误');
      }
    }, 1000);
  }

  // 显示错误消息
  private showError(message: string) {
    this.errorMessage = message;
    setTimeout(() => {
      this.errorMessage = '';
    }, 2000);
  }

  // 显示成功消息
  private showSuccess(message: string) {
    this.successMessage = message;
    setTimeout(() => {
      this.successMessage = '';
    }, 2000);
  }

  // 清除所有消息
  private clearMessages() {
    this.errorMessage = '';
    this.successMessage = '';
  }

  aboutToAppear() {
    // 初始化用户列表 - 使用显式类型声明
    if (this.userList.length === 0) {
      const defaultUser: UserInfo = {
        username: 'admin',
        password: '1'
      };
      this.userList = [defaultUser];
    }
  }
}