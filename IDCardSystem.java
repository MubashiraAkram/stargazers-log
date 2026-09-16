class IDCard {
    private int idNumber;

    public IDCard(int idNumber) {
        this.idNumber = idNumber;
    }
    public int getIdNumber() {
        return this.idNumber;
    }  
}
class Employee {
    private String name;
    private int employeeId;
    private IDCard idCard;

    public Employee(String name, int employeeId, IDCard idCard) {
        this.name = name;
        this.employeeId = employeeId;
        this.idCard = idCard;
    }

   public void displayEmployeeDetails() {
        System.out.println("Employee Name: " + this.name);
        System.out.println("Employee ID: " + this.employeeId);
        System.out.println("ID Card Number: " + this.idCard.getIdNumber());
    }
}
class IDCardSystem {
    public static void main(String[] args) {
        IDCard idCard1 = new IDCard(1001);
        Employee employee1 = new Employee("Smith", 12345, idCard1);
        employee1.displayEmployeeDetails();
    }
}