abstract class DoctorGradesStates{}

class DoctorGradesInitialState extends DoctorGradesStates {}

class ChangeState extends DoctorGradesStates {}

class GroupsLoadingState extends DoctorGradesStates {}

class GroupsSuccessState extends DoctorGradesStates {}

class GroupsErrorState extends DoctorGradesStates {}

class CourseLoadingState extends DoctorGradesStates {}

class CourseSuccessState extends DoctorGradesStates {}

class CourseErrorState extends DoctorGradesStates {}

class DoneState extends DoctorGradesStates {}