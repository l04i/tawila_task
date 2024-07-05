class Item {
  final int? id;
  final List<Option>? options;
  final Menu? category;
  final String? name;
  final String? description;
  final int? price;
  final dynamic image;
  final String? photoUrl;
  final dynamic calories;
  final int? spicyLevel;
  final int? order;
  final bool? isAvailable;
  final bool? isPopular;
  final int? menu;
  final List<dynamic>? diataries;

  Item({
    this.id,
    this.options,
    this.category,
    this.name,
    this.description,
    this.price,
    this.image,
    this.photoUrl,
    this.calories,
    this.spicyLevel,
    this.order,
    this.isAvailable,
    this.isPopular,
    this.menu,
    this.diataries,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json['id'] as int?,
        options: (json['options'] as List<dynamic>?)
            ?.map((e) => Option.fromJson(e as Map<String, dynamic>))
            .toList(),
        category: json['category'] == null
            ? null
            : Menu.fromJson(json['category'] as Map<String, dynamic>),
        name: json['name'] as String?,
        description: json['description'] as String?,
        price: json['price'] as int?,
        image: json['image'],
        photoUrl: json['photo_url'] as String?,
        calories: json['calories'],
        spicyLevel: json['spicy_level'] as int?,
        order: json['order'] as int?,
        isAvailable: json['is_available'] as bool?,
        isPopular: json['is_popular'] as bool?,
        menu: json['menu'] as int?,
        diataries: (json['diataries'] as List<dynamic>?)
            ?.map((e) => e as dynamic)
            .toList(),
      );
}

class Option {
  final int? id;
  final String? name;
  final String? displayName;
  final int? price;
  final String? description;
  final bool? required;
  final String? type;
  final int? selectionLimit;
  final int? order;
  final bool? isActive;

  Option({
    this.id,
    this.name,
    this.displayName,
    this.price,
    this.description,
    this.required,
    this.type,
    this.selectionLimit,
    this.order,
    this.isActive,
  });

  factory Option.fromJson(Map<String, dynamic> json) => Option(
        id: json['id'] as int?,
        name: json['name'] as String?,
        displayName: json['display_name'] as String?,
        price: json['price'] as int?,
        description: json['description'] as String?,
        required: json['required'] as bool?,
        type: json['type'] as String?,
        selectionLimit: json['selection_limit'] as int?,
        order: json['order'] as int?,
        isActive: json['is_active'] as bool?,
      );
}

class Menu {
  final int? id;
  final List<Item>? items;
  final String? name;
  final String? description;
  final int? order;

  Menu({
    this.id,
    this.items,
    this.name,
    this.description,
    this.order,
  });

  factory Menu.fromJson(Map<String, dynamic> json) => Menu(
        id: json['id'] as int?,
        items: (json['items'] as List<dynamic>?)
            ?.map((e) => Item.fromJson(e as Map<String, dynamic>))
            .toList(),
        name: json['name'] as String?,
        description: json['description'] as String?,
        order: json['order'] as int?,
      );
}
