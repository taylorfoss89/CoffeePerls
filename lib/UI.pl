#! /usr/bin/perl

use warnings;
use strict;

use Brew::Schema qw();

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

my $schema = Brew::Schema->connect( 'dbi:mysql:dbname=brew_db:127.0.0.1:13306', 'taylor', 'password');

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
    print "\033[0;0H";  # Go to (0,0)
    print "\n\n\n";

    my $action = $translations{$actions[-1]}();
    push @actions, $action; #$translations{$actions[-1]};



};



# Welcome message and user login

sub login_prompt
{
    print "Welcome, barista!\n\n\n\n";
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
    print "\t\tMAIN MENU\n=====================\n\n\n";       #need to utilize sprintf here for proper formatting, will worry about later
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
    # Need to add code here for creating a new brew, this is where the user will add information that will be processed for pushing to the SQL database
    my %brew_characteristics =
    {
        rate => 
            {
                brew_rating => "How was your coffee?",
                sweetness   => "How sweet was your coffee?",
                mouthfeel   => "How was the mouthfeel of your coffee?",
                acidity     => "How acidic was your coffee?",
                body        => "How much body did your coffee have?",
                bitterness  => "How bitter was your coffee?",
                finish      => "How did your coffee finish?",
                clean       => "How clean was your coffee?",
                savory      => "How savory was your coffee?",
            },
        multiple_choice =>
            {
                "Which brew method did you use?"    =>
                            [               #these answers need to be replaced by something that intelligently identifies all of my subclasses of coffee and spits them out
                                'Aeropress',
                                'siphon',
                                'espresso',
                                'V60',
                                'Chemex',
                                'Melitta',
                                'Kalita Wave',
                                'moka pot',
                                'french press',
                            ],
            },
    };

    # These characteristics are attributes of the brew subclasses and should relocated to such. Need to ask Erik about best way to organize class-based information like these





    # Figure out what type of question is being asked and build the ReadTerm prompt/answers accordingly
    foreach my $question_type ( keys $brew_characteristics )
    {
        foreach my $question ( keys $brew_characteristics{$question_type} )
        {
            if ( $question_type eq 'rate' )                     # Ensure that we are checking 'rate' questions
            {
                my %census  =
                    {
                        prompt  =>  "$brew_characteristics{$characteristic}\t",
                        allow   =>  [1,2,3,4,5,6,7,8,9,10],  
                    };
            }
            elsif ( $question_type eq 'multiple_choice' )       # Ensure that we are checking 'multiple_choice' questions
            {
                    my %census  =
                        {
                            prompt  =>  "$brew_characteristics{$question_type}{$question}\t",
                            allow   =>  $brew_characteristics{$question_type}{$question},
                        };
            }
            elsif ( $question_type eq 'free_form' )             # Ensure that we are checking 'free_form' questions
            {
                my %census  =
                    {
                        prompt  =>  "$brew_characteristics{$question_type}{$question}\t",
                        #allow   =>  $brew_characteristics{$question_type}{$question},
                    };
            };
        };
    }


sub ask_question
{
    # Now it is its own method for reusability and cleanliness
    my %read_line_stuffs = shift;

    # Build the ReadLine prompt and allowable answers here
    my $brew_characteristic_term = Term::ReadLine->new( "$brew_chacteristic{$name}" );
    my $brew_chacteristic = $brew_characteristic_term->get_reply( %read_line_stuffs );
};




    my $coffee_brew = $schema->resultset('Brew')->create(
        {
            device => 'Aeropress',
            sweetness => $sweetness,

        });
    
    if ( $coffee_brew->in_storage() ) {
        print "recording your first brew!!!!\n\n";
    };

    $continuing--;

};


