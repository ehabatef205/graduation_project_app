abstract class CreateAssignmentStates{}

class CreateAssignmentInitialState extends CreateAssignmentStates {}

class ChangeState extends CreateAssignmentStates {}

class CreateAssignmentState extends CreateAssignmentStates {}

class CreateAssignmentSuccessState extends CreateAssignmentStates {}

class CreateAssignmentErrorState extends CreateAssignmentStates {}

class ChangeAssignmentAllStudentsState extends CreateAssignmentStates {}

class ChangeAssignmentState extends CreateAssignmentStates {}