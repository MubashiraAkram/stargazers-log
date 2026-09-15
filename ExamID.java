class Lecturer {
    public String name;
    public int lecturerID;

    public Lecturer(String name, int lecturerID) {
        this.name = name;
        this.lecturerID = lecturerID;
    }
    public void displayDetails() {
        System.out.println("Lecturer Name: " + this.name);
        System.out.println("Lecturer ID: " + this.lecturerID);
    }  
}
class Exam {
    public int examDate;
    public int examID;

    public Exam(int examDate, int examID) {
        this.examDate = examDate;
        this.examID = examID;
        
    }
    public void displayDetails() {
        System.out.println("Exam Date: " + this.examDate);
        System.out.println("Exam ID: " + this.examID);
    }  
}
class Subject {
    public String subjectName;
    public int subjectCode;
    public Lecturer lecturer;
    public Exam exam;

    public Subject(String subjectName, int subjectCode, Lecturer lecturer, Exam exam) {
        this.subjectName = subjectName;
        this.subjectCode = subjectCode;
        this.lecturer = lecturer;
        this.exam = exam;
    }
    public void displayDetails() {
        System.out.println("Subject Name: " + this.subjectName);
        System.out.println("Subject Code: " + this.subjectCode);
        this.lecturer.displayDetails();
        this.exam.displayDetails();
    }  
}
class ExamID {
    public static void main(String[] args) {
        Lecturer lecturer1 = new Lecturer("Dr. Smith", 101);
        Exam exam1 = new Exam(20231015, 202); // Example date: 2023-10-15
        Subject subject1 = new Subject("Mathematics", 301, lecturer1, exam1);

        subject1.displayDetails();
    }
}