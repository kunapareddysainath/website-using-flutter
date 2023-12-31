import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:device_frame/device_frame.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Utils.dart';
import '../cubit/device_frame_cubit.dart';
import 'package:google_fonts/google_fonts.dart';

class DeviceFrameWidget extends StatelessWidget {
  const DeviceFrameWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: Devices.all.length,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: BlocBuilder<DeviceFrameCubit, DeviceFrameState>(
              builder: (context, state) {
                // Display the selected folder as the title
                String selectedFolder = state.selectedFolder;
                return Text(
                  selectedFolder.toUpperCase(),
                  style: GoogleFonts.fredoka(),
                );
              },
            ),
          ),
          Expanded(
            child: BlocBuilder<DeviceFrameCubit, DeviceFrameState>(
              builder: (context, state) {
                return LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    if (constraints.maxWidth > 450) {
                      return landscape(context, state);
                    } else {
                      return portrait(context, state);
                    }
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget landscape(BuildContext context, state) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        leftOptions(context, state),
        // Spacer between the left folder list and the device frame
        SizedBox(width: 10),
        // Display the device frame
        device(context, state),
        // Spacer between the device frame and the right folder list
        SizedBox(width: 10),
        // Display the list of folders to the right of the device frame

        rightOptions(context, state),
      ],
    );
  }

  Widget portrait(BuildContext context, state) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        leftOptions(context, state),
        // Spacer between the left folder list and the device frame
        SizedBox(width: 10),
        // Display the device frame
        device(context, state),
        // Spacer between the device frame and the right folder list
        SizedBox(width: 10),
        // Display the list of folders to the right of the device frame
        rightOptions(context, state),
      ],
    );
  }

  Widget rightOptions(BuildContext context, state) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (String folder in Utils.RIGHTFOLDERS.keys)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  context.read<DeviceFrameCubit>().changeFolder(folder);
                },
                child: Container(
                  width: 180,
                  child: Center(
                      child: Text(
                    folder.toUpperCase(),
                    style: GoogleFonts.lato(),
                  )),
                ),
              ),
            ),
          ),
      ],
    );
  }

  Widget device(BuildContext context, state) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: AnimatedBuilder(
        animation: DefaultTabController.of(context),
        builder: (context, _) => _frame(
          Devices.all[DefaultTabController.of(context).index],
          state.selectedFolder,
          state.currentImageIndex,
          context,
        ),
      ),
    );
  }

  Widget leftOptions(BuildContext context, state) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (String folder in Utils.LEFTFOLDERS.keys)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  context.read<DeviceFrameCubit>().changeFolder(folder);
                },
                child: Container(
                  width: 180,
                  child: Center(
                      child: Text(
                    folder.toUpperCase(),
                    style: GoogleFonts.lato(),
                  )),
                ),
              ),
            ),
          ),
      ],
    );
  }

  Widget _frame(DeviceInfo device, String selectedFolder, int currentImageIndex,
      BuildContext context) {
    Map<String, List<String>> folders = {};
    for (String key in Utils.LEFTFOLDERS.keys) {
      folders[key] = List.from(Utils.LEFTFOLDERS[key] ?? []);
    }
    for (String key in Utils.RIGHTFOLDERS.keys) {
      folders[key] = List.from(Utils.RIGHTFOLDERS[key] ?? []);
    }

    List<String> imagePaths = folders[selectedFolder] ?? [];

    return DeviceFrame(
      device: device,
      orientation: Orientation.portrait,
      screen: Container(
        color: Colors.blue,
        child: CarouselSlider(
          options: CarouselOptions(
            aspectRatio: 16 / 9,
            viewportFraction: 1.0,
            onPageChanged: (index, reason) {
              context.read<DeviceFrameCubit>().pageChanged(index);

              // Check if the user is swiping on the last image
              if (index == imagePaths.length - 1 &&
                  reason == CarouselPageChangedReason.manual) {
                // Change folder to the next one
                int nextFolderIndex =
                    (folders.keys.toList().indexOf(selectedFolder) + 1) %
                        folders.length;

                String nextFolder = folders.keys.toList()[nextFolderIndex];

                context.read<DeviceFrameCubit>().changeFolder(nextFolder);
              }
            },
          ),
          items: imagePaths.map((imagePath) {
            return FakeScreen(imagePath: imagePath);
          }).toList(),
        ),
      ),
    );
  }
}

class FakeScreen extends StatelessWidget {
  const FakeScreen({
    Key? key,
    required this.imagePath,
  }) : super(key: key);

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final mediaQuery = MediaQuery.of(context);
    final color =
        theme.platform == TargetPlatform.iOS ? Colors.cyan : Colors.green;
    return Container(
      padding: mediaQuery.padding,
      child: Container(
        color: color,
        child: AnimatedPadding(
          duration: const Duration(seconds: 1),
          padding: EdgeInsets.only(bottom: mediaQuery.viewInsets.bottom),
          child: Image.network(
            imagePath,
            fit: BoxFit.cover, // Set the fit property to cover the entire screen
          ),
        ),
      ),
    );
  }
}

