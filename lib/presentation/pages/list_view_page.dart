import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo_task/core/constants/colors.dart';
import 'package:flutter_demo_task/domain/model/message_data_model.dart';
import 'package:flutter_demo_task/presentation/widgets/date_formatter_widget.dart';
import 'package:flutter_demo_task/presentation/widgets/status_widget.dart';
import 'package:google_fonts/google_fonts.dart';

@RoutePage()
class ListMessagePage extends StatelessWidget {
  const ListMessagePage({super.key,required this.listData});
  final ListItem listData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: TaskColors.transparent,
      ),
      backgroundColor: TaskColors.listBackgroundBlue,
      body:
      Center(
              child: Container(
                height: 400,
                width: 600,
                decoration: BoxDecoration(
                  border: Border.all(color: TaskColors.textWhite,width: 5),
                  borderRadius: BorderRadius.circular(10),

                ),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.all(30),
                      decoration: BoxDecoration(
                        color: TaskColors.boxWhite,
                        borderRadius: BorderRadius.circular(10)
                      ),
                      padding: const EdgeInsets.all(10),
                      child: SingleChildScrollView(
                        child: DataTable(
                          columnSpacing: 30,
                          columns:  [
                            DataColumn(label: Text("ID",style: GoogleFonts.lato(fontSize: 13,fontWeight: FontWeight.bold,color: TaskColors.headingBlue))),
                            DataColumn(label: Text("Summary", style: GoogleFonts.lato(fontSize: 13,fontWeight: FontWeight.bold,color: TaskColors.headingBlue)),),

                          ],
                          rows: [ DataRow(cells: [
                              DataCell(Text(listData.project!.first.projectId.toString(),style:GoogleFonts.lato(fontSize: 13))),
                              DataCell(SingleChildScrollView(child: Container(padding: const EdgeInsets.all(5),width: double.infinity,child: Text((listData.messageText)!= null ? listData.messageText.toString() :'Random',style:GoogleFonts.lato(fontSize: 13))))),
                            ])]

                        ),
                      )
                    ),
                    Container(
                        margin: const EdgeInsets.all(30),
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: TaskColors.boxWhite,
                            borderRadius: BorderRadius.circular(10)
                        ),
                        padding: const EdgeInsets.all(10),
                        child: SingleChildScrollView(
                          child: DataTable(
                              columnSpacing: 30,
                              columns:  [
                                DataColumn(label: Text("Type",style: GoogleFonts.lato(fontSize: 13,fontWeight: FontWeight.bold,color: TaskColors.headingBlue)),),
                                DataColumn(label: Text("Date", style: GoogleFonts.lato(fontSize: 13,fontWeight: FontWeight.bold,color: TaskColors.headingBlue)),),
                                DataColumn(label: Text("Status",style: GoogleFonts.lato(fontSize: 13,fontWeight: FontWeight.bold,color: TaskColors.headingBlue)),),
                              ],
                              rows: [ DataRow(cells: [
                                DataCell(Text(listData.messageType!.messageTypeName.toString(),style:GoogleFonts.lato(fontSize: 13))),
                                DataCell(Text((listData.publishDate != null)?formatDate(listData.publishDate!) : 'TBD',style:GoogleFonts.lato(fontSize: 13))),
                                DataCell(statusWidget(listData.messageStatus!.messageStatusName.toString()))
                              ])]

                          ),
                        )
                    ),
                  ],
                ),
              ),
            )



    );
  }
}
