package OC::SNMP::OidSort;

#use 5.008008;
use strict;
use warnings;

require Exporter;
require DynaLoader;

our @ISA = qw(Exporter DynaLoader);

# Items to export into callers namespace by default. Note: do not export
# names by default without a very good reason. Use EXPORT_OK instead.
# Do not simply export all your public functions/methods/constants.

# This allows declaration	use OC::SNMP::OidSort ':all';
# If you do not need this, moving things directly into @EXPORT or @EXPORT_OK
# will save memory.
our %EXPORT_TAGS = ( 'all' => [ qw(
	oid_sort     cmp_oid	
) ] );

our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

our @EXPORT = qw(
	
);

our $VERSION = '0.2';

bootstrap OC::SNMP::OidSort $VERSION;

# Preloaded methods go here.

1;
__END__

=head1 NAME

OC::SNMP::OidSort - Perl extension for fast oid sorting

=head1 SYNOPSIS

  use OC::SNMP::OidSort;
  my @sorted_oids = sort { cmp_oid($a,$b) } @oids
  #inplace sort
  oid_sort(\@oids)
  
=head1 DESCRIPTION

 

=head2 EXPORT

cmp_oid($oid1,$oid2)
oid_sort(\@oids)

=head1 SEE ALSO

=head1 AUTHOR

Dimo Kiryakov, E<lt>dimo.kiryakov@opencode.comE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2011 by Dimo Kiryakov

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.8.8 or,
at your option, any later version of Perl 5 you may have available.


=cut
