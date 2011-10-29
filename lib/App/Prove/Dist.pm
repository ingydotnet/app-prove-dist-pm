##
# name:      App::Prove::Dist
# abstract:  Prove that a Perl Module Dist is Good to Go
# author:    Ingy döt Net <ingy@cpan.org>
# license:   perl
# copyright: 2011

use 5.010;

use Mouse 0.97 ();
use MouseX::App::Cmd 0.08 ();

#------------------------------------------------------------------------------#
package App::Prove::Dist;

our $VERSION = '0.10';

#------------------------------------------------------------------------------#
package App::Prove::Dist::Command;
use App::Cmd::Setup -command;
use Mouse;
extends 'MouseX::App::Cmd::Command';

sub validate_args {}

# Semi-brutal hack to suppress extra options I don't care about.
around usage => sub {
    my $orig = shift;
    my $self = shift;
    my $opts = $self->{usage}->{options};
    @$opts = grep { $_->{name} ne 'help' } @$opts;
    return $self->$orig(@_);
};

#-----------------------------------------------------------------------------#
package App::Prove::Dist;
use App::Cmd::Setup -app;
use Mouse;
extends 'MouseX::App::Cmd';

use Module::Pluggable
  require     => 1,
  search_path => [ 'App::Prove::Dist::Command' ];
App::Prove::Dist->plugins;

#------------------------------------------------------------------------------#
package App::Prove::Dist::Command::xxx;
App::Prove::Dist->import( -command );
use Mouse;
extends 'App::Prove::Dist::Command';

use constant abstract => '...';
use constant usage_desc => 'prove-dist xxx ...';

has yyy => (
    is => 'ro',
    isa => 'Str',
    documentation => '...',
);

sub execute {
    my ($self, $opt, $args) = @_;
    ...    
}

#------------------------------------------------------------------------------#
package App::Prove::Dist::Command;

# Common subroutines:

1;

=head1 SYNOPSIS

...

=head1 DESCRIPTION

...
