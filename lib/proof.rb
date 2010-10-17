
# Requires items from the main Proof module
require File.join(File.dirname(File.expand_path(__FILE__)), 'proof', 'application')
require File.join(File.dirname(File.expand_path(__FILE__)), 'proof', 'report')
require File.join(File.dirname(File.expand_path(__FILE__)), 'proof', 'report_builder')
require File.join(File.dirname(File.expand_path(__FILE__)), 'proof', 'version')

# Requires items from the Proof::Content module 
require File.join(File.dirname(File.expand_path(__FILE__)), 'proof', 'content', 'analyzer')
require File.join(File.dirname(File.expand_path(__FILE__)), 'proof', 'content', 'summary')

# Requires items from the Proof::Formula module 
require File.join(File.dirname(File.expand_path(__FILE__)), 'proof', 'formula', 'fog')
require File.join(File.dirname(File.expand_path(__FILE__)), 'proof', 'formula', 'flesch')
