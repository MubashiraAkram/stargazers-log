class Vehicle {
    protected int year;
    protected String make;
    protected String model;
    protected int rentalPrice;

    public Vehicle(int year, String make, String model, int rentalPrice) {
        this.year = year;
        this.make = make;
        this.model = model;
        this.rentalPrice = rentalPrice;
    }

    public void displayDetails() {
        System.out.println("Year: " + this.year);
        System.out.println("Make: " + this.make);
        System.out.println("Model: " + this.model);
        System.out.println("Rental Price: Rs." + this.rentalPrice);
    }
    
}
class Car extends Vehicle{
    private int numSeats;

    public Car(int year, String make, String model, int rentalPrice, int numSeats) {
        super(year, make, model, rentalPrice);
        this.numSeats = numSeats;
    }

    public void displayDetails() {
        super.displayDetails();
        System.out.println("Number of Seats: " + this.numSeats);
    }

}
class Bike extends Vehicle{
    private boolean hasCarrier;

    public Bike(int year, String make, String model, int rentalPrice, boolean hasCarrier) {
        super(year, make, model, rentalPrice);
        this.hasCarrier = hasCarrier;
    }

    public void displayDetails() {
        super.displayDetails();
        System.out.println("Has Carrier: " + (this.hasCarrier ? "Yes" : "No"));
    }
}
class Truck extends Vehicle{
    private int loadCapacity;

    public Truck(int year, String make, String model, int rentalPrice, int loadCapacity) {
        super(year, make, model, rentalPrice);
        this.loadCapacity = loadCapacity;
    }

    public void displayDetails() {
        super.displayDetails();
        System.out.println("Load Capacity: " + this.loadCapacity + " kg");
    }
}
class VehicleRentalSystem {
    public static void main(String[] args) {
        Car car = new Car(2020, "Toyota", "Camry", 3000, 5);
        Bike bike = new Bike(2021, "Honda", "CBR500R", 1500, true);
        Truck truck = new Truck(2019, "Ford", "F-150", 5000, 1000);

        System.out.println("Car Details:");
        car.displayDetails();
        System.out.println();

        System.out.println("Bike Details:");
        bike.displayDetails();
        System.out.println();

        System.out.println("Truck Details:");
        truck.displayDetails();
    }
}
