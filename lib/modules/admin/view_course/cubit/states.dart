abstract class ViewCourseStates{}

class InitialViewCoursesState extends ViewCourseStates {}

class ChangeViewCourseState extends ViewCourseStates {}
class CourseLoadingState extends ViewCourseStates {}
class CourseSuccessState extends ViewCourseStates {}
class CourseErrorState extends ViewCourseStates {}