@regression
Feature: I am testing hello world printing feature of karate

  @sanity
  Scenario: Printing hello world 1
    Given print "Hello World"

  @sanity
  Scenario: Printing hello world 2
    Given print "Hello World"
