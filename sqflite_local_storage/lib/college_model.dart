
class College{
  final String studentName;
  final int rollNo;
  final int marks;

  College(
    {
      required this.studentName,
      required this.rollNo,
      required this.marks,
    }
  );

  Map<String,dynamic> collegeMap(){
    return (
      {
        "studentName":studentName,
        "rollNo":rollNo,
        "marks":marks,
      }
    );
  }
}