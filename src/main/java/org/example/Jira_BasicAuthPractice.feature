Feature: Lets see how to use Basic Auth in Karate and call Get API of JIRA

  Background:
    Given def basicAuth =
    """
    function(creds) {
      var temp = creds.username + ':' + creds.password;
      var Base64 = Java.type('java.util.Base64');
      var encoded = Base64.getEncoder().encodeToString(temp.getBytes());
      return 'Basic ' + encoded;
    }
    """

    And header Authorization =  basicAuth({username:'testteam.fullstack@gmail.com', password:'ATATT3xFfGF0Ia0alHE5oOsm02BEoE_M5RuxXcZ52K5Bm3oE2qUkpyIHMA5WMHmj6P9OCI_5n9IoeFbmRe852fLgme27uAD0xfWGvT9jinGDHO3agQg4Wubw9EkD4fwaI-XZMURNNitwusOXMGnl_XoL9_AYonuBqi-nnrFwDVRT6eeH5P5pqrI=79B69C90'})
    And header Accept = "application/json"
    And header Content-Type = "application/json"
    And url "https://learnapi.atlassian.net"

  Scenario: Get API call using basic auth
    Given path "/rest/api/3/issue/SCRUM-1"
    When method get
    Then status 200

  Scenario: Set Issue Assignee to unassignee
    Given path "/rest/api/3/issue/10000/assignee"
    #"accountId": "601801f24e258e006946661c"
    And request
    """
    {
      "accountId": "-1"
    }
    """
    When method put
    Then status 204