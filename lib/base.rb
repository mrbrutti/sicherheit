require 'base'

module Sicherheit
  class Base
    include Base::Callbacks Base::SSH 
  end
end
