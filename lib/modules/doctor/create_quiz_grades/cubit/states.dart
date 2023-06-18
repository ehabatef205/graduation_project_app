abstract class CreateQuizGradesStates {}

class CreateQuizGradesInitialState extends CreateQuizGradesStates {}

class ChangeState extends CreateQuizGradesStates {}

class CreateQuizState extends CreateQuizGradesStates {}

class CreateQuizSuccessState extends CreateQuizGradesStates {}

class CreateQuizErrorState extends CreateQuizGradesStates {}

class ChangeQuizAllStudentsState extends CreateQuizGradesStates {}

class ChangeQuizState extends CreateQuizGradesStates {}
