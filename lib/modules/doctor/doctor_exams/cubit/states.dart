abstract class DoctorExamsStates{}

class DoctorExamsInitialState extends DoctorExamsStates {}

class ChangeState extends DoctorExamsStates {}

class GroupsLoadingState extends DoctorExamsStates {}

class GroupsSuccessState extends DoctorExamsStates {}

class GroupsErrorState extends DoctorExamsStates {}