String? searchValidation(String? value) {
  if (value!.isEmpty) {
    return "search can't be empty";
  }
  return null;
}
