require 'rubygems'
require 'bundler/setup'

Bundler.require(:default)

use Rack::ConditionalGet
use Rack::ETag

require 'nesta/env'
Nesta::Env.root = ::File.expand_path('.', ::File.dirname(__FILE__))

require 'nesta/app'

use Rack::Rewrite do
  r301 %r{^/whenweplay(\?.*)?}, '/pickup$1'
  r301 %r{^/rasul(\?.*)?}, '/leagues/rasul$1'
  r301 %r{^/content/saturday-pickup(\?.*)?}, '/pickup/weekend$1'
  r301 %r{^/node/10(\?.*)?}, '/red-hots$1'
  r301 %r{^/node/2(\?.*)?}, '/leagues/raful$1'
  r301 %r{^/red-hot-hat-2012(\?.*)?}, '/tournaments/red-hot-hat$1'
  r301 %r{^/calendar(\?.*)?}, '/$1'
  r301 %r{^/content/turkey-toss(\?.*)?}, '/tournaments/turkey-toss$1'
end

run Nesta::App
