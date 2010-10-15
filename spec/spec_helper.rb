# -*- encoding: utf-8 -*-

require 'proof'

def contents(filename)
  File.read(File.join('spec', 'files', filename))
end
