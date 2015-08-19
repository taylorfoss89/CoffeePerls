use utf8;
package Brew::Schema::Result::Country;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Brew::Schema::Result::Country

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<country>

=cut

__PACKAGE__->table("country");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 full_name

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 abbreviated_name

  data_type: 'varchar'
  is_nullable: 1
  size: 3

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "full_name",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "abbreviated_name",
  { data_type => "varchar", is_nullable => 1, size => 3 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 coffees

Type: has_many

Related object: L<Brew::Schema::Result::Coffee>

=cut

__PACKAGE__->has_many(
  "coffees",
  "Brew::Schema::Result::Coffee",
  { "foreign.country_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07043 @ 2015-08-19 15:43:30
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:6OHuEFl9FBe1e3vSe5L7FQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
