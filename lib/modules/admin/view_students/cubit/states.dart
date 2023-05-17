abstract class ViewStudentsStates {}

class ViewStudentsInitialState extends ViewStudentsStates {}

class ChangeState extends ViewStudentsStates {}

class StudentsLoadingState extends ViewStudentsStates {}

class StudentsSuccessState extends ViewStudentsStates {}

class StudentsErrorState extends ViewStudentsStates {}

class ChangeStudentIdState extends ViewStudentsStates {}
