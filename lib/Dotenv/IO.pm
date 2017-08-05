package Dotenv::IO;

use IO::File;

sub slurp {
  my $self = shift;

  my $content;
  my $io = IO::File->new;
  if ($io->open(@_)) {
    $content = join '', <$io>;
    $io->close;
  }
  return $content;
}

1;
