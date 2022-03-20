
class Filter{
  final int id;
  final String name;

  Filter({
    required this.id,
    required this.name,
  });
}

final List<Filter> categories = [
  Filter(id:1, name:"All"),
  Filter(id:2, name:"Idea"),
  Filter(id:3, name:"Value"),
  Filter(id:4, name:"Awareness"),
  Filter(id:5, name:"Education"),
];