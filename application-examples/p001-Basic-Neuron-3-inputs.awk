#!/usr/bin/awk -f


## Complex Awk script for learning Machine Learning basics
## Copyright (C) 2020 S0AndS0
##
## This program is free software: you can redistribute it and/or modify
## it under the terms of the GNU Affero General Public License as published
## by the Free Software Foundation, version 3 of the License.
##
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU Affero General Public License for more details.
##
## You should have received a copy of the GNU Affero General Public License
## along with this program.  If not, see <https://www.gnu.org/licenses/>.


function stringify_array(_array, _separator) {
  if (!_separator) {
    _separator = FS
  }

  _stringify_array_results = ""
  for (_key in _array) {
    if (_verbose) {
      print "# stringify_array: _array[" _key "] ->", _array[_key]
    }

    if (length(_stringify_array_results)) {
      _stringify_array_results = _stringify_array_results _separator _array[_key]
    } else {
      _stringify_array_results = _array[_key]
    }
  }

  return _stringify_array_results
}


function neuron(_weights, _bias) {
  _neuron_results = ""

  if (_verbose) {
    print "# neuron: _bias ->", _bias
  }

  for (_key in _weights) {
    if (_verbose) {
      print "# neuron: _weights[" _key "] ->", _weights[_key]
    }

    _neuron_results = _neuron_results + ($_key * _weights[_key])
  }

  return _neuron_results + _bias
}


function usage() {
  print ENVIRON["_"] ": Creates a basic neuron with 3 inputs."
  print "Associated YT NNFS tutorial: https://www.youtube.com/watch?v=Wo5dMEP_BbI"
  print "Code author: https://github.com/S0AndS0\n"

  print "--weights='" stringify_array(_weights) "'"
  print "\tWeights for each input\n"

  print "> Note, --weights lists should be of the same length as input lines\n"

  print "--bias='" _bias "'"
  print "\tBias applied to sum of all inputs * weights\n"

  print "--field-separator='" FS "'"
  print "\tField separator between inputs, and possibly weights\n"
  print "> Note, separator must be assigned before weights to effect both\n"

  print "--verbose"
  print "\tDisplay debugging information\n"

  print "--usage"
  print "\tDisplay this message and exit\n"

  print "Examples..."
  print "#1 Single set of inputs"
  print "echo '1.2 5.1 2.1' |", ENVIRON["_"] "\n"

  print "#2 Multiple (sequential) inputs"
  print ENVIRON["_"], "--weights='" stringify_array(_weights) "'\\"
  print " --bias='" _bias "' <<EOF"
  print "1.2 5.1 2.1"
  print "1.3 6.1 2.5"
  print "3.1 0.3 4.2"
  print "EOF\n"

  print "#3 CSV input file"
  print ENVIRON["_"], "--field-separator='" FS "'\\"
  print " --weights='" stringify_array(_weights) "'\\"
  print " --bias='" _bias "'\\"
  print " path/to/file.csv"
}


BEGIN {
  ## Set defaults...
  _bias = 3.0

  delete _weights[0]
  split("3.1 2.1 8.7", _weights, FS)


  ## Parse arguments...
  for (i = 1; i < ARGC; i++) {
    if (ARGV[i] ~ "^--field-separator=") {
      FS = substr(ARGV[i], 20)
      delete ARGV[i]
    }

    if (ARGV[i] ~ "^--weights=") {
      _str_weights = substr(ARGV[i], 11)
      split(_str_weights, _weights, FS)
      delete ARGV[i]
    }

    if (ARGV[i] ~ "^--bias=") {
      _bias = substr(ARGV[i], 8)
      delete ARGV[i]
    }

    if (ARGV[i] == "--verbose") {
      _verbose = "true"
      delete ARGV[i]
    }

    if (ARGV[i] == "--usage") {
      _usage = "true"
      delete ARGV[i]
    }
  }


  if (_usage) {
    usage()
    exit 0
  }

  if (_verbose) {
    print "Field separator -> '" FS "'"
    print "Weights ->", stringify_array(_weights)
    print "Bias ->", _bias
  }
}


## Loop over each line of input stream
{
  if (_verbose) {
    print "Inputs ->", $0
  }

  print neuron(_weights, _bias)
}
