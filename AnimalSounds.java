 class Animal {
    public void makeSound() {
        System.out.println("Animal makes a sound");
    }
}
class Lion extends Animal {
    @Override
    public void makeSound() {
        System.out.println("Lion roars");
    }
}
class Elephant extends Animal {
    @Override
    public void makeSound() {
        System.out.println("Elephant trumpets");
    }
}
class Bird extends Animal {
    @Override
    public void makeSound() {
        System.out.println("Bird chirps");
    }
}
public class AnimalSounds {
    public static void main(String[] args) {
        Animal myLion = new Lion();
        Animal myElephant = new Elephant();
        Animal myBird = new Bird();

        myLion.makeSound();      // Output: Lion roars
        myElephant.makeSound();  // Output: Elephant trumpets
        myBird.makeSound();      // Output: Bird chirps
    }
}