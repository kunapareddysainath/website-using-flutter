import 'package:flutter_bloc/flutter_bloc.dart';

// Define the events
abstract class DeviceFrameEvent {}

class ChangeFolderEvent extends DeviceFrameEvent {
  final String folder;

  ChangeFolderEvent(this.folder);
}

class PageChangedEvent extends DeviceFrameEvent {
  final int index;

  PageChangedEvent(this.index);
}

// Define the state
class DeviceFrameState {
  final String selectedFolder;
  final int currentImageIndex;

  DeviceFrameState(this.selectedFolder, this.currentImageIndex);
}

// Define the Cubit
class DeviceFrameCubit extends Cubit<DeviceFrameState> {
  DeviceFrameCubit(String selectedFolder, int currentImageIndex)
      : super(DeviceFrameState(selectedFolder, currentImageIndex));

  void changeFolder(String folder) {
    emit(DeviceFrameState(folder, 0));
  }

  void pageChanged(int index) {
    emit(DeviceFrameState(state.selectedFolder, index));
  }
}
