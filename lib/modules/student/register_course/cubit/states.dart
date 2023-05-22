abstract class RegisterCourseStates {}

class RegisterCourseInitialState extends RegisterCourseStates {}

class ChangeCourseState extends RegisterCourseStates {}

class CourseLoadingState extends RegisterCourseStates {}

class CourseSuccessState extends RegisterCourseStates {}

class CourseErrorState extends RegisterCourseStates {}

class ViewCourseState extends RegisterCourseStates {}
