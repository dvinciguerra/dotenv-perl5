use 5.14.1;
use Test::Spec;

use Dotenv;

describe "Dotenv" => sub {

  describe 'version number' => sub {
    it "does be defined" => sub {
      ok $Dotenv::VERSION;
    };

    it "does be a valid semver" => sub {
      ok $Dotenv::VERSION =~ /^\d+\.\d+\.\d+$/;
    };
  };

  describe "->load" => sub {
    before 'each' => sub {
      Dotenv->load('t/example.env');
    };

    it "does load a .env file" => sub {
      ok defined $ENV{DOTENV} && $ENV{DOTENV} eq 'loaded';
    };

    it "does add correct values for S3 test" => sub {
      ok defined $ENV{S3_BUCKET} && $ENV{S3_BUCKET} eq 'YOURS3BUCKET';
    };
  };

};

runtests unless caller;
