package Dotenv;

# ABSTRACT: Dotenv - port of ruby community dotenv gem

# VERSION
our $VERSION = '0.0.1';

use 5.14.1;
use strict;
use warnings;

use Dotenv::IO;
use Dotenv::Env;

sub load {
  my ($self, @paths) = @_;
  push @paths, '.env'  unless $self->_contains_envfile(@paths);
  $self->_process_file($_) for @paths;
}

# process .env file
sub _process_file {
  my ($self, $path) = @_;
  my $content = Dotenv::IO->slurp($path);

  map   { $self->_set_key_value($_) } grep $self->_remove_blank($_),
    map { $self->_remove_comment($_) } $self->_each_row($content);
}

# content as row list
sub _each_row {
  return split /\n/, $_[1];
}

# set key|value to env variables
sub _set_key_value {
  my ($key, $value) = ($_[1] =~ m/^([A-Za-z0-9_\-]+)=(.*)$/);
  return Dotenv::Env->set($key, $value);
}

# remove blank lines
sub _remove_blank {
  return $_[1] !~ /^\s*$/;
}

# remove line comments
sub _remove_comment {
  $_[1] =~ s/#.*//g;
  return $_[1];
}

sub _contains_envfile {
  my ($self, @paths) = @_;
  return int grep /^\.env$/, @paths;
}

1;
