abstract class UpdateDepartmentStates {}

class UpdateDepartmentInitialState extends UpdateDepartmentStates {}

class ChangeState extends UpdateDepartmentStates {}

class ChangeImageState extends UpdateDepartmentStates {}

class UpdateDepartmentState extends UpdateDepartmentStates {}

class UpdateDepartmentSuccessState extends UpdateDepartmentStates {}

class UpdateDepartmentErrorState extends UpdateDepartmentStates {}

class DeleteDepartmentLoadingState extends UpdateDepartmentStates {}

class DeleteDepartmentSuccessState extends UpdateDepartmentStates {}

class DeleteDepartmentErrorState extends UpdateDepartmentStates {}
