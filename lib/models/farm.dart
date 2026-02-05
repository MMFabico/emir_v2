final String tableFarms = 'myFarms';

class MyFarmFields {
  static final List<String> values = [
    /// Add all fields
    id, isImportant, number, name, description, time, cropType
  ];

  static final String id = '_id';
  static final String isImportant = 'isImportant';
  static final String number = 'number';
  static final String name = 'name';
  static final String description = 'description';
  static final String time = 'time';
  static final String cropType = 'cropType';
}

class Farm {
  final int? id;
  final bool status;
  final int number;
  final String name;
  final String description;
  final DateTime createdTime;
  final String cropType;


  const Farm({
    this.id,
    required this.status,
    required this.number,
    required this.name,
    required this.description,
    required this.createdTime,
    required this.cropType,
  });

  Farm copy({
    int? id,
    bool? isImportant,
    int? number,
    String? name,
    String? description,
    DateTime? createdTime,
    String? cropType,
  }) =>
      Farm(
        id: id ?? this.id,
        status: isImportant ?? status,
        number: number ?? this.number,
        name: name ?? this.name,
        description: description ?? this.description,
        createdTime: createdTime ?? this.createdTime,
        cropType: cropType ?? this.cropType,
      );

  // JSON to Farm Object
  static Farm fromJson(Map<String, Object?> json) => Farm(
    id: json[MyFarmFields.id] as int?,
    status: json[MyFarmFields.isImportant] == 1,
    number: json[MyFarmFields.number] as int,
    name: json[MyFarmFields.name] as String,
    description: json[MyFarmFields.description] as String,
    createdTime: DateTime.parse(json[MyFarmFields.time] as String),
    cropType: json[MyFarmFields.cropType] as String,
  );

  // Farm Object to JSON
  Map<String, Object?> toJson() => {
    MyFarmFields.id: id,
    MyFarmFields.name: name,
    MyFarmFields.isImportant: status ? 1 : 0,
    MyFarmFields.number: number,
    MyFarmFields.description: description,
    MyFarmFields.time: createdTime.toIso8601String(),
    MyFarmFields.cropType: cropType,
  };
}
