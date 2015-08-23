#! /usr/bin/perl

use warnings;
use strict;

use Term::UI;
use Term::ReadLine;

# This defines the questions that are asked of the User and how, through decisions,
# the user will be guided through entering the appropriate information for recording
# a new brew to the database. This will also define how the user can then access said
# data.
#
# Imagined Start Screen
#
# Welcome Screen and Login
# ========================
# Welcome barista!
#
# Before we begin, I must know who you are.
#
# Taylor, is that you? Or is it someone else?
#
#
# Main Menu
# =======================
# What can I help you with?
# 
# 1) Enter a new coffee brew            # -> Recording a brew
# 2) Tell me about my previous brews    # -> Looking up previous brews by factor(s)
# 3) Show me a drink I would like       # -> Describes the ideal brew variables based on historical data
#
#

my $barista;                # Setting my user, otherwise known as the barista who made coffee 
my @actions = ("Login");    # Plan is to use this to store the movements made through the UI for intelligently returning to previous pages
my $page;                   # Setting current page
my $last_page;              # Setting previous page for using "return to last page"
my $continuing = 1;         # Program continues to run as long as this is equal to 1. Setting to 0 will shut everything down

my %translations =          # Defining the subroutines that handle each action from the user. May change, but have not found a better idea yet
(
    "Login"                     =>  "login_prompt",
    "Return to previous page"   =>  "return",
    "Return to main menu"       =>  "main_menu",
    "Record a brew"             =>  "create_brew",
    "Logout"                    =>  "logout",
);

# Use a looping mechanism to progress through the UI
# iter1 -> login as Taylor -> iter2 -> selected action -> iter3 -> selected action ...
# Not sure how other programs have handled such things, will have to look into it

while ( $continuing )
{
    no strict "refs";

    print "\033[2J";    # Clears the terminal screen for aesthetics and ease of use

    my $action = $translations{$actions[-1]}();
    push @actions, $action; #$translations{$actions[-1]};



};








# Welcome message and user login

sub login_prompt
{
    print "\n\n\n\nWelcome, barista!\n\n\n\n";
    print "Before we begin, I must know who you are.\n\n";

    my $term = Term::ReadLine->new('login');

    $barista = $term->get_reply(
                prompt  => "Who am I assisting today?",
                choices => ['Taylor', 'An old brewer', 'A new face'],
                default => 'Taylor',
            );

    return "Return to main menu";
};

sub main_menu
{
    print "\n\n\n
           MAIN MENU\n
           ===================\n\n\n";       #need to utilize sprintf here for proper formatting, will worry about later
    print "Welcome $barista, what can I help you with?\n\n";

    my $term = Term::ReadLine->new('main menu');

    $term->get_reply(
        prompt  =>  "What can I help you with?",
        choices =>  [   'Record a brew',
                        'Tell me about an old brew',
                        'Show me the best brew I can make',
                        'Logout',
                    ],
        default => 'Record a brew',
    );

};

sub create_brew
{
    print "recording your first brew!!!!\n\n";
    $continuing--;

};











1;
