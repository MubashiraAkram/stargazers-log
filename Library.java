class LibraryItem {
     protected String title;
     protected String author;
     protected boolean checkedOut;

      public LibraryItem(String title, String author) {
        this.title = title;
        this.author = author;
        this.checkedOut = false;
    }

   public void checkout(){
              if (!checkedOut) {
                checkedOut = true;
                System.out.println(this.title + " has been checked out.");
              } else {
                System.out.println(this.title + " is already checked out.");
              }
   }  

 public void returnItem(){
              if (checkedOut) {
            checkedOut = false;
            System.out.println(title + " has been returned.");
        } else {
            System.out.println(title + " was not checked out.");
        }
}

public String getTitle () {
        return title;
    }

    public String getAuthor() {
        return author;
    }

    public boolean isCheckedOut() {
        return checkedOut;
    }

    public void displayDetails() {
        System.out.println("Title: " + title);
        System.out.println("Author: " + author);
        System.out.println("Checked Out: " + checkedOut);
    }
}
class Book extends LibraryItem {
    private int BookID;
    public Book(String title, String author) {
        super(title, author);
        this.BookID = 0; // Default ID, can be set later
    }
}
class DVD extends LibraryItem {
    private int DVDID;
    public DVD(String title, String author) {
        super(title, author);
        this.DVDID = 0; // Default ID, can be set later
    }
}

public class Library {
    public static void main(String[] args) {
        Book book1 = new Book("The Great Gatsby", "F. Scott Fitzgerald");
        Book book2 = new Book("To Kill a Mockingbird", "Harper Lee");
        Book book3 = new Book("1984", "George Orwell");

        book1.displayDetails();
        book1.checkout();
        book1.checkout(); // Attempt to check out again
        book1.returnItem();
        book1.returnItem(); // Attempt to return again

        System.out.println();

        book2.displayDetails();
        book2.checkout();
        book2.returnItem();
   
    }
}
