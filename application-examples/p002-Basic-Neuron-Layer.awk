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

  print "--weight-rows='" stringify_array(_weight_rows, _neuron_separator) "'"
  print "\tWeights for each input\n"

  print "> Note, --weight-rows lists should be of the same length as inputs\n"

  print "--biases='" stringify_array(_biases, _neuron_separator) "'"
  print "\tBias applied to sum of all inputs * weights\n"

  print "--field-separator='" FS "'"
  print "\tField separator between inputs and weights\n"
  print "> Note, separator must be assigned before weights to effect both\n"

  print "--neuron-separator='" _neuron_separator "'"
  print "\tField separator between neuron configs\n"

  print "> Note, neuron separator must be assigned befor weight rows and biases to effect both\n"

  print "--verbose"
  print "\tDisplay debugging information\n"

  print "--usage"
  print "\tDisplay this message and exit\n"

  print "Examples..."
  print "#1 Single set of inputs"
  print "echo '1.0 2.0 3.0 2.5' |", ENVIRON["_"], "--weight-rows='" stringify_array(_weight_rows, _neuron_separator) "'\\"
  print " --biases='" stringify_array(_biases, _neuron_separator) "'\n"

  print "#2 Multiple (sequential) inputs"
  print ENVIRON["_"], "--weight-rows='" stringify_array(_weight_rows, _neuron_separator) "'\\"
  print " --biases='" stringify_array(_biases, _neuron_separator) "' <<EOF"
  print "1.0 2.0 3.0 2.5"
  print "1.3 6.1 2.5 1.2"
  print "3.1 0.3 4.2 2.2"
  print "EOF\n"

  print "#3 CSV input file"
  print ENVIRON["_"], "--weight-rows='" stringify_array(_weight_rows, _neuron_separator) "'\\"
  print " --biases='" stringify_array(_biases, _neuron_separator) "'\\"
  print " path/to/file.csv"
}


BEGIN {
  ## Set defaults...
  _neuron_separator = "; "

  delete _biases[0]
  split("2.0; 3.0; 0.5", _biases, _neuron_separator)

  delete _weight_rows[0]
  split("0.2 0.8 -0.5 1.0; 0.5 -0.91 0.26 -0.5; -0.26 -0.27 0.17 0.87", _weight_rows, _neuron_separator)


  ## Parse arguments...
  for (i = 1; i < ARGC; i++) {

    if (ARGV[i] ~ "^--field-separator=") {
      FS = substr(ARGV[i], 20)
      delete ARGV[i]
    }

    if (ARGV[i] ~ "^--neuron-separator=") {
      _neuron_separator = substr(ARGV[i], 20)
      delete ARGV[i]
    }

    if (ARGV[i] ~ "^--weight-rows=") {
      delete _weight_rows[0]
      _str_weights = substr(ARGV[i], 15)
      split(_str_weights, _weight_rows, _neuron_separator)
      delete ARGV[i]
    }

    if (ARGV[i] ~ "^--biases=") {
      delete _biases[0]
      _str_biases = substr(ARGV[i], 10)
      split(_str_biases, _biases, _neuron_separator)
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
    print "# Field separator -> '" FS "'"
    print "# Neuron separator -> '" _neuron_separator "'"
    print "# Weights ->", stringify_array(_weight_rows, _neuron_separator)
    print "# Biases ->", stringify_array(_biases, _neuron_separator)
  }
}


{
  _layer_results = ""
  for (_key in _weight_rows) {
    delete _weights[0]
    split (_weight_rows[_key], _weights, FS)
    _bias = _biases[_key]

    if (_verbose) {
      print "# Input loop: _weight_rows[" _key "] ->", _weight_rows[_key]
      print "# Input loop: _biases[" _key "] ->", _biases[_key]
    }

    _neuron_result = neuron(_weights, _bias)
    if (_layer_results) {
      _layer_results = _layer_results _neuron_separator _neuron_result
    } else {
      _layer_results = _neuron_result
    }
  }

  print _layer_results
}
