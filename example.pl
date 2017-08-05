use 5.14.1;


use IO::File;
use Data::Dumper;

sub load {
  my ($self, @paths) = @_;

  for my $path (@paths) {
    my $io = IO::File->new;

    if($io->open($path)){
      say Dumper map {
          my ($key, $value) = m/^([A-Za-z0-9_\-]+)=(.*)$/;
          $ENV{$key} = $value;
      } grep !/^\s*$/, map {
        chomp;      # remove new lines
        s/#.*//g;   # remove comments
        s/\$\{([A-Za-z0-9_\-]+)\}/$ENV{$1}/g; # convert variables to $ENV{}
        $_
      } <$io>;

        #say $lines;
      $io->close;
    }
  }

}


load('Dotenv', 't/example.env');
map { say "$_ => $ENV{$_}" } sort keys %ENV
