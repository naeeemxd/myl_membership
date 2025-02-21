class CommitteeMember {
  final String name;
  final String location;
  final String? imageUrl; // Image URL from the database

  CommitteeMember({
    required this.name,
    required this.location,
    this.imageUrl,
  });
}