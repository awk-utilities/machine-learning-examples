#!/usr/bin/awk -f


## Associated YT NNFS tutorial: https://www.youtube.com/watch?v=Wo5dMEP_BbI

## MIT License
##
## Copyright (c) 2020 Harrison
##
## Permission is hereby granted, free of charge, to any person obtaining a copy
## of this software and associated documentation files (the "Software"), to deal
## in the Software without restriction, including without limitation the rights
## to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
## copies of the Software, and to permit persons to whom the Software is
## furnished to do so, subject to the following conditions:
##
## The above copyright notice and this permission notice shall be included in all
## copies or substantial portions of the Software.
##
## THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
## IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
## FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
## AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
## LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
## OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
## SOFTWARE.


BEGIN {
  split("1.0, 2.0, 3.0, 2.5", _inputs, ", ")
  split("0.2, 0.8, -0.5, 1.0; 0.5, -0.91, 0.26, -0.5; -0.26, -0.27, 0.17, 0.87", _weight_rows, "; ")
  split("2.0; 3.0; 0.5", _biases, "; ")
  split("1.0, 2.0, 3.0, 2.5", _inputs, ", ")

  _layer_results = ""
  for (_neuron_key in _weight_rows) {
    split(_weight_rows[_neuron_key], _weights, ", ")
    _bias = _biases[_neuron_key]
    _dot_result = ""
    for (_key in _weights) {
      _dot_result = _dot_result + _inputs[_key] * _weights[_key]
    }
    _neuron_result = _dot_result + _bias

    if (length(_layer_results)) {
      _layer_results = _layer_results "; " _neuron_result
    } else {
      _layer_results = _neuron_result
    }
  }

  print _layer_results
}
