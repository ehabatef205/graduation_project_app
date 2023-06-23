abstract class UpdateCourseStates {}

class UpdateCourseInitialState extends UpdateCourseStates {}

class ChangeState extends UpdateCourseStates {}

class ChangeImageState extends UpdateCourseStates {}

class ChangeLevelState extends UpdateCourseStates {}

class UpdateCourseState extends UpdateCourseStates {}

class UpdateCourseSuccessState extends UpdateCourseStates {}

class UpdateCourseErrorState extends UpdateCourseStates {}

class DeleteCourseLoadingState extends UpdateCourseStates {}

class DeleteCourseSuccessState extends UpdateCourseStates {}

class DeleteCourseErrorState extends UpdateCourseStates {}
