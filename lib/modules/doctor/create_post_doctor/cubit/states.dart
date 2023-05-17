abstract class CreatePostDoctorStates {}

class CreatePostDoctorInitialState extends CreatePostDoctorStates {}

class ChangeState extends CreatePostDoctorStates {}

class ChangeImageState extends CreatePostDoctorStates {}

class CreatePostState extends CreatePostDoctorStates {}

class CreatePostSuccessState extends CreatePostDoctorStates {}

class CreatePostErrorState extends CreatePostDoctorStates {}
