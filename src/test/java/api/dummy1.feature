Feature: Get, Put, Post and Delete API demo

  # Background will be called before each scenario
  Background:
    Given url "https://reqres.in/"

  Scenario: Get request Demo - path param
    When path "/api/users/2"
    And method GET
    Then status 200
    And print response

  Scenario: Get request Demo - query param
    And param page = 2
    When path "/api/users/2"
    And method GET
    Then status 200
    And print response

  Scenario: Post request Demo
    And request {  "email": "eve.holt@reqres.in",  "password": "cityslicka"  }
    When path "/api/login"
    And method POST
    Then status 200
    And print response

  Scenario: Put request Demo
    And request
    """
    {
    "name": "morpheus",
    "job": "zion resident"
    }
    """
    When path "/api/users/2"
    And method PUT
    Then status 200
    And print response




