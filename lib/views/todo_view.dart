import 'package:flutter/material.dart';
import 'package:notes_app/layouts/widgets/custom_outlined_button.dart';
import 'package:notes_app/layouts/widgets/custom_text_button.dart';
import 'package:notes_app/models/models.dart';
import 'package:notes_app/services/services.dart';
import 'package:notes_app/views/widgets/title_date_item.dart';
import 'package:notes_app/views/widgets/todo_item.dart';
import 'package:provider/provider.dart';

class TodoView extends StatelessWidget {
  const TodoView({super.key});

  @override
  Widget build(BuildContext context) {
    final todoService = Provider.of<TodoService>(context);
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(left: 5, bottom: 15),
        child: Column(
          children: [
            todoService.isLoading
                ? const Padding(
                    padding: EdgeInsets.all(30),
                    child: CircularProgressIndicator(
                      color: Colors.black,
                    ),
                  )
                : todoService.tasks.isNotEmpty
                    ? Expanded(
                        child: ListView.separated(
                          padding: const EdgeInsets.only(top: 5),
                          physics: const BouncingScrollPhysics(
                            decelerationRate: ScrollDecelerationRate.fast,
                          ),
                          shrinkWrap: true,
                          itemCount: todoService.tasks.length,
                          itemBuilder: (context, index1) {
                            return Column(
                              children: [
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.commit_outlined,
                                      size: 23,
                                      color: Colors.black26,
                                    ),
                                    TitleDateItem(
                                      date: todoService.tasks[index1].date,
                                      title: todoService.tasks[index1].title,
                                      id: todoService.tasks[index1].id,
                                    )
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 3),
                                  child: ListView.builder(
                                    padding: const EdgeInsets.all(0),
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount:
                                        todoService.tasks[index1].contentCount,
                                    itemBuilder: (context, index2) {
                                      return Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          TodoItem(
                                            task: Task(
                                              id: todoService.tasks[index1].id,
                                              title: todoService
                                                  .tasks[index1].title,
                                              date: todoService
                                                  .tasks[index1].date,
                                              contentCount: todoService
                                                  .tasks[index1].contentCount,
                                              content: todoService
                                                  .tasks[index1].content,
                                            ),
                                            description: todoService
                                                .tasks[index1]
                                                .content[index2]
                                                .description,
                                            isCompleted: todoService
                                                .tasks[index1]
                                                .content[index2]
                                                .isCompleted,
                                            index: index2,
                                          ),
                                          if (index2 ==
                                              todoService.tasks[index1]
                                                      .contentCount -
                                                  1) ...[
                                            SizedBox(
                                              height: 35,
                                              child: Row(
                                                children: [
                                                  const VerticalDivider(
                                                    color: Colors.grey,
                                                  ),
                                                  Expanded(
                                                    child: CustomTextButton2(
                                                      task: Task(
                                                        content: todoService
                                                            .tasks[index1]
                                                            .content,
                                                        contentCount:
                                                            todoService
                                                                .tasks[index1]
                                                                .contentCount,
                                                        date: todoService
                                                            .tasks[index1].date,
                                                        title: todoService
                                                            .tasks[index1]
                                                            .title,
                                                        id: todoService
                                                            .tasks[index1].id!,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ]
                                        ],
                                      );
                                    },
                                  ),
                                ),
                              ],
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return const SizedBox(height: 10);
                          },
                        ),
                      )
                    : const Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Text(
                          'No hay nada por hacer...',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
          ],
        ),
      ),
    );
  }
}
