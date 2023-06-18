abstract class CreateGroupStates {}

class CreateGroupInitialState extends CreateGroupStates {}

class ChangeState extends CreateGroupStates {}

class ChangeDayLectureState extends CreateGroupStates {}

class ChangeTimeLectureState extends CreateGroupStates {}

class ChangeDaySectionState extends CreateGroupStates {}

class ChangeTimeSectionState extends CreateGroupStates {}

class ChangeDoctorLectureState extends CreateGroupStates {}

class ChangeDoctorSectionState extends CreateGroupStates {}

class CreateGroupState extends CreateGroupStates {}

class CreateGroupSuccessState extends CreateGroupStates {}

class CreateGroupErrorState extends CreateGroupStates {}

class DoctorsLoadingState extends CreateGroupStates {}

class DoctorsSuccessState extends CreateGroupStates {}

class DoctorsErrorState extends CreateGroupStates {}
