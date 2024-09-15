class CreateUserRequest {
  final String fullname;
  final String email;
  final String password;

  const CreateUserRequest({
    required this.fullname,
    required this.email,
    required this.password,
  });
}
