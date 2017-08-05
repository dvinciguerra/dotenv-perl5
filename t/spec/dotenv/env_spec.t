use 5.14.1;
use Test::Spec;

use Dotenv::Env;

describe "Dotenv::Env" => sub {

  describe "->set" => sub {
    it "does set a key and value to \%ENV" => sub {
      Dotenv::Env->set('FOOTEST', 'bar');
      ok($ENV{FOOTEST} eq 'bar');
    };
  };

  describe "->get" => sub {
    it "does get a value by a value from \%ENV" => sub {
      $ENV{FOOTEST} = 'bar';
      ok(Dotenv::Env->get('FOOTEST') eq 'bar');
    };
  };

  describe "->all" => sub {
    it "does get all key and values from \%ENV" => sub {
      my $env = Dotenv::Env->all;
      ok(defined $env->{USER} && defined $env->{HOME});
    };
  };

};

runtests unless caller;
