abstract class UpdateStudentProfileStates {}

class UpdateStudentProfileInitialState extends UpdateStudentProfileStates {}

class ChangeImageState extends UpdateStudentProfileStates {}

class UpdateLoadingState extends UpdateStudentProfileStates {}

class UpdateErrorState extends UpdateStudentProfileStates {}

class UpdateSuccessState extends UpdateStudentProfileStates {}

class DeleteStudentLoadingState extends UpdateStudentProfileStates {}

class DeleteStudentSuccessState extends UpdateStudentProfileStates {}

class DeleteStudentErrorState extends UpdateStudentProfileStates {}
