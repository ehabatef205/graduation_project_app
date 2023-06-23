abstract class UpdateDoctorProfileStates {}

class UpdateDoctorProfileInitialState extends UpdateDoctorProfileStates {}

class ChangeImageState extends UpdateDoctorProfileStates {}

class UpdateLoadingState extends UpdateDoctorProfileStates {}

class UpdateErrorState extends UpdateDoctorProfileStates {}

class UpdateSuccessState extends UpdateDoctorProfileStates {}

class DeleteDoctorLoadingState extends UpdateDoctorProfileStates {}

class DeleteDoctorSuccessState extends UpdateDoctorProfileStates {}

class DeleteDoctorErrorState extends UpdateDoctorProfileStates {}
