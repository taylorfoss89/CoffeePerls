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
        # Lenient, for now, on requiring all arguments to be filled in. This may change
        # as the program grows. Brew_db does not set any requirements on values not
        # equalling "null", except for the brew_number, which is auto-incremented and 
        # handled by SQL, not by the user.
            _barista            => $arg{barista}                || "null",
            _bitterness         => $arg{bitterness}             || "null",
            #_brew_number        => SQL_magix,            Either set by SQL, or auto incremented as part of Coffee class??
            _brew_time          => $arg{brew_time}              || "null",
            _coffee_bean        => $arg{coffee_bean}            || "null",
            _coffee_quantity    => $arg{coffee_quantity}        || "null",
            _coffee_grind_size  => $arg{coffee_grind_size}      || "null",
            _date               => $arg{date}                   || "null",
            _device             => $arg{device}                 || "null",
            _flavors            => $arg{flavors}                || "null",
            _mouthfeel          => $arg{mouthfeel}              || "null",
            _rating             => $arg{rating}                 || "null",
            _strength           => $arg{strength}               || "null",
            _successful_brew    => $arg{strength}               || "null",
            _sweetness          => $arg{sweetness}              || "null",
            _water_quantity     => $are{water_quantity}         || "null",
            _water_temperature  => $arg{water_temperature}      || "null",
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
