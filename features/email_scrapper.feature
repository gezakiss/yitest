Feature: Grab and store emails of clients as they fill a checkout form.
  As an anonymous user

  Scenario Outline: I fill the form and submit it
    Given I am on the checkout page
    And fill Email field with "<email>"
    And fill Name field with "somebody"
    And wait 1 sec
    When I click on "Create Order"
    And wait 1 sec
    Then grablist should have 0 new items
    And "<email>" should not be on the grablist
    Examples:
      | email                |
      | address@domain.co.uk |
      | address@domain.hu    |
      | address@domain.com   |

  Scenario Outline: I fill email field and select another element on page
    Given I am on the checkout page
    And fill Email field with "<email>"
    When I select name field
    And wait 1 sec
    Then grablist should have 1 new items
    Then "<email>" should be on the grablist

    Examples:
      | email                |
      | address@domain.co.uk |
      | address@domain.hu    |
      | address@domain.com   |
