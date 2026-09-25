// ets/common/ProfileData


// 个人主页数据模型
// 导出所有接口类型
export type { UserInfo, FunctionEntry, ContentTab, TopicInfo };
// 用户信息接口
interface UserInfo {
  nickname: string;
  account: string;
  isPrivate: boolean;
  followCount: number;
  fansCount: number;
  mutualCount: number;
  likeCount: number;
}

// 功能入口接口
interface FunctionEntry {
  id: number;
  name: string;
  icon: Resource;
}

// 内容标签接口
interface ContentTab {
  id: number;
  name: string;
  isActive: boolean;
}

// 话题信息接口
interface TopicInfo {
  title: string;
  participants: string;
  image: Resource;
}

// 个人主页数据类
export class ProfileData {
  // 用户信息
  static readonly USER_INFO: UserInfo = {
    nickname: 'cc',
    account: '账号：123456',
    isPrivate: true,
    followCount: 20,
    fansCount: 50,
    mutualCount: 500,
    likeCount: 50
  };

  // 功能入口数据 - 使用明确类型
  static readonly FUNCTION_ENTRIES: FunctionEntry[] = [
    { id: 1, name: '商城', icon: $r('app.media.icon_mall') },
    { id: 2, name: '观看历史', icon: $r('app.media.icon_history') },
    { id: 3, name: '我的钱包', icon: $r('app.media.icon_wallet') },
    { id: 4, name: '常访问的人', icon: $r('app.media.icon_freguent') },
    { id: 5, name: '全部功能', icon: $r('app.media.icon_all') }
  ];

  // 内容标签 - 使用明确类型
  static readonly CONTENT_TABS: ContentTab[] = [
    { id: 1, name: '作品', isActive: true },
    { id: 2, name: '收藏', isActive: false },
    { id: 3, name: '喜欢', isActive: false }
  ];

  // 话题数据
  static readonly TOPIC_INFO: TopicInfo = {
    title: '记录旅行时光',
    participants: '666.0 万人参与',
    image: $r('app.media.cc')
  };
}