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
  split("1.2, 5.1, 2.1", _inputs, ", ")
  split("3.1, 2.1, 8.7", _weights, ", ")
  _bias = 3.0
  _dot_result = ""
  for (_key in _weights) {
    _dot_result = _dot_result + _inputs[_key] * _weights[_key]
  }
  _result = _dot_result + _bias
}
