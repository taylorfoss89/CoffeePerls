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

my $barista;    # Setting my user, otherwise known as the barista who made coffee 
my $action;     # not sure, may need to know what my current action is to know who and what I am 
my $page;       # Setting current page
my $last_page;  # Setting previous page for using "return to last page"




# Welcome message and user login

sub login_prompt
{
    print "Welcome, barista!\n\n\n\n";
    print "Before we begin, I must know who you are.\n\n";

    $barista = $term->get_reply(
                prompt  => "Who am I assisting today?",
                choices => ['Taylor', 'An old brewer', 'A new face'],
                default => 'Taylor',
            );

};

sub main_menu
{
    print "\n\n\n
           MAIN MENU\n
           ===================\n\n\n";       #need to utilize sprintf here for proper formatting, will worry about later
    

