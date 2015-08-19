use utf8;
package Brew::Schema::Result::Coffee;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Brew::Schema::Result::Coffee

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<coffee>

=cut

__PACKAGE__->table("coffee");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 roast

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 flavor1

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 flavor2

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 flavor3

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 country_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=head2 washed

  data_type: 'tinyint'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "roast",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "flavor1",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "flavor2",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "flavor3",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "country_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
  "washed",
  { data_type => "tinyint", is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 brews

Type: has_many

Related object: L<Brew::Schema::Result::Brew>

=cut

__PACKAGE__->has_many(
  "brews",
  "Brew::Schema::Result::Brew",
  { "foreign.coffee_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 country

Type: belongs_to

Related object: L<Brew::Schema::Result::Country>

=cut

__PACKAGE__->belongs_to(
  "country",
  "Brew::Schema::Result::Country",
  { id => "country_id" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "RESTRICT",
    on_update     => "RESTRICT",
  },
);


# Created by DBIx::Class::Schema::Loader v0.07043 @ 2015-08-19 15:43:30
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:WL3V1l6f4qin4PSi58luvA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
