use utf8;
package Brew::Schema::Result::Brew;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Brew::Schema::Result::Brew

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<brew>

=cut

__PACKAGE__->table("brew");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 device

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 water_qty

  data_type: 'decimal'
  is_nullable: 1
  size: [4,2]

=head2 coffee_qty

  data_type: 'decimal'
  is_nullable: 1
  size: [4,2]

=head2 stirred

  data_type: 'tinyint'
  is_nullable: 1

=head2 bloomed

  data_type: 'tinyint'
  is_nullable: 1

=head2 coffee_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=head2 barista_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=head2 rating

  data_type: 'integer'
  is_nullable: 1

=head2 mouthfeel

  data_type: 'integer'
  is_nullable: 1

=head2 sweetness

  data_type: 'integer'
  is_nullable: 1

=head2 bitterness

  data_type: 'integer'
  is_nullable: 1

=head2 strength

  data_type: 'integer'
  is_nullable: 1

=head2 successful_brew

  data_type: 'tinyint'
  is_nullable: 1

=head2 grind_size

  data_type: 'integer'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "device",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "water_qty",
  { data_type => "decimal", is_nullable => 1, size => [4, 2] },
  "coffee_qty",
  { data_type => "decimal", is_nullable => 1, size => [4, 2] },
  "stirred",
  { data_type => "tinyint", is_nullable => 1 },
  "bloomed",
  { data_type => "tinyint", is_nullable => 1 },
  "coffee_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
  "barista_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
  "rating",
  { data_type => "integer", is_nullable => 1 },
  "mouthfeel",
  { data_type => "integer", is_nullable => 1 },
  "sweetness",
  { data_type => "integer", is_nullable => 1 },
  "bitterness",
  { data_type => "integer", is_nullable => 1 },
  "strength",
  { data_type => "integer", is_nullable => 1 },
  "successful_brew",
  { data_type => "tinyint", is_nullable => 1 },
  "grind_size",
  { data_type => "integer", is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 barista

Type: belongs_to

Related object: L<Brew::Schema::Result::Barista>

=cut

__PACKAGE__->belongs_to(
  "barista",
  "Brew::Schema::Result::Barista",
  { id => "barista_id" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "RESTRICT",
    on_update     => "RESTRICT",
  },
);

=head2 coffee

Type: belongs_to

Related object: L<Brew::Schema::Result::Coffee>

=cut

__PACKAGE__->belongs_to(
  "coffee",
  "Brew::Schema::Result::Coffee",
  { id => "coffee_id" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "RESTRICT",
    on_update     => "RESTRICT",
  },
);


# Created by DBIx::Class::Schema::Loader v0.07043 @ 2015-08-19 15:43:30
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:/Ninpo3t6mnIKKt0tz3I1g


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
