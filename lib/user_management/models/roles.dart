enum Role {
  administrator,
  trafficController,
  conductor,
}

extension RoleExtension on Role {
  static List<Role> get allRoles => Role.values.toList();

  static List<String> get rolesNamesList =>
      ['Administrator', 'Traffic Controller', 'Conductor'];

  String get roleName {
    String roleName;
    switch (this) {
      case Role.administrator:
        roleName = 'Administrator';
        break;
      case Role.trafficController:
        roleName = 'Traffic Controller';
        break;
      case Role.conductor:
        roleName = 'Conductor';
        break;
      default:
        roleName = "Administrator";
    }
    return roleName;
  }

  static Role getRoleByIndex(int index) {
    return Role.values.elementAt(index);
  }
}
