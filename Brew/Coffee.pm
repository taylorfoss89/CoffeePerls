#! /usr/bin/perl
package Brew::Coffee;
use warnings;
use strict;

@ISA = qw( Brew );

sub new
{
    my $package = shift;
    my $class = ref($package) || $package;
    my %args = @_;
    #$class->_incr_count();
    bless{
            _barista            => $arg{barista},
            _bitterness         => $arg{bitterness},
            _brew_time          => $arg{brew_time},
            _coffee_bean        => $arg{coffee_bean},
            _coffee_quantity    => $arg{coffee_quantity},
            _coffee_grind_size  => $arg{coffee_grind_size},
            _date               => $arg{date},
            _device             => $arg{device},
            _flavors            => $arg{flavors},
            _mouthfeel          => $arg{mouthfeel},
            _rating             => $arg{rating},
            _strength           => $arg{strength},
            _successful_brew    => $arg{strength},
            _sweetness          => $arg{sweetness},
            _water_quantity     => $are{water_quantity},
            _water_temperature  => $arg{water_temperature},
        }, $class;


    sub create_accessor 
    {

         my $self = shift;

         for my $attribute (@_)
         {
            
             no strict "refs";
             no warnings;

             *$attribute = sub
             {

                my $self = shift;

                $self->{$attribute} = shift if @_;
                return $self->{$attribute};

            };

        }
    }

}









1;
