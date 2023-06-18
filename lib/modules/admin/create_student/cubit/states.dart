abstract class CreateStudentStates {}

class CreateStudentInitialState extends CreateStudentStates {}

class ChangeState extends CreateStudentStates {}

class CreateStudentState extends CreateStudentStates {}

class CreateStudentSuccessState extends CreateStudentStates {}

class CreateStudentErrorState extends CreateStudentStates {}
class DepartmentLoadingState extends CreateStudentStates {}
class DepartmentSuccessState extends CreateStudentStates {}
class DepartmentErrorState extends CreateStudentStates {}
class ChangeDepartmentState extends CreateStudentStates {}
