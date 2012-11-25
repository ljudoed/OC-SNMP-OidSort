# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl OC-SNMP-OidSort.t'

#########################

# change 'tests => 1' to 'tests => last_test_to_print';

use Test::More tests => 1;
BEGIN { use_ok('OC::SNMP::OidSort') };

#########################

# Insert your test code below, the Test::More module is use()ed here so read
# its man page ( perldoc Test::More ) for help writing this test script.

