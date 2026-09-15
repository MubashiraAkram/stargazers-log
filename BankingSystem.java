class BankAccount
{
    private String accountNumber;
    private String accountHolderName;
    private double balance;

    public BankAccount(String accountNumber, String accountHolderName, double balance)
    {
        this.accountNumber = accountNumber;
        this.accountHolderName = accountHolderName;
        this.balance = balance;
    }
    public void setBankAccountDetails(String accountNumber, String accountHolderName)
    {
        this.accountNumber = accountNumber;
        this.accountHolderName = accountHolderName;
    }

    public String getAccountNumber()
    {
        return this.accountNumber;
    }
    public String getAccountHolderName()
    {
        return this.accountHolderName;
    }
    public double getBalance()
    {
        return this.balance;
    }
    public void deposit(double amount)
    {
            this.balance += amount;
            System.out.println("Deposited Rs." + amount + " to account " + this.accountNumber);
    }
    public void withdraw(double amount)
    {
        if (amount <= this.balance)
        {
            this.balance -= amount;
            System.out.println("Withdrew Rs." + amount + " from account " + this.accountNumber);
        }
        else
        {
            System.out.println("Insufficient balance in account " + this.accountNumber);
        }
    }
    public void displayAccountDetails()
    {
        System.out.println("Account Number: " + this.accountNumber);
        System.out.println("Account Holder Name: " + this.accountHolderName);
        System.out.println("Balance: Rs." + this.balance);
    }

}
class BankingSystem{
    public static void main(String[] args)
    {
        BankAccount acc1 = new BankAccount("1234567890", "Walliee", 5000.0);
        acc1.displayAccountDetails();
        acc1.deposit(2000.0);
        acc1.withdraw(1000.0);
        acc1.displayAccountDetails();
    }
}