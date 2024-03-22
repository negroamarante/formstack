@isTest
private class UtilsTest {
  @isTest
  private static void testSort_NullList() {
    // Actual test
    Test.startTest();
    try {
      SObjectSort sortClass = new SObjectSort(
        null,
        SObjectSort.SortOrder.ASCENDENT
      );
    } catch (SObjectSort.SortException e) {
      System.assertEquals(
        'You must provide a field to sort the list',
        e.getMessage(),
        'Invalid exception message'
      );
    }
    Test.stopTest();
  }

  @isTest
  private static void testSort_Account_SortASC() {
    List<Account> accounts = new List<Account>();
    accounts.add(new Account(Name = 'Acc4'));
    accounts.add(null);
    accounts.add(new Account(Name = 'Acc2'));
    accounts.add(new Account(Name = 'Acc3'));

    // Actual test
    Test.startTest();
    SObjectSort sortClass = new SObjectSort(
      Account.Name,
      SObjectSort.SortOrder.ASCENDENT
    );
    accounts.sort(sortClass);
    Test.stopTest();

    // Asserts
    System.assertEquals(accounts[0].Name, 'Acc2', 'The order is wrong');
    System.assertEquals(accounts[1].Name, 'Acc3', 'The order is wrong');
    System.assertEquals(accounts[2].Name, 'Acc4', 'The order is wrong');
    System.assertEquals(accounts[3], null, 'The order is wrong');
  }

  @isTest
  private static void testSort_Account_SortDESC() {
    List<Account> accounts = new List<Account>();
    accounts.add(new Account(Name = 'Acc4'));
    accounts.add(null);
    accounts.add(new Account(Name = 'Acc2'));
    accounts.add(new Account(Name = 'Acc3'));

    // Actual test
    Test.startTest();
    SObjectSort sortClass = new SObjectSort(
      Account.Name,
      SObjectSort.SortOrder.DESCENDENT
    );
    accounts.sort(sortClass);
    Test.stopTest();

    // Asserts
    System.assertEquals(accounts[0].Name, 'Acc4', 'The order is wrong');
    System.assertEquals(accounts[1].Name, 'Acc3', 'The order is wrong');
    System.assertEquals(accounts[2].Name, 'Acc2', 'The order is wrong');
    System.assertEquals(accounts[3], null, 'The order is wrong');
  }

  @isTest
  private static void testSort_Contact_SortASC() {
    List<Contact> contacts = new List<Contact>();
    contacts.add(new Contact(FirstName = 'TestFirst', Title = 'Title 4'));
    contacts.add(new Contact(FirstName = 'TestFirst'));
    contacts.add(new Contact(FirstName = 'TestFirst', Title = 'Title 2'));
    contacts.add(new Contact(FirstName = 'TestFirst', Title = 'Title 3'));

    // Actual test
    Test.startTest();
    SObjectSort sortClass = new SObjectSort(
      Contact.Title,
      SObjectSort.SortOrder.ASCENDENT
    );
    contacts.sort(sortClass);
    Test.stopTest();

    // Asserts
    System.assertEquals(contacts[0].Title, 'Title 2', 'The order is wrong');
    System.assertEquals(contacts[1].Title, 'Title 3', 'The order is wrong');
    System.assertEquals(contacts[2].Title, 'Title 4', 'The order is wrong');
    System.assertEquals(contacts[3].Title, null, 'The order is wrong');
  }

  @isTest
  private static void testSort_Contact_SortDESC() {
    List<Contact> contacts = new List<Contact>();
    contacts.add(new Contact(FirstName = 'TestFirst', Title = 'Title 4'));
    contacts.add(new Contact(FirstName = 'TestFirst'));
    contacts.add(new Contact(FirstName = 'TestFirst', Title = 'Title 2'));
    contacts.add(new Contact(FirstName = 'TestFirst', Title = 'Title 3'));

    // Actual test
    Test.startTest();
    SObjectSort sortClass = new SObjectSort(
      Contact.Title,
      SObjectSort.SortOrder.DESCENDENT
    );
    contacts.sort(sortClass);
    Test.stopTest();

    // Asserts
    System.assertEquals(contacts[0].Title, 'Title 4', 'The order is wrong');
    System.assertEquals(contacts[1].Title, 'Title 3', 'The order is wrong');
    System.assertEquals(contacts[2].Title, 'Title 2', 'The order is wrong');
    System.assertEquals(contacts[3].Title, null, 'The order is wrong');
  }

  @isTest
  private static void testSort_Cars_SortASC() {
    List<Car__c> cars = new List<Car__c>();
    cars.add(new Car__c(Name = 'Car 1', Service__c = Date.today().addDays(-5)));
    cars.add(
      new Car__c(Name = 'Car 2', Service__c = Date.today().addDays(-10))
    );
    cars.add(new Car__c(Name = 'Car 3', Service__c = Date.today().addDays(-3)));

    // Actual test
    Test.startTest();
    SObjectSort sortClass = new SObjectSort(
      Car__c.Service__c,
      SObjectSort.SortOrder.ASCENDENT
    );
    cars.sort(sortClass);
    Test.stopTest();

    // Asserts
    System.assertEquals(cars[0].Name, 'Car 2', 'The order is wrong');
    System.assertEquals(cars[1].Name, 'Car 1', 'The order is wrong');
    System.assertEquals(cars[2].Name, 'Car 3', 'The order is wrong');
  }

  @isTest
  private static void testSort_Cars_SortDESC() {
    List<Car__c> cars = new List<Car__c>();
    cars.add(new Car__c(Name = 'Car 1', Service__c = Date.today().addDays(-5)));
    cars.add(
      new Car__c(Name = 'Car 2', Service__c = Date.today().addDays(-10))
    );
    cars.add(new Car__c(Name = 'Car 3', Service__c = Date.today().addDays(-3)));

    // Actual test
    Test.startTest();
    SObjectSort sortClass = new SObjectSort(
      Car__c.Service__c,
      SObjectSort.SortOrder.DESCENDENT
    );
    cars.sort(sortClass);
    Test.stopTest();

    // Asserts
    System.assertEquals(cars[0].Name, 'Car 3', 'The order is wrong');
    System.assertEquals(cars[1].Name, 'Car 1', 'The order is wrong');
    System.assertEquals(cars[2].Name, 'Car 2', 'The order is wrong');
  }

  @isTest
  private static void testSort_Cars_SortASC_Integer() {
    List<Car__c> cars = new List<Car__c>();
    cars.add(new Car__c(Name = 'Car 1', Year__c = 2005));
    cars.add(new Car__c(Name = 'Car 2', Year__c = 2000));
    cars.add(new Car__c(Name = 'Car 3', Year__c = 2010));

    // Actual test
    Test.startTest();
    SObjectSort sortClass = new SObjectSort(
      Car__c.Year__c,
      SObjectSort.SortOrder.ASCENDENT
    );
    cars.sort(sortClass);
    Test.stopTest();

    // Asserts
    System.assertEquals(cars[0].Name, 'Car 2', 'The order is wrong');
    System.assertEquals(cars[1].Name, 'Car 1', 'The order is wrong');
    System.assertEquals(cars[2].Name, 'Car 3', 'The order is wrong');
  }

  @isTest
  private static void testSort_Cars_SortDESC_Integer() {
    List<Car__c> cars = new List<Car__c>();
    cars.add(new Car__c(Name = 'Car 1', Year__c = 2005));
    cars.add(new Car__c(Name = 'Car 2', Year__c = 2000));
    cars.add(new Car__c(Name = 'Car 3', Year__c = 2010));

    // Actual test
    Test.startTest();
    SObjectSort sortClass = new SObjectSort(
      Car__c.Year__c,
      SObjectSort.SortOrder.DESCENDENT
    );
    cars.sort(sortClass);
    Test.stopTest();

    // Asserts
    System.assertEquals(cars[0].Name, 'Car 3', 'The order is wrong');
    System.assertEquals(cars[1].Name, 'Car 1', 'The order is wrong');
    System.assertEquals(cars[2].Name, 'Car 2', 'The order is wrong');
  }
}
