use 5.14.1;
use Test::Spec;

use Dotenv::IO;

sub load_example {
  open my $fh, 't/example.env';
  my $content = join '', <$fh>;
  close $fh;
  return $content;
}

describe "Dotenv::IO" => sub {

  describe "->slurp" => sub {
    it "does open file and get all content to a string" => sub {
      my $content = Dotenv::IO->slurp('t/example.env');
      my $expected = load_example();
      is $content, $expected;
    };
  };

};

runtests unless caller;
