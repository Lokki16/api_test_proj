import 'package:api_test_proj/bloc/notification/notification_bloc.dart';
import 'package:api_test_proj/presentation/layout/default_body.dart';
import 'package:api_test_proj/presentation/widgets/custom_column.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultBody(
      settings: true,
      child: BlocBuilder<NotificationBloc, NotificationState>(
        builder: (context, state) {
          if (state is NotificationInitialState) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is NotificationErrorState) {
            return const Center(child: Text('Error!'));
          }

          if (state is NotificationLoadedState) {
            return SingleChildScrollView(
              child: CustomColumn(
                space: 20,
                children: [
                  for (final data in state.notificationLoaded.data)
                    Column(
                      children: [
                        Row(
                          children: [
                            const Text('Title: '),
                            Text(data.title),
                          ],
                        ),
                        Row(
                          children: [
                            const Text('Body: '),
                            Expanded(child: Text(data.body, softWrap: true)),
                          ],
                        ),
                        Row(
                          children: [
                            const Text('Date time: '),
                            Text(data.dateTime),
                          ],
                        ),
                      ],
                    ),
                ],
              ),
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
