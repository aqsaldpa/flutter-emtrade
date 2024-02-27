class CardModels {
  String? message;
  int? pageSize;
  int? currentPage;
  int? totalPage;
  int? nextPage;
  int? totalRecord;
  List<CardData>? data;

  CardModels(
      {this.message,
      this.pageSize,
      this.currentPage,
      this.totalPage,
      this.nextPage,
      this.totalRecord,
      this.data});

  CardModels.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    pageSize = json['page_size'];
    currentPage = json['current_page'];
    totalPage = json['total_page'];
    nextPage = json['next_page'];
    totalRecord = json['total_record'];
    if (json['data'] != null) {
      data = <CardData>[];
      json['data'].forEach((v) {
        data!.add(CardData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['page_size'] = pageSize;
    data['current_page'] = currentPage;
    data['total_page'] = totalPage;
    data['next_page'] = nextPage;
    data['total_record'] = totalRecord;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CardData {
  int? id;
  bool? isPremiumContent;
  String? contentFormat;
  String? name;
  String? slug;
  String? shortContent;
  String? publishedAt;
  String? publishedAtDetail;
  String? image;
  String? thumbnail;
  String? seoTitle;
  String? seoDescription;
  String? seoKeyword;
  String? seoSlug;
  String? seoImageUrl;
  String? category;
  String? categoryIcon;
  String? videoDuration;

  CardData(
      {this.id,
      this.isPremiumContent,
      this.contentFormat,
      this.name,
      this.slug,
      this.shortContent,
      this.publishedAt,
      this.publishedAtDetail,
      this.image,
      this.thumbnail,
      this.seoTitle,
      this.seoDescription,
      this.seoKeyword,
      this.seoSlug,
      this.seoImageUrl,
      this.category,
      this.categoryIcon,
      this.videoDuration});

  CardData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    isPremiumContent = json['is_premium_content'];
    contentFormat = json['content_format'];
    name = json['name'];
    slug = json['slug'];
    shortContent = json['short_content'];
    publishedAt = json['published_at'];
    publishedAtDetail = json['published_at_detail'];
    image = json['image'];
    thumbnail = json['thumbnail'];
    seoTitle = json['seo_title'];
    seoDescription = json['seo_description'];
    seoKeyword = json['seo_keyword'];
    seoSlug = json['seo_slug'];
    seoImageUrl = json['seo_image_url'];
    category = json['category'];
    categoryIcon = json['category_icon'];
    videoDuration = json['video_duration'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['is_premium_content'] = isPremiumContent;
    data['content_format'] = contentFormat;
    data['name'] = name;
    data['slug'] = slug;
    data['short_content'] = shortContent;
    data['published_at'] = publishedAt;
    data['published_at_detail'] = publishedAtDetail;
    data['image'] = image;
    data['thumbnail'] = thumbnail;
    data['seo_title'] = seoTitle;
    data['seo_description'] = seoDescription;
    data['seo_keyword'] = seoKeyword;
    data['seo_slug'] = seoSlug;
    data['seo_image_url'] = seoImageUrl;
    data['category'] = category;
    data['category_icon'] = categoryIcon;
    data['video_duration'] = videoDuration;
    return data;
  }
}
