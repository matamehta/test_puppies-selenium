Feature: Adopting puppies
  As a puppy lover
  I want to adopt puppies
  So they can chew my furniture

Background:
  Given I am on the puppy adoption site

Scenario: Thank you message should be displayed when adopting a puppy
  When I complete the adoption of a puppy
  Then I should see "Thank you for adopting a puppy!"

Scenario: Adopting a puppy using a credit card
  When I click the View Details button for "Brook"
  And I click the Adopt Me button
  And I click the Complete the Adoption button
  And I complete the adoption using a Credit card
  Then I should see "Thank you for adopting a puppy!"

Scenario: Adopting two puppies
  When I click the View Details button for the puppy in the first place
  And I click the Adopt Me button
  And I click the Adopt Another Puppy button
  When I click the View Details button for the puppy in the second place
  And I click the Adopt Me button
  And I click the Complete the Adoption button
  And I enter "Cheezy" in the name field
  And I enter "123 Main Street" in the address field
  And I enter "cheezy@example.com" in the email field
  And I select "Credit card" from the pay with dropdown
  And I click the Place Order button
  Then I should see "Thank you for adopting a puppy!"

Scenario: Validate cart with one puppy
  When I click the View Details button for "Brook"
  And I click the Adopt Me button
  Then I should see "Brook" as the name for line item 1
  And I should see "$34.95" as the subtotal for line item 1
  And I should see "$34.95" as the cart total

Scenario: Validate cart with two puppies
  When I click the View Details button for "Brook"
  And I click the Adopt Me button
  And I click the Adopt Another Puppy button
  When I click the View Details button for "Hanna"
  And I click the Adopt Me button
  Then I should see "Brook" as the name for line item 1
  And I should see "$34.95" as the subtotal for line item 1
  And I should see "Hanna" as the name for line item 2
  And I should see "$22.99" as the subtotal for line item 2
  And I should see "$57.94" as the cart total

@wip
Scenario: Name is a required field
  When I checkout leaving the name field blank
  Then I should see the error message "Name can't be blank"
