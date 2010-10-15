# -*- encoding: utf-8 -*-

require 'proof'

def contents(filename)
  File.read(File.join('spec', 'files', filename))
end

def get_template(filename)
  File.read(File.join('layouts', filename))  
end

# FIXME: This should be cleverer
def mock_summaries()
  summaries = []
end