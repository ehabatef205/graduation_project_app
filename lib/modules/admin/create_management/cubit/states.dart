abstract class CreateManagementStates {}

class CreateManagementInitialState extends CreateManagementStates {}

class ChangeState extends CreateManagementStates {}

class CreateManagementState extends CreateManagementStates {}

class CreateManagementSuccessState extends CreateManagementStates {}

class CreateManagementErrorState extends CreateManagementStates {}

class DepartmentLoadingState extends CreateManagementStates {}

class DepartmentSuccessState extends CreateManagementStates {}

class DepartmentErrorState extends CreateManagementStates {}

class ChangeDepartmentState extends CreateManagementStates {}
