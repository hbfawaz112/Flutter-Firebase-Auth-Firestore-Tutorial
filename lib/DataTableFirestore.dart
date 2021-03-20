import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'main.dart';
class D1 extends StatefulWidget {
  D1({Key key}) : super(key: key);

  @override
  _D1State createState() => _D1State();
}

class _D1State extends State<D1> {


  TextEditingController t1=TextEditingController();
  TextEditingController t2=TextEditingController();
  TextEditingController t3=TextEditingController();
  TextEditingController t4=TextEditingController();


  String studentName,studentID , studyProgramId;
  double studentGPA;

  getStudentName(name){
    this.studentName=name;
  }
  getStudentID(ID){
    this.studentID=ID;
  }
  getStudyProgramID(programID){
    this.studyProgramId=programID;
  }
  getStudentGPA(gpa){
    this.studentGPA=double.parse(gpa);
  }

  createData(){
    print("Created");
    
    DocumentReference documentReference = FirebaseFirestore.instance.
                                          collection("MyStudents").doc(studentName);

    Map<String, dynamic> students = {
      "studentName":studentName,
      "studentID":studentID,
      "studyProgramID":studyProgramId,
      "studentGPA":studentGPA
    };

    documentReference.set(students).whenComplete((){
        print("$studentName create");
    });
    t1.clear();
    t2.clear();
    t3.clear();
    t4.clear();
    

  }


 readData(){
    print("read");

        DocumentReference documentReference = FirebaseFirestore.instance.
                                          collection("MyStudents").doc(studentName);
        documentReference.get().then((datasnapshot){
            print(datasnapshot.data()["studentName"]);
            print(datasnapshot.data()["studentID"]);
            print(datasnapshot.data()["studyProgramID"]);
            print(datasnapshot.data()["studentGPA"]);
            
            
        });

        //clear input

  }
  updateData(){
    print("update");
    DocumentReference documentReference = FirebaseFirestore.instance.
                                          collection("MyStudents").doc(studentName);


    Map<String, dynamic> students = {
      "studentName":studentName,
      "studentID":studentID,
      "studyProgramID":studyProgramId,
      "studentGPA":studentGPA
    };

    documentReference.set(students).whenComplete((){
        print("$studentName updated");
    });

  }
  deleteData(){
    
    DocumentReference documentReference = FirebaseFirestore.instance.
                                          collection("MyStudents").doc(studentName);

              documentReference.delete().whenComplete(() => {
                print('$studentName deleted')
              });                             
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor:  Color(0xFF28292E),
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Color(0xFF28292E),
          title: Text("Firestore Crud Operations " , style: TextStyle(color:Colors.white),),
          centerTitle: true,
          actions: [
            IconButton(icon: Icon(Icons.exit_to_app , color: Colors.white,size: 20), onPressed:(){
                  Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => HomePage()),
                              );
            })
          ],

        ),
        

        body: ListView(
                  children:[Column(
            children:[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: t1,
                    style: TextStyle(color: Colors.white),

                    decoration:InputDecoration(
                      
                      enabledBorder: const OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white, width: 1.0),
                  ),
                      labelText: "Name",fillColor: Colors.white,
                      labelStyle: TextStyle(color:Colors.white),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.purpleAccent , width: 2.0)
                      )
                    ),
                    onChanged: (String name){
                         getStudentName(name);
                    },
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: t2,
                                      style: TextStyle(color: Colors.white),

                    decoration:InputDecoration(
                      
                      enabledBorder: const OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white, width: 1.0),
                  ),
                      labelText: "StudentID",fillColor: Colors.white,
                      labelStyle: TextStyle(color:Colors.white),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.purpleAccent , width: 2.0)
                      )
                    ),
                    onChanged: (String ID){
                         getStudentID(ID);
                    },
                  ),
                ),
                
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                                      style: TextStyle(color: Colors.white),
                  controller: t3,
                    decoration:InputDecoration(
                      
                      enabledBorder: const OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white, width: 1.0),
                  ),
                      labelText: "StudyProgramID",fillColor: Colors.white,
                      labelStyle: TextStyle(color:Colors.white),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.purpleAccent , width: 2.0)
                      )
                    ),
                    onChanged: (String programID){
                        getStudyProgramID(programID);
                    },
                  ),
                ),
                
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: t4,
                                      style: TextStyle(color: Colors.white),

                    decoration:InputDecoration(
                      
                      enabledBorder: const OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white, width: 1.0),
                  ),
                      labelText: "StudentGPA",fillColor: Colors.white,
                      labelStyle: TextStyle(color:Colors.white),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.purpleAccent , width: 2.0)
                      )
                    ),
                    onChanged: (String gpa){
                        getStudentGPA(gpa);
                    },  
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:<Widget>[

                      // ignore: deprecated_member_use
                      RaisedButton(
                        color: Colors.purpleAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Text('Create' , 
                            style:TextStyle(
                              color: Colors.white,
                            )
                        ),
                        onPressed: (){
                            createData();
                        },

                      ) ,

                      RaisedButton(
                        color: Colors.grey,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Text('Read' , 
                            style:TextStyle(
                              color: Colors.white,
                            )
                        ),
                        onPressed: (){
                          readData();
                        },

                      ) ,
                      
                      RaisedButton(
                        color: Colors.purpleAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Text('Update' , 
                            style:TextStyle(
                              color: Colors.white,
                            )
                        ),
                        onPressed: (){
                          updateData();
                        },

                      ) ,
                      
                      RaisedButton(
                        color: Colors.grey,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Text('Delete' , 
                            style:TextStyle(
                              color: Colors.white,
                            )
                        ),
                        onPressed: (){
                          deleteData();
                        },

                      ) ,
                      

                  ]
                ),

                StreamBuilder(
        // <2> Pass `Stream<QuerySnapshot>` to stream
        stream: FirebaseFirestore.instance.collection('MyStudents').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            // <3> Retrieve `List<DocumentSnapshot>` from snapshot
            final List<DocumentSnapshot> documents = snapshot.data.docs;
            return DataTable(
              columnSpacing:35 ,
              columns:[ 
            DataColumn(label: Text("Name",style: TextStyle (color: Colors.white, fontSize:16,fontWeight: FontWeight.w800),)),
            DataColumn(label: Text("ID",style: TextStyle(color: Colors.white,fontSize:16,fontWeight: FontWeight.w800),)),
            DataColumn(label: Text("GPA",style: TextStyle(color: Colors.white,fontSize:16,fontWeight: FontWeight.w500),)),
            DataColumn(label: Text("ProgramID",style: TextStyle(color: Colors.white,fontSize:16,fontWeight: FontWeight.w800),)),
            ],
          rows: documents.map( 
            (student)=>DataRow(cells: 
          [ 
            DataCell(
              Text(student["studentName"] ,style: TextStyle(color:Colors.white),  ),
            ),
            DataCell(
              Text(student["studentID"] ,style: TextStyle(color:Colors.white), ),
            ),

            DataCell(
              Text(student["studentGPA"].toString() , style: TextStyle(color:Colors.white),) ,
            ),
            DataCell(
              Text(student["studyProgramID"] ,style: TextStyle(color:Colors.white), ),
            ),
            
          ]
            )//DATA ROW
          ).toList()
        );
                    
          } else if (snapshot.hasError) {
            return Text('error');
          }
        })


            ]
          ),
                  ]
        )
        
    );
  }
}