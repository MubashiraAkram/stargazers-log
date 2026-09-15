import java.util.Scanner;
 class ParkingCounter {

    private int parkingSlots;

    public ParkingCounter(int parkingSlots) {
        this.parkingSlots = 128;
    }
public void displayParkingSlots() {
        System.out.println("Total Parking Slots: " + this.parkingSlots);
    }
    public void updateParkingSlots(int choice) {
        if (choice == 1) {
            this.parkingSlots++;
            System.out.println("A vehicle has exited. Updated Parking Slots: " + this.parkingSlots);
        } else if (choice == 0) {
            if (this.parkingSlots > 0) {
                this.parkingSlots--;
                System.out.println("A vehicle has entered. Updated Parking Slots: " + this.parkingSlots);
            } else {
                System.out.println("Parking is full. No available slots.");
            }
        } else {
            System.out.println("Invalid choice. Please enter 0 or 1.");
        }

    }
}
class ParkingManager {
    public static void main(String[] args) {
        ParkingCounter parkingCounter = new ParkingCounter(128);
        Scanner scanner = new Scanner(System.in);
        int choice;

        do {
            System.out.println("\nParking Management System");
            System.out.println("1. Vehicle Exit");
            System.out.println("0. Vehicle Entry");
            System.out.println("2. Display Available Parking Slots");
            System.out.println("3. Exit");
            System.out.print("Enter your choice: ");
            choice = scanner.nextInt();

            switch (choice) {
                case 1:
                    parkingCounter.updateParkingSlots(1);
                    break;
                case 0:
                    parkingCounter.updateParkingSlots(0);
                    break;
                case 2:
                    parkingCounter.displayParkingSlots();
                    break;
                case 3:
                    System.out.println("Exiting the system.");
                    break;
                default:
                    System.out.println("Invalid choice. Please try again.");
            }
        } while (choice != 3);

        scanner.close();
    }
}
