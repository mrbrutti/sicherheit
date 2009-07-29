require 'base'

module Sicherheit
  class Base
    include Base::Callbacks, Base::Session
  end
end
