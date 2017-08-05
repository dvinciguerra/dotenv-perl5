
# perl version
requires 'perl', '>= 5.14.1';


# for exceptions
requires 'Try::Tiny';


# test environment
on 'test' => sub {
  requires 'Test::Spec';
  recommends 'Carton';
};

# develop environment
on 'develop' => sub {
  recommends 'Carton';
  recommends 'Dist::Zilla';
  recommends 'Dist::Zilla::Plugin::Prereqs::FromCPANfile';
};

