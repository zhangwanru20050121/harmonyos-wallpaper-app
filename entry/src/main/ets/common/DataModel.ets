// ets/common/DataModel


// 数据模型定义
export class BannerItem {
  id: number;
  image: Resource;

  constructor(id: number, image: Resource) {
    this.id = id;
    this.image = image;
  }
}

export class DailyItem {
  id: number;
  image: Resource;

  constructor(id: number, image: Resource) {
    this.id = id;
    this.image = image;
  }
}

export class TopicItem {
  id: number;
  image: Resource;
  tag: string;

  constructor(id: number, image: Resource, tag: string) {
    this.id = id;
    this.image = image;
    this.tag = tag;
  }
}

export class CategoryItem {
  id: number;
  name: string;
  image: Resource;

  constructor(id: number, name: string, image: Resource) {
    this.id = id;
    this.image = image;
    this.name = name;
  }
}

// 在DataModel.ets中添加图片资源常量
export class ImageResources {
  static readonly BANNER_1: Resource = $r('app.media.banner1');
  static readonly BANNER_2: Resource = $r('app.media.banner2');
  static readonly BANNER_3: Resource = $r('app.media.banner3');
  static readonly BANNER_4: Resource = $r('app.media.banner4');
  static readonly BANNER_5: Resource = $r('app.media.banner5');

  static readonly DAILY_1: Resource = $r('app.media.daily1');
  static readonly DAILY_2: Resource = $r('app.media.daily2');
  static readonly DAILY_3: Resource = $r('app.media.daily3');
  static readonly DAILY_4: Resource = $r('app.media.daily4');

  static readonly TOPIC_1: Resource = $r('app.media.topic1');
  static readonly TOPIC_2: Resource = $r('app.media.topic2');
  static readonly TOPIC_3: Resource = $r('app.media.topic3');
  static readonly TOPIC_4: Resource = $r('app.media.topic4');
  static readonly TOPIC_5: Resource = $r('app.media.topic5');
  static readonly TOPIC_6: Resource = $r('app.media.topic6');
  static readonly TOPIC_7: Resource = $r('app.media.topic7');
  static readonly TOPIC_8: Resource = $r('app.media.topic8');
  static readonly TOPIC_9: Resource = $r('app.media.topic9');

  static readonly CATEGORY_WALL_1: Resource = $r('app.media.categoryWall1');
  static readonly CATEGORY_WALL_2: Resource = $r('app.media.categoryWall2');
  static readonly CATEGORY_WALL_3: Resource = $r('app.media.categoryWall3');
  static readonly CATEGORY_WALL_4: Resource = $r('app.media.categoryWall4');
  static readonly CATEGORY_WALL_5: Resource = $r('app.media.categoryWall5');
  static readonly CATEGORY_WALL_6: Resource = $r('app.media.categoryWall6');
  static readonly CATEGORY_WALL_7: Resource = $r('app.media.categoryWall7');
  static readonly CATEGORY_WALL_8: Resource = $r('app.media.categoryWall8');
}

// 模拟数据常量
export class MockData {
  // 轮播图数据
  static readonly BANNER_DATA: BannerItem[] = [
    new BannerItem(1, $r('app.media.banner1')),
    new BannerItem(2, $r('app.media.banner2')),
    new BannerItem(3, $r('app.media.banner3')),
    new BannerItem(4, $r('app.media.banner4')),
    new BannerItem(5, $r('app.media.banner5'))
  ];

  // 每日精选数据
  static readonly DAILY_DATA: DailyItem[] = [
    new DailyItem(1, $r('app.media.daily1')),
    new DailyItem(2, $r('app.media.daily2')),
    new DailyItem(3, $r('app.media.daily3')),
    new DailyItem(4, $r('app.media.daily4'))
  ];

  // 专题精选数据
  static readonly TOPIC_DATA: TopicItem[] = [
    new TopicItem(1, $r('app.media.topic1'), '动漫'),
    new TopicItem(2, $r('app.media.topic2'), '风景'),
    new TopicItem(3, $r('app.media.topic3'), '城市'),
    new TopicItem(4, $r('app.media.topic4'), '星空'),
    new TopicItem(5, $r('app.media.topic5'), '动物'),
    new TopicItem(6, $r('app.media.topic6'), '抽象'),
    new TopicItem(7, $r('app.media.topic7'), '极简'),
    new TopicItem(8, $r('app.media.topic8'), '游戏'),
    new TopicItem(9, $r('app.media.topic9'), '科技')
  ];

  // 分类数据
  static readonly CATEGORY_DATA: CategoryItem[] = [
    new CategoryItem(1, '风景', $r('app.media.categoryWall1')),
    new CategoryItem(2, '人物', $r('app.media.categoryWall2')),
    new CategoryItem(3, '城市', $r('app.media.categoryWall3')),
    new CategoryItem(4, '动漫', $r('app.media.categoryWall4')),
    new CategoryItem(5, '星空', $r('app.media.categoryWall5')),
    new CategoryItem(6, '动物', $r('app.media.categoryWall6')),
    new CategoryItem(7, '抽象', $r('app.media.categoryWall7')),
    new CategoryItem(8, '极简', $r('app.media.categoryWall8'))
  ];
}