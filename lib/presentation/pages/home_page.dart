import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo_task/bloc/dialog_bloc/dialog_bloc.dart';
import 'package:flutter_demo_task/bloc/message_data_bloc/message_data_bloc.dart';
import 'package:flutter_demo_task/core/constants/colors.dart';
import 'package:flutter_demo_task/presentation/widgets/date_formatter_widget.dart';
import 'package:flutter_demo_task/presentation/widgets/loading_widget.dart';
import 'package:flutter_demo_task/presentation/widgets/status_widget.dart';
import 'package:flutter_demo_task/routes/app_routes.gr.dart';
import 'package:google_fonts/google_fonts.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TaskColors.backgroundBlack,
      body: Column(
        children: [
          Container(
            height: 50,
            margin: const EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: TaskColors.boxWhite, borderRadius: BorderRadius.circular(10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                    padding: const EdgeInsets.all(3),
                    margin: const EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: TaskColors.headBlue),
                    child: TextButton.icon(
                        onPressed: () {
                          context.read<DialogBloc>().add(OpenDialogEvent(context:context));
                        },
                        icon: const Icon(
                          Icons.add,
                          color: TaskColors.textWhite,
                          size: 17,
                        ),
                        label: const Text(
                          "Add Message",
                          style: TextStyle(color: TaskColors.textWhite, fontSize: 12),
                        )))
              ],
            ),
          ),
          BlocBuilder<MessageDataBloc, MessageDataState>(
            builder: (context, state) {
              if (state is MessageDataLoadedState) {
                // print(state.listItems.length);
                return Container(
                  height: MediaQuery.of(context).size.height * 0.8,
                  margin: const EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: TaskColors.boxWhite,
                      borderRadius: BorderRadius.circular(10)),
                  child: SingleChildScrollView(
                    child: DataTable(
                      columnSpacing: 20,
                      columns: [
                        DataColumn(
                            label: Text(
                          "ID",
                          style: GoogleFonts.lato(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: TaskColors.headingBlue,
                          ),
                        )),
                        DataColumn(
                          label: Text("Summary",
                              style: GoogleFonts.lato(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                  color: TaskColors.headingBlue)),
                        ),
                        DataColumn(
                            label: Text(
                          "Project ID",
                          style: GoogleFonts.lato(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: TaskColors.headingBlue),
                        )),
                        DataColumn(
                            label: Text(
                          "Type",
                          style: GoogleFonts.lato(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: TaskColors.headingBlue),
                        )),
                        DataColumn(
                            label: Text(
                          "ParticipantType",
                          style: GoogleFonts.lato(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: TaskColors.headingBlue),
                        )),
                        DataColumn(
                            label: Text(
                          "Published Date",
                          style: GoogleFonts.lato(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: TaskColors.headingBlue),
                        )),
                        DataColumn(
                            label: Text(
                          "Updated Date",
                          style: GoogleFonts.lato(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: TaskColors.headingBlue),
                        )),
                        DataColumn(
                            label: Text(
                          "End Date",
                          style: GoogleFonts.lato(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: TaskColors.headingBlue),
                        )),
                        DataColumn(
                            label: Text(
                          "Status",
                          style: GoogleFonts.lato(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: TaskColors.headingBlue),
                        )),
                        DataColumn(
                            label: Text(
                          "Action",
                          style: GoogleFonts.lato(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: TaskColors.headingBlue),
                        ))
                      ],
                      rows:
                          List.generate(state.listItems.length , (index) {
                        final item = state.listItems[index];
                        return DataRow(cells: [
                          DataCell(Text('${index + 1}'.toString())),

                          DataCell(SingleChildScrollView(
                              child: Container(
                                  padding: const EdgeInsets.all(10),
                                  width:
                                      MediaQuery.of(context).size.width * 0.2,
                                  child: Text(item.messageText != null ? item.messageText.toString() : 'Random',
                                      style:
                                          GoogleFonts.lato(fontSize: 12.5))))),

                          DataCell(Text(
                              item.project!.first.projectId.toString(),
                              style: GoogleFonts.lato(
                                  fontSize: 12, color: TaskColors.iconBlue))),

                          DataCell(Text(
                              item.messageType!.messageTypeName.toString() ,
                              style: GoogleFonts.lato(fontSize: 12))),

                          DataCell(SingleChildScrollView(
                              child: Container(
                                  padding: const EdgeInsets.all(10),
                                  width:
                                      MediaQuery.of(context).size.width * 0.1,
                                  child: Text(
                                      (item.messageParticipantType != null &&
                                              item.messageParticipantType!
                                                  .isNotEmpty)
                                          ? item.messageParticipantType!
                                                  .map((e) => e.role!.roleName).join(',')

                                          : 'Random',
                                      style: GoogleFonts.lato(fontSize: 12))))),
                          //item.messageParticipantType!.first.role?.roleName ?? ''
                          DataCell(Text(
                              (item.publishDate != null)
                                  ? formatDate(item.publishDate!)
                                  : 'TBD',
                              style: GoogleFonts.lato(fontSize: 12))),

                          DataCell(Text(
                              (item.updatedAt != null)
                                  ? formatDate(item.updatedAt!)
                                  : 'TBD',
                              style: GoogleFonts.lato(fontSize: 12))),

                          DataCell(Text(
                              (item.endDate != null)
                                  ? formatDate(item.endDate!)
                                  : 'TBD',
                              style: GoogleFonts.lato(fontSize: 12))),

                          DataCell(statusWidget(item
                              .messageStatus!.messageStatusName
                              .toString())),

                          DataCell(
                               IconButton(
                                onPressed: () {
                                  context.router.push(ListMessageRoute(listData: item));
                                  // context.read<ListPageBloc>().add(
                                  //     NavigateToListPageEvent(
                                  //         context: context,
                                  //         id: '${index + 1}'.toString(),
                                  //         summary:
                                  //         item.messageText != null ? item.messageText.toString() : 'Random',
                                  //         type: item
                                  //                 .messageType!.messageTypeName
                                  //                 .toString() ,
                                  //         publishDate: (item.publishDate !=
                                  //                 null)
                                  //             ? formatDate(item.publishDate!)
                                  //             : 'TBD',
                                  //         status: (item
                                  //             .messageStatus!.messageStatusName
                                  //             .toString())));
                                },
                                icon: const Icon(
                                  Icons.remove_red_eye,
                                  color:TaskColors.iconBlue,
                                  size: 15,
                                ),
                              )

                          )
                          ,
                        ]);
                      }),
                    ),
                  ),
                );
              } else {
                return Container(
                  margin: const EdgeInsets.only(top: 250),
                  child: loader(
                    color: TaskColors.headBlue,
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
