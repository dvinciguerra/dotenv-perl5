package Dotenv::Env;

sub set {
  my $value = $_[2];
  $value =~ s/\$\{([A-Za-z0-9_\-]+)\}/$ENV{$1}/g; # convert variables to $ENV{}
  return $ENV{$_[1]} = $value;
}

sub get {
  return $ENV{$_[1]};
}

sub all {
  return \%ENV;
}

1;
