# language:en
Feature: output help

    In order to learn the available options
    As a person using Proof
    I want to use the "--help" option

    @announce-output
    Scenario: print usage
        When I run "proof --help"
        Then the output should contain:
        """
        Usage: proof [options] FILE1 FILE2 FILE3
        """

    @announce-cmd
    Scenario: exit status of 0
        When I run "proof --help"
        Then the exit status should be 0
