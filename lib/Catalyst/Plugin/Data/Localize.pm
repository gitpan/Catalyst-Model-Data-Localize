# $Id: /mirror/coderepos/lang/perl/Catalyst-Model-Data-Localize/trunk/lib/Catalyst/Plugin/Data/Localize.pm 100956 2009-02-20T05:22:15.845815Z daisuke  $

package Catalyst::Plugin::Data::Localize;
use strict;
use warnings;

use Catalyst::Model::Data::Localize;

sub setup {
    my $self = shift;
    $self->NEXT::setup(@_);

    $self->config->{'Plugin::Data::Localize'}{model} ||= 'Data::Localize';
}

sub localize {
    my $self = shift;

    # somehow this seems like a waste to me
    my $model = $self->config->{'Plugin::Data::Localize'}{model};
    $self->model($model)->localize(@_);
}

1;

__END__

=head1 NAME

Catalyst::Plugin::Data::Localize - Add localize() To Your App

=head1 SYNOPSIS

    # in your app
    package MyApp;
    use Catalyst (
        # amon other things...
        'Data::Localize'
    );

    # in your model
    package MyApp::Model::Data::Localize;
    use base qw(Catalyst::Model::Data::Localize);

    # else where in your app
    $string = $c->localize($key, @args);

=head1 DESCRIPTION

Catalyst::Plugin::Data::Localize is a very thin wrapper around 
Catalyst::Model::Data::Localize. You only need this if you want to call
localize on the context object.

This module exists mainly to be a stop-gap bridge for people already using
Catalyst::Plugin::I18N. If you can get away with it, you might want to deal 
with Catalyst::Model::Data::Localize directly instead:

    # in your controller
    $c->stash->{localize} = $c->model('Data::Localize');

    # in your template
    [% localize.loc(key) %]

=head1 AUTHOR

Daisuke Maki C<< <daisuke@endeworks.jp> >>

=head1 LICENSE

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

See http://www.perl.com/perl/misc/Artistic.html

=cut