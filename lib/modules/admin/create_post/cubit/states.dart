abstract class CreatePostStates {}

class CreatePostInitialState extends CreatePostStates {}
class ChangeState extends CreatePostStates {}
class ChangeImageState extends CreatePostStates {}
class CreatePostState extends CreatePostStates {}
class CreatePostSuccessState extends CreatePostStates {}
class CreatePostErrorState extends CreatePostStates {}