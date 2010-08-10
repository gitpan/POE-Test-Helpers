
use strict;
use warnings;

use Module::Build 0.3601;


my %module_build_args = (
  'build_requires' => {
    'English' => '0',
    'File::Find' => '0',
    'File::Temp' => '0',
    'Module::Build' => '0.3601',
    'MooseX::POE' => '0',
    'POE' => '0',
    'POE::Kernel' => '0',
    'Test::Exception' => '0'
  },
  'configure_requires' => {
    'ExtUtils::MakeMaker' => '6.31',
    'Module::Build' => '0.3601'
  },
  'dist_abstract' => 'Testing framework for POE',
  'dist_author' => [
    'Sawyer X <xsawyerx@cpan.org>'
  ],
  'dist_name' => 'POE-Test-Helpers',
  'dist_version' => '1.08',
  'license' => 'perl',
  'module_name' => 'POE::Test::Helpers',
  'recommends' => {},
  'recursive_test_files' => 1,
  'requires' => {
    'Carp' => '0',
    'Data::Validate' => '0',
    'List::AllUtils' => '0',
    'Moose::Role' => '0',
    'POE::Session' => '0',
    'Test::Builder::Module' => '0',
    'Test::Deep' => '0',
    'Test::Deep::NoTest' => '0',
    'Test::More' => '0',
    'indirect' => '0',
    'namespace::autoclean' => '0',
    'parent' => '0',
    'strictures' => '1'
  },
  'script_files' => []
);


my $build = Module::Build->new(%module_build_args);

$build->create_build_script;
